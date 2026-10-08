<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**用 AI 把视频字幕一键变成双语字幕**

拖入整季视频 → 自动读取内嵌字幕 → AI 翻译成中文对照 → 输出 `.srt`

仅 macOS · 无广告 · 视频与字幕文件不离开本机

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=下载&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=版本&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-14%2B-9E66F2?logo=apple&logoColor=white)](https://www.apple.com/macos/)

</div>

---

## 关注度

<p align="center">
  <a href="https://www.star-history.com/#zhengxiexie/aisub&type=Date">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=zhengxiexie/aisub&type=date&theme=dark" />
      <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=zhengxiexie/aisub&type=date" />
      <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=zhengxiexie/aisub&type=date" />
    </picture>
  </a>
</p>

---

## 痛点

看一部外语片，想加中文字幕，你会卡在两个地方：

**一、根本找不到字幕。**

片源往往只带图形字幕（PGS 位图），网上找不到匹配的 `.srt`；有些冷门片、刚上映的剧集，字幕组还没出。碰上这种情况，你只能等，或者干脆不看。

**二、就算找到了，时间轴对不上。**

自己找的字幕与你的片源版本对不上 —— 是不是蓝光原盘、是不是加长版、是不是重剪过。开头差两秒、结尾多一集，你得用字幕编辑器一帧帧对、一条条调。一集一小时，整季就是几小时机械劳动。

**这两件事本来不该由你来做。**

如果片源里已经有英文轨（或者任何一条你能读的文本轨），它就是现成的原文。你要做的只是**把它翻译成中文，并对齐到你手上这份视频的时间轴**。

这就是 AISub 做的事。

## 原理

```
拖入视频  →  读取内嵌文本字幕（对齐到该文件自己的时间轴）
          →  AI 翻译成中文
          →  生成双语字幕
```

时间轴不需要你调 —— 字幕是从**你拖进来的这个文件**里读出来的，时间戳天然对齐。

## 亮点

**读 MKV 内嵌字幕快 450 倍**
自研的 Matroska 解析器直接读取文件尾部的 Cues 索引，跳过 99% 的视频载荷。
一个 83 GB 的 4K 原盘，从打开到拿到字幕 **142 分钟 → 19 秒**。

**多语言片源选轨正确**
有些发行版把 30+ 种语言打进同一个文件。AISub 会优先选英语轨；
即使英语轨没写语言标签（只能读到 `und`），也不会退而选中条数最多的法语轨。

**整季批量**
拖入文件夹即可。自动识别 `S01E02` / `第2集` / `E02` 等集数命名，按系列折叠展示进度，支持整季一键取消。

**外挂字幕直接用**
`.srt` / `.ass` / `.ssa` / `.vtt` 拖进去就翻，不需要有视频文件。

**不重复花钱**
已经是双语的文件会自动识别，抽出现有译文，只补没翻的部分 —— 不会越翻越乱。

**不会白等**
断点续传、随时取消（1 秒内响应）、批次失败自动重试并保留已有成果。

**批量翻译更稳**
术语表锁定专有名词译法、跨批次上下文衔接、批次并发 3 路（可调）。

**界面完整**
8 种界面语言（含运行期日志本地化）、浅色/深色模式、首次运行引导、API 连通性自检。

## 下载

从 [Releases 页面](https://github.com/zhengxiexie/aisub/releases/latest) 下载最新版本：

| 文件 | 说明 |
|---|---|
| `AISub-*.dmg` | 推荐，双击安装 |
| `AISub-*.zip` | 同样可用，解压后把 App 拖到「应用程序」 |

## ⚠️ 首次打开需要手动放行

本项目未使用付费的 Apple 开发者证书签名（ad-hoc 签名），macOS 会阻止直接打开。
**这不是故障，按以下任一方式操作即可：**

**方式一（推荐）**：下载后**右键点击 App → 打开**，在弹窗中点「打开」。

**方式二**：在「应用程序」中选中 AISub，右键 → 打开。

**方式三**（终端）：
```bash
xattr -cr /Applications/AISub.app
```

之后即可正常双击启动，不再需要每次放行。

> 已通过 Gatekeeper 验证的 macOS 版本：macOS 14 Sonoma 及以上。

## 使用

1. 打开 AISub，首次运行会引导你填 AI 服务信息
2. 拖入视频或字幕文件（或整个文件夹）
3. 等待完成，输出 `.zh-en.srt` 双语字幕

需要你自己的 AI API Key（支持任何 Anthropic 兼容接口）。
设置页有「测试连接」按钮，配完当场知道对不对。

## 支持的输入

| 类型 | 支持情况 |
|---|---|
| MKV / WebM 文本字幕（SRT/ASS） | ✅ 内置解析，无需 ffmpeg |
| 外挂 `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ 直接读取 |
| MP4 / MOV / AVI 文本字幕 | ✅ 回退 ffmpeg |
| PGS / VobSub 图形字幕 | ❌ 位图需 OCR，本应用不支持 |
| 蓝光 ISO 原盘 | ❌ 同上（PGS-only），建议换片源 |

> **提醒**：如果你的片源只有图形字幕（PGS），那确实没字幕可用 —— 因为原文得先靠 OCR 识别才能翻译。
> 但只要片源带一条文本字幕轨（哪怕是英文、哪怕是法语），AISub 就能拿它作为原文翻译。

## 隐私

- 视频文件**永不**离开你的 Mac —— 解析在本地完成
- 字幕文件也只在本机读取
- 只有字幕**文本**会发送到你配置的 API，用于翻译
- API Key 存储在系统钥匙串（Keychain），非明文
- **App 不做任何用户数据采集** —— 无遥测、无崩溃上报、无第三方分析 SDK

## 已知限制

- PGS 图形字幕需要 OCR，暂不支持
- 翻译质量取决于所用模型
- 图形化的多字幕轨切换暂未提供（自动选择最合适的轨道）

## 更新

应用会检查新版本并提醒你。到 [Releases 页面](https://github.com/zhengxiexie/aisub/releases/latest) 下载新版覆盖即可。

> 旧版 Dualsub 用户：直接覆盖安装即可。API Key、历史记录、术语表、断点缓存会自动迁移，不用重新配置。

## 开发者

源码不公开，本仓库仅用于分发。维护者可运行：

```bash
./release.sh 2.0.0 "更新说明"     # 构建 + 发版 + 验证
python3 Tools/make_icon.py        # 重新生成应用图标
```

关注度数据来自 GitHub 自身的计数（shields.io 与 star-history），App 不做任何用户数据采集。

---

<sub>用 Swift + AppKit 编写 · 无第三方依赖</sub>