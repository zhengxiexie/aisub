<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**Bilingual subtitles for any video, translated by AI**

Drop in a whole season → read the embedded subtitle track → AI translates it into a
side-by-side bilingual `.srt`

macOS only · No ads · Video and subtitle files never leave your Mac

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=Downloads&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=Release&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
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

## Star History

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

## The Problem

You want to watch a foreign film with Chinese subtitles. You hit two walls:

**One: there is no subtitle file to be found.**

Releases often only carry image-based subtitles (PGS bitmaps), and no matching `.srt`
exists online. For obscure films or brand-new series, subtitle groups simply haven't gotten
to it yet. When that happens you either wait, or you skip the film.

**Two: even when you find one, the timing doesn't match.**

The subtitle you downloaded isn't cut for your exact release — is it the Blu-ray master, the
extended cut, a re-edit? Two seconds off at the start, an extra episode at the end. You end
up nudging cues in a subtitle editor, frame by frame. An hour per episode, a few hours of
mechanical work for a whole season.

**Neither of those should be your job.**

If the file already has an English track — or any text track you can read — that *is* the
original script. All you actually want is to **translate it and align it to the timeline of
the video sitting on your disk.**

That is what AISub does.

## How It Works

```
Drop in video  →  Read the embedded text subtitle track (aligned to that file's own timeline)
              →  AI translates it
              →  Bilingual subtitle out
```

You never have to adjust timing by hand — the subtitles are read from **the very file you
dropped in**, so the timestamps line up by construction.

## Highlights

**Reads embedded MKV subtitles 450× faster**

A hand-written Matroska parser jumps straight to the Cues index at the end of the file,
skipping 99% of the video payload. An 83 GB 4K remux goes from open-to-subtitles in
**142 minutes → 19 seconds**.

**Picks the right track on multilingual releases**

Some releases pack 30+ languages into one file. AISub prefers the English track; and even
when the English track carries no language tag (only `und` is readable), it won't fall back
to the French track just because that one happens to have the most entries.

**Whole seasons in one drop**

Drop a folder. Episode names like `S01E02` / `第2集` / `E02` are detected automatically,
progress is grouped by series, and an entire season can be cancelled at once.

**Batch operations on a whole season at once**

Select multiple tasks — click, ⌘-click to add, or hit select-all on a series header — then
retry, cancel, or delete them all in one action, from the toolbar or the right-click menu.
Ticking off a 20-episode season no longer means twenty separate clicks.

**Sidecar subtitles work on their own**

Drag in `.srt` / `.ass` / `.ssa` / `.vtt` — no video file required.

**You never pay twice**

Already-bilingual files are detected automatically: the existing translation is extracted
and only the untranslated parts are filled in, so repeated runs don't degrade the result.

**No dead waiting**

Resumable checkpoints, cancel any time (responds within a second), failed batches retried
automatically with finished work preserved.

**Retrying costs only what failed**

A retry translates just the entries that are still missing — not the whole batch. When one
line out of forty fails, one line is resent, not forty. The row tells you how many entries
remain untranslated, and pressing retry overwrites the previous partial output without
asking.

**Watch while it translates**

A built-in player with bilingual overlay — open any job and the subtitles appear live over
the video as they come in. No need to export first and open a separate player.

MKV files are remuxed to a cached MP4 on the fly (a stream copy, so no quality loss and no
re-encoding — about two seconds for a 1080p episode). This step needs [ffmpeg](#requirements);
MP4/MOV play directly without it.

**Configure a whole season at once**

Series-level settings for languages, subtitle order and glossary. Twenty episodes no longer
mean twenty trips to the global settings panel.

**ASS output with a tasteful signature**

Export to ASS with styled bilingual subtitles. If you share the file, a 500 ms AISub
signature in the corner lets others find the tool — opt-out in Settings.

**Steadier batch translation**

Glossary locks in terminology for proper nouns, context carries across batches, 3-way batch
concurrency (adjustable).

**Complete interface**

8 interface languages (including localized runtime logs), light/dark mode, first-run
onboarding, API connectivity self-check.

## Download

Get the latest version from the [Releases page](https://github.com/zhengxiexie/aisub/releases/latest):

| File | Notes |
|---|---|
| `AISub-*.dmg` | Recommended, double-click to install |
| `AISub-*.zip` | Same thing, unzip and drag the App into Applications |

## ⚠️ First launch requires manual approval

This project is not signed with a paid Apple Developer certificate (it uses ad-hoc signing),
so macOS will block a direct open. **This is not a malfunction — use any of the following:**

**Method 1 (recommended)**: after downloading, **right-click the App → Open**, then click
"Open" in the dialog.

**Method 2**: select AISub in Applications, right-click → Open.

**Method 3** (terminal):
```bash
xattr -cr /Applications/AISub.app
```

After that you can launch it normally by double-clicking, with no further approvals needed.

> macOS versions verified against Gatekeeper: macOS 14 Sonoma and later.

## Usage

1. Open AISub; on first launch a guide walks you through entering your AI service details
2. Drop in videos or subtitle files (or a whole folder)
3. Wait for it to finish, and you get a `.zh-en.srt` bilingual subtitle

You'll need your own AI API key (any Anthropic-compatible endpoint works). The Settings pane
has a "Test Connection" button, so you know immediately whether it's right.

## Supported Input

| Type | Support |
|---|---|
| MKV / WebM text subtitles (SRT/ASS) | ✅ Built-in parser, no ffmpeg needed |
| Sidecar `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ Read directly |
| MP4 / MOV / AVI text subtitles | ✅ Falls back to ffmpeg |
| PGS / VobSub image subtitles | ❌ Bitmaps need OCR, unsupported |
| Blu-ray ISO images | ❌ Same reason (PGS-only); try another source |

> **Note**: if your release only has image subtitles (PGS), there genuinely is no subtitle to
> work with — the original text has to be recognized via OCR before it can be translated. But
> as long as the file carries one text track (even English, even French), AISub can use that as
> the source script.

## Requirements

ffmpeg is optional for translation but needed for a few features:

| Feature | Needs ffmpeg? |
|---|---|
| MKV/WebM text subtitle extraction | No — built-in parser |
| Sidecar subtitle files (`.srt` / `.ass`) | No |
| MP4/MOV subtitle extraction | Yes |
| Playing MKV in the built-in player | Yes (remuxed to MP4) |
| Embedding subtitles back into a video | Yes |

```bash
brew install ffmpeg
```

AISub finds it on `PATH` automatically, or you can point at a specific path in
Settings → Advanced.

## Privacy

- Video files **never** leave your Mac — parsing happens locally
- Subtitle files are read locally as well
- Only subtitle **text** is sent to the API you configured, for translation
- The API key is stored in the system Keychain, not in plaintext
- **The app collects no user data** — no telemetry, no crash reporting, no third-party
  analytics SDK

## Known Limitations

- PGS image subtitles require OCR and are not supported yet
- Translation quality depends on the model you use
- No manual subtitle-track picker yet (the best track is chosen automatically)

## Updating

The app checks for new versions and notifies you. Download the new version from the
[Releases page](https://github.com/zhengxiexie/aisub/releases/latest) and install over the top.

> Coming from the older Dualsub build? Just install over it. Your API key, history, glossary
> and checkpoints are migrated automatically — nothing to reconfigure.

## Developer

Source code is not public; this repository is for distribution only. The maintainer can run:

```bash
./release.sh 2.0.0 "Release notes"     # build + publish + verify
python3 Tools/make_icon.py             # regenerate the app icon
```

Star numbers come from GitHub's own counters (shields.io and star-history); the app itself
collects no user data.

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

<sub>Written in Swift + AppKit · No third-party dependencies</sub>