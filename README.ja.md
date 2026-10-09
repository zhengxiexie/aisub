<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**AI で動画字幕を自動で二言語字幕に**

シーズン全体をドロップ → 内蔵字幕を自動検出 → AI が翻訳 → 二言語の `.srt` を出力

macOS のみ · 広告なし · 動画と字幕ファイルは端末から一切出ません

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=ダウンロード&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=リリース&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
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

## 課題

外国語映画に日本語字幕を付けたいと思っても、二つの壁に突き当たります。

**一つ：そもそも字幕が見つからない。**

Blu-ray リリースの多くは画像字幕（PGS ビットマップ）しか含まれず、該当する `.srt` が
オンラインに存在しないことがあります。マイナーな作品や新着ドラマでは字幕チームもまだ
対応しておらず、その場合は待つしかなく、視聴を諦める羽目になります。

**二つ：見つけてもタイミングが合わない。**

自分で探した字幕は手元のリリースと一致していない —— Blu-ray 版か、延長版か、再編集版か。
冒頭が 2 秒ずれ、終わりに 1 話分余っている。字幕エディタで 1 フレームずつ調整するしか
なく、1 話 1 時間、シーズン全体なら数時間の機械作業になります。

**どちらもお前の仕事ではありません。**

そのファイルに英語トラック（あるいは読み取れるテキストトラック）がすでにあれば、それが
そのまま原文です。必要なのは **それを翻訳し、手元の動画のタイムラインに合わせる** ことだけ。

それが AISub のやることです。

## 仕組み

```
動画をドロップ  →  内蔵テキスト字幕を読む（そのファイル自身のタイムラインに一致）
               →  AI が翻訳
               →  二言語字幕を出力
```

タイミングを手で調整する必要はありません —— 字幕は **あなたがドロップしたファイル
そのもの** から読み込まれるので、タイムスタンプは構造的に一致します。

## 特徴

**MKV 内蔵字幕の読み出しが 450 倍速い**

独自の Matroska パーサがファイル末尾の Cues インデックスへ直接ジャンプし、動画ペイロードの
99% をスキップします。83 GB の 4K リムックスで、オープンから字幕取得まで **142 分 → 19 秒**。

**多言語リリースでも正しいトラックを選ぶ**

30 以上の言語が 1 ファイルに詰め込まれたリリースもあります。AISub は英語トラックを
優先します。英語トラックに言語タグがなく（`und` としか読めない）ても、最も字幕数が多い
フランス語トラックにフォールバックすることはありません。

**シーズンまとめて処理**

フォルダをドロップするだけで OK。`S01E02` / `第2集` / `E02` などの話数命名を自動認識し、
シリーズごとに進捗をまとめて表示、シーズン全体をまとめてキャンセルできます。

**複数選択での一括操作**

複数のタスクを選ぶだけで、一度に再試行・キャンセル・削除できます。クリックで選択、
⌘+クリックで追加、シリーズ見出しのボタンで全選択。ツールバーからも右クリックメニューからも
実行できます。20 話分を片付けるのに 20 回クリックする必要はありません。

**再試行は失敗分だけ**

再試行しても、まだ翻訳されていない字幕だけを処理します。バッチ全体をやり直すわけではありません。
40 語のうち 1 語が失敗していれば、送信されるのはその 1 語だけです。残りの未翻訳語数も一覧に表示され、
再試行時に「ファイルが既に存在します」と聞かれることもありません。

**翻訳しながら観る**

内蔵プレイヤー + バイリンガル字幕オーバーレイ。タスクを開くと、翻訳が進むにつれて字幕が映像に重なって表示されます。完了を待って別のプレイヤーを開く必要がありません。

**シリーズ全体を一気に設定**

シリーズ単位で言語、字幕順序、用語集を設定できます。全 20 話のためにグローバル設定を 20 回開く必要はありません。

**スタイル付き署名の ASS 出力**

ASS 形式でスタイル付きバイリンガル字幕を出力。ファイルを共有すると、角に 500ミリ秒の AISub 署名がちらっと表示され、他の人が AISub を知ることができます —— 設定でオフにできます。

**外部字幕ファイルだけでも使える**

`.srt` / `.ass` / `.ssa` / `.vtt` をそのままドロップ。動画ファイルは不要です。

**二重に課金しない**

既に二言語のファイルは自動判別され、既存の訳文を抽出して未翻訳部分だけ補うので、
繰り返し実行しても品質が崩れません。

**待たされない**

チェックポイントからの再開、任意のタイミングでキャンセル（1 秒以内に反応）、失敗した
バッチは自動リトライして完了済み作業は保持されます。

**一括翻訳がより安定**

用語集で固有名詞の訳を固定し、バッチ間の文脈を維持、3 並列のバッチ同時実行（調整可能）。

**UI も充実**

8 言語の UI（実行時ログのローカライズを含む）、ライト/ダークモード、初回起動ガイド、
API 接続のセルフチェック。

## ダウンロード

最新版は [Releases ページ](https://github.com/zhengxiexie/aisub/releases/latest) から：

| ファイル | 説明 |
|---|---|
| `AISub-*.dmg` | 推奨、ダブルクリックでインストール |
| `AISub-*.zip` | 同じ。展開して App をアプリケーションにドラッグ |

## ⚠️ 初回起動時のみ手動で許可が必要

本プロジェクトは有料の Apple Developer 証明書で署名されていません（ad-hoc 署名）、
そのため macOS が直接の起動をブロックします。**これは不具合ではありません。以下の
いずれかで実行してください：**

**方法 1（推奨）**：ダウンロード後、**App を右クリック → 開く**、ダイアログ内の「開く」をクリック。

**方法 2**：アプリケーション内で AISub を選択し、右クリック → 開く。

**方法 3**（ターミナル）：
```bash
xattr -cr /Applications/AISub.app
```

以降はダブルクリックで通常どおり起動でき、追加の許可は不要です。

> Gatekeeper で確認済みの macOS バージョン：macOS 14 Sonoma 以降。

## 使い方

1. AISub を開く。初回起動時に AI サービスの設定を促されます
2. 動画または字幕ファイル（あるいはフォルダ全体）をドロップ
3. 完了を待つと二言語の `.srt` 字幕が書き出されます

自分の AI API キーが必要です（Anthropic 互換 API なら何でも可）。設定画面には
「接続テスト」ボタンがあり、正しく設定できたかその場で確認できます。

## 対応入力

| 種類 | 対応 |
|---|---|
| MKV / WebM のテキスト字幕（SRT/ASS） | ✅ 内蔵パーサ、ffmpeg 不要 |
| 外部 `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ 直接読み込み |
| MP4 / MOV / AVI のテキスト字幕 | ✅ ffmpeg にフォールバック |
| PGS / VobSub の画像字幕 | ❌ ビットマップは OCR が必要、対応外 |
| Blu-ray ISO イメージ | ❌ 同上（PGS のみ）。別のソースを推奨 |

> **注意**：手元のリリースが画像字幕（PGS）のみの場合、字幕は確かに利用できません ——
> 原文を OCR で認識してから翻訳する必要があるためです。ただし、1 つでもテキストトラック
>（英語でもフランス語でも）含まれていれば、AISub はそれを原文として使えます。

## プライバシー

- 動画ファイルは**一切** Mac の外に出ません —— 解析はローカルで実行されます
- 字幕ファイルもローカルでのみ読み込まれます
- API に送信されるのは翻訳のための字幕**テキスト**のみ
- API キーはシステムキーチェーンに保存され、平文ではありません
- **アプリはユーザーデータを一切収集しません** —— テレメトリも、クラッシュ報告も、
第三者解析 SDK もありません

## 既知の制限

- PGS 画像字幕は OCR が必要で、まだ未対応です
- 翻訳品質は使用するモデルに依存します
- 字幕トラックの手動選択 UI は未提供（最適なトラックを自動選択します）

## アップデート

アプリは新しいバージョンを確認して通知します。[Releases ページ](https://github.com/zhengxiexie/aisub/releases/latest)
から新しいバージョンをダウンロードし、上書きインストールしてください。

> 旧版 Dualsub からの移行：そのまま上書きインストールするだけです。API キー、履歴、
用語集、チェックポイントは自動的に移行されるため、再設定は不要です。

## 開発者

ソースコードは公開されていません。本リポジトリは配布専用です。メンテナーは次を実行できます：

```bash
./release.sh 2.0.0 "リリースノート"     # ビルド + 公開 + 検証
python3 Tools/make_icon.py             # アプリアイコンを再生成
```

スター数は GitHub 自身のカウント（shields.io および star-history）からのもので、
アプリ自体はユーザーデータを収集しません。

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

<sub>Swift + AppKit で実装 · 外部依存なし</sub>