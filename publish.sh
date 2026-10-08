#!/bin/bash
# 发布 v2.0.0: 打 tag + 创建 Release + 上传安装包
#
# 不用 gh: 本机 DNS 对 api.github.com 间歇性解析失败, gh 会直接卡死。
# 这里改为 curl --resolve 绑定已探测过的可用 IP。
set -euo pipefail
cd "$(dirname "$0")"

VERSION="${1:-2.0.0}"
REPO="zhengxiexie/aisub"

log() { printf '[%s] %s\n' "$(date +%H:%M:%S)" "$*"; }

# ---- 找一个能连通的 api.github.com IP ----
log "探测 api.github.com 可用 IP..."
GH_IP=""
for i in 1 2 3 4 5 6; do
    cand=$(dig +short api.github.com 2>/dev/null | tail -1)
    if [ -n "$cand" ] && curl -s -o /dev/null --resolve "api.github.com:443:$cand" \
        https://api.github.com/ --max-time 8; then
        GH_IP="$cand"; break
    fi
    log "  第 $i 次失败, 重试..."
    sleep 2
done
[ -n "$GH_IP" ] || { log "找不到可用的 api.github.com IP"; exit 1; }
log "  使用 IP: $GH_IP"

TOKEN=$(gh auth token)
AUTH=(-H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.github+json")
API="https://api.github.com"
CURL=(curl -s --resolve "api.github.com:443:$GH_IP" "${AUTH[@]}" --max-time 60)

# ---- 构建 ----
log "构建 v$VERSION"
./build-release.sh "$VERSION" 2>&1 | sed 's/^/    /'

DMG="dist/AISub-$VERSION.dmg"
ZIP="dist/AISub-$VERSION.zip"
[ -f "$DMG" ] || { log "缺少 $DMG"; exit 1; }
[ -f "$ZIP" ] || { log "缺少 $ZIP"; exit 1; }

# ---- 提交 + tag ----
log "提交变更"
git add -A
if ! git diff --cached --quiet; then
    git -c user.name="zhengxiexie" -c user.email="noreply@github.com" \
        commit -q -m "Release v$VERSION"
    log "  已提交"
else
    log "  无变更, 跳过提交"
fi
log "推送"
git push -q origin master
git tag -f "v$VERSION" -m "v$VERSION" >/dev/null
git push -q origin "v$VERSION" --force
log "  tag 已推送"

# ---- Release ----
NOTES_FILE=$(mktemp)
printf '## AISub %s\n\n' "$VERSION" > "$NOTES_FILE"
cat >> "$NOTES_FILE" <<'NOTES'
### 改名

项目更名为 **AISub** —— 核心能力来自 AI 大模型翻译，名字里直接写清楚。
GitHub 仓库已同步改名，旧地址会自动跳转。

### 修复

- **多语言片源选轨错误**：某些发行版把 30+ 种语言打进同一个文件，且英语轨不写语言标签（只能读到 `und`）。旧版本会因此选中条数最多的外语轨（例如法语），拿法语原文去翻成中文，结果完全跑偏。现在优先选英语轨。

### 升级

旧版用户直接覆盖安装即可，API Key 与设置自动迁移。
NOTES

log "创建 Release"
code=$("${CURL[@]}" -X POST "$API/repos/$REPO/releases" \
    -d "$(python3 -c '
import json,sys
print(json.dumps({
    "tag_name": sys.argv[1],
    "name": "AISub " + sys.argv[1],
    "body": open(sys.argv[2]).read(),
    "draft": False,
    "prerelease": False,
}))' "v$VERSION" "$NOTES_FILE")" -w '\n%{http_code}' | tail -1)
if [ "$code" != "201" ]; then
    log "创建失败 HTTP $code"
    exit 1
fi
log "  Release 已创建"

upload_url=$("${CURL[@]}" "$API/repos/$REPO/releases/tags/v$VERSION" | python3 -c '
import json,sys
print(json.load(sys.stdin)["upload_url"])')

for f in "$DMG" "$ZIP"; do
    log "上传 $(basename "$f")"
    up="${upload_url%%\?*}/assets?name=$(basename "$f")"
    r=$("${CURL[@]}" --max-time 300 -X POST -H "Content-Type: application/octet-stream" \
        --data-binary "@$f" "$up" -w '\n%{http_code}' | tail -1)
    if [ "$r" = "201" ]; then log "  ok"; else log "  上传失败 HTTP $r"; exit 1; fi
done

rm -f "$NOTES_FILE"
log ""
log "发布完成: https://github.com/$REPO/releases/tag/v$VERSION"
