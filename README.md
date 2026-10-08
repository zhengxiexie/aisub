<div align="center">

# Dualsub

<img src="logo.png" width="120" alt="Dualsub">

**把视频和字幕文件一键变成双语字幕**

拖入整季视频 → 自动读取内嵌字幕 → 翻译成中文对照 → 输出 `.srt`

仅 macOS · 无广告 · 视频与字幕文件不离开本机

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/dualsub/total.svg)](https://github.com/zhengxiexie/dualsub/releases)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/dualsub.svg)](https://github.com/zhengxiexie/dualsub/releases/latest)

</div>

---

## 为什么做这个

你看一部外语电影，发现只有图形字幕（PGS 位图）没法翻译；或者你有一整季想加中文字幕的剧集，打开字幕编辑器逐集导入、导入、等它跑完。

Dualsub 把这件事压缩成一次拖拽。

## 亮点

**读 MKV 内嵌字幕快 450 倍**
自研的 Matroska 解析器直接读取文件尾部的 Cues 索引，跳过 99% 的视频载荷。
一个 83 GB 的 4K 原盘，从打开到拿到字幕 **142 分钟 → 19 秒**。

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

从 [Releases 页面](https://github.com/zhengxiexie/dualsub/releases/latest) 下载最新版本：

| 文件 | 说明 |
|---|---|
| `Dualsub-*.dmg` | 推荐，双击安装 |
| `Dualsub-*.zip` | 同样可用，解压后把 App 拖到「应用程序」 |

## ⚠️ 首次打开需要手动放行

本项目未使用付费的 Apple 开发者证书签名（ad-hoc 签名），macOS 会阻止直接打开。
**这不是故障，按以下任一方式操作即可：**

**方式一（推荐）**：下载后**右键点击 App → 打开**，在弹窗中点「打开」。

**方式二**：在「应用程序」中选中 Dualsub，右键 → 打开。

**方式三**（终端）：
```bash
xattr -cr /Applications/Dualsub.app
```

之后即可正常双击启动，不再需要每次放行。

> 已通过 Gatekeeper 验证的 macOS 版本：macOS 14 Sonoma 及以上。

## 使用

1. 打开 Dualsub，首次运行会引导你填 AI 服务信息
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

## 隐私

- 视频文件**永不**离开你的 Mac —— 解析在本地完成
- 字幕文件也只在本机读取
- 只有字幕**文本**会发送到你配置的 API，用于翻译
- API Key 存储在系统钥匙串（Keychain），非明文

## 已知限制

- PGS 图形字幕需要 OCR，暂不支持
- 翻译质量取决于所用模型
- 图形化的多字幕轨切换暂未提供（自动选择最合适的轨道）

## 更新

应用会检查新版本并提醒你。到 [Releases 页面](https://github.com/zhengxiexie/dualsub/releases/latest) 下载新版覆盖即可。

---

<sub>用 Swift + AppKit 编写 · 无第三方依赖</sub>