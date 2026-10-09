<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**用 AI 為影片字幕一鍵生成雙語字幕**

拖入整季影片 → 自動讀取內嵌字幕 → AI 翻譯成繁體中文對照 → 輸出 `.srt`

僅 macOS · 無廣告 · 影片與字幕檔案不離開本機

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=下載&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=版本&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-14%2B-9E66F2?logo=apple&logoColor=white)](https://www.apple.com/macos/)

</div>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.zh-Hans.md">简体中文</a> ·
  <a href="README.zh-Hant.md">繁體中文</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.ko.md">한국어</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.es.md">Español</a>
</p>

---

## 關注度

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

## 痛點

想看一部外語片，想加中文字幕，你會卡在兩個地方：

**一、根本找不到字幕。**

片源往往只帶圖形字幕（PGS 位圖），網上找不到匹配的 `.srt`；有些冷門片、剛上映的劇集，字幕組還沒出。碰上這種情況，你只能等，或者乾脆不看。

**二、就算找到了，時間軸對不上。**

自己找的字幕與你的片源版本對不上 —— 是不是藍光原盤、是不是加長版、是不是重剪過。開頭差兩秒、結尾多一集，你得用字幕編輯器一幀幀對、一條條調。一集一小時，整季就是幾小時機械勞動。

**這兩件事本來不該由你來做。**

如果片源裡已經有英文軌（或者任何一條你能讀的文字軌），它就是現成的原文。你要做的只是**把它翻譯成中文，並對齊到你手上這份影片的時間軸**。

這就是 AISub 做的事。

## 原理

```
拖入影片  →  讀取內嵌文字字幕（對齊到該檔案自己的時間軸）
          →  AI 翻譯成中文
          →  生成雙語字幕
```

時間軸不需要你調 —— 字幕是從**你拖進來的這個檔案**裡讀出來的，時間戳自然對齊。

## 亮點

**讀 MKV 內嵌字幕快 450 倍**

自研的 Matroska 解析器直接讀取檔案尾部的 Cues 索引，跳過 99% 的影片載荷。
一個 83 GB 的 4K 原盤，從打開到拿到字幕 **142 分鐘 → 19 秒**。

**多語言片源選軌正確**

有些發行版把 30+ 種語言打進同一個檔案。AISub 會優先選英語軌；
即使英語軌沒寫語言標籤（只能讀到 `und`），也不會退而選中條數最多的法語軌。

**整季批次**

拖入資料夾即可。自動識別 `S01E02` / `第2集` / `E02` 等集數命名，按系列摺疊展示進度，整季可一鍵取消。

**多選批次操作**

選中多條任務即可一次性重試、取消或刪除 —— 點擊選中，⌘ 點擊加選，系列頭部可一鍵全選。
底欄和右鍵選單都能觸發。清理 20 集不再要點 20 次。

**重試只補漏的那幾條**

重試只翻譯還沒翻出來的條目，而不是整批重發。四十條裡掛了一條，就只補那一條。
列表裡會直接寫明還剩多少條未翻譯，點重試也不再彈「檔案已存在」——直接覆蓋上次的結果。

**外掛字幕直接用**

`.srt` / `.ass` / `.ssa` / `.vtt` 拖進去就翻，不需要有影片檔案。

**不重複花錢**

已經是雙語的檔案會自動識別，抽出現有譯文，只補沒翻的部分 —— 不會越翻越亂。

**不會白等**

斷點續傳、隨時取消（1 秒內回應）、批次失敗自動重試並保留已有成果。

**批次翻譯更穩**

術語表鎖定專有名詞譯法、跨批次上下文銜接、批次並發 3 路（可調）。

**介面完整**

8 種介面語言（含執行期日誌在地化）、淺色/深色模式、首次執行引導、API 連通性自我檢測。

## 下載

從 [Releases 頁面](https://github.com/zhengxiexie/aisub/releases/latest) 下載最新版本：

| 檔案 | 說明 |
|---|---|
| `AISub-*.dmg` | 推薦，雙擊安裝 |
| `AISub-*.zip` | 同樣可用，解壓後把 App 拖到「應用程式」 |

## ⚠️ 首次開啟需要手動放行

本專案未使用付費的 Apple 開發者憑證簽署（ad-hoc 簽署），macOS 會阻止直接開啟。
**這不是故障，按以下任一方式操作即可：**

**方式一（推薦）**：下載後**右鍵點擊 App → 打開**，在彈窗中點「打開」。

**方式二**：在「應用程式」中選取 AISub，右鍵 → 打開。

**方式三**（終端機）：
```bash
xattr -cr /Applications/AISub.app
```

之後即可正常雙擊啟動，不再需要每次放行。

> 已通過 Gatekeeper 驗證的 macOS 版本：macOS 14 Sonoma 及以上。

## 使用

1. 開啟 AISub，首次執行會引導你填 AI 服務資訊
2. 拖入影片或字幕檔案（或整個資料夾）
3. 等待完成，輸出 `.zh-en.srt` 雙語字幕

需要你自己的 AI API Key（支援任何 Anthropic 相容介面）。
設定頁有「測試連線」按鈕，配完當場知道對不對。

## 支援的輸入

| 類型 | 支援情況 |
|---|---|
| MKV / WebM 文字字幕（SRT/ASS） | ✅ 內建解析，不需 ffmpeg |
| 外掛 `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ 直接讀取 |
| MP4 / MOV / AVI 文字字幕 | ✅ 回退 ffmpeg |
| PGS / VobSub 圖形字幕 | ❌ 位圖需 OCR，本應用不支援 |
| 藍光 ISO 原盤 | ❌ 同上（PGS-only），建議換片源 |

> **提醒**：如果你的片源只有圖形字幕（PGS），那確實沒字幕可用 —— 因為原文得先靠 OCR 識別才能翻譯。
> 但只要片源帶一條文字字幕軌（哪怕是英文、哪怕是法語），AISub 就能拿它作為原文翻譯。

## 隱私

- 影片檔案**永不**離開你的 Mac —— 解析在本機完成
- 字幕檔案也只在本機讀取
- 只有字幕**文字**會發送到你設定的 API，用於翻譯
- API Key 儲存在系統鑰匙串（Keychain），非明文
- **App 不做任何使用者資料採集** —— 無遙測、無當機回報、無第三方分析 SDK

## 已知限制

- PGS 圖形字幕需要 OCR，暫不支援
- 翻譯品質取決於所用模型
- 圖形化的多字幕軌切換暫未提供（自動選擇最合適的軌道）

## 更新

應用程式會檢查新版本並提醒你。到 [Releases 頁面](https://github.com/zhengxiexie/aisub/releases/latest) 下載新版覆蓋即可。

> 舊版 Dualsub 使用者：直接覆蓋安裝即可。API Key、歷史記錄、術語表、斷點快取會自動遷移，不用重新設定。

## 開發者

原始碼不公開，本儲存庫僅用於散布。維護者可執行：

```bash
./release.sh 2.0.0 "更新說明"     # 建置 + 發版 + 驗證
python3 Tools/make_icon.py        # 重新產生應用程式圖示
```

關注度數據來自 GitHub 自身的計數（shields.io 與 star-history），App 不做任何使用者資料採集。

---

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.zh-Hans.md">简体中文</a> ·
  <a href="README.zh-Hant.md">繁體中文</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.ko.md">한국어</a> ·
  <a href="README.fr.md">Français</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <a href="README.es.md">Español</a>
</p>

---

<sub>用 Swift + AppKit 編寫 · 無第三方相依套件</sub>