#!/bin/bash
# 一键发布: 构建 → 提交 → 打 tag → 创建 GitHub Release → 上传安装包
#
# 用法:
#   ./release.sh 1.1.0 "本次更新说明"
#   ./release.sh 1.1.0            # 不填说明则用自动生成的
set -euo pipefail
cd "$(dirname "$0")"

VERSION="${1:-}"
NOTES="${2:-}"

if [ -z "$VERSION" ]; then
    echo "用法: ./release.sh <版本号> [更新说明]"
    echo "示例: ./release.sh 1.1.0 \"新增内置播放器\""
    exit 1
fi

if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "版本号格式应为 x.y.z, 当前: $VERSION"
    exit 1
fi

if gh api user --jq .login >/dev/null 2>&1; then
    echo "==> 构建 v$VERSION"
    ./build-release.sh "$VERSION"

    echo "==> 生成更新说明"
    NOTES_FILE=$(mktemp)
    if [ -n "$NOTES" ]; then
        printf '## Dualsub %s\n\n%s\n' "$VERSION" "$NOTES" > "$NOTES_FILE"
    else
        printf '## Dualsub %s\n\n- 详见 [更新日志](https://github.com/zhengxiexie/dualsub/releases)\n' "$VERSION" > "$NOTES_FILE"
    fi

    echo "==> 提交 README 变更"
    git add -A
    if git diff --cached --quiet; then
        echo "    无文件变更, 跳过提交"
    else
        git -c user.name="${GIT_AUTHOR_NAME:-zhengxiexie}" \
            -c user.email="${GIT_AUTHOR_EMAIL:-noreply@github.com}" \
            commit -q -m "Release v$VERSION"
        git push -q origin master
        echo "    已推送"
    fi

    echo "==> 创建 Release"
    gh release create "v$VERSION" \
        "dist/Dualsub-$VERSION.dmg" \
        "dist/Dualsub-$VERSION.zip" \
        --title "Dualsub $VERSION" \
        --notes-file "$NOTES_FILE"

    rm -f "$NOTES_FILE"

    echo ""
    echo "==> 发布完成"
    echo "    https://github.com/zhengxiexie/dualsub/releases/tag/v$VERSION"

    echo "==> 验证匿名可下载"
    sleep 2
    CODE=$(curl -sL -o /dev/null -w "%{http_code}" \
        "https://github.com/zhengxiexie/dualsub/releases/latest/download/Dualsub-$VERSION.dmg" \
        --max-time 90 || echo 000)
    if [ "$CODE" = "200" ]; then
        echo "    OK - 匿名下载可用 (HTTP $CODE)"
    else
        echo "    警告: 匿名下载返回 HTTP $CODE, 请检查 Release 设置"
    fi
else
    echo "未检测到 gh 登录, 仅构建本地安装包"
    ./build-release.sh "$VERSION"
fi