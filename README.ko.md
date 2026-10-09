<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**AI로 영상 자막을 자동으로 이중 언어 자막으로**

한 시즌을 통째로 드롭 → 내장 자막 자동 감지 → AI 번역 → 이중 언어 `.srt` 출력

macOS 전용 · 광고 없음 · 영상과 자막 파일은 기기를 벗어나지 않습니다

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=다운로드&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=릴리스&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
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

## 스타 히스토리

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

## 문제점

외국 영화를 한국어 자막으로 보고 싶어도 두 가지 벽에 부딪힙니다.

**하나: 자막 파일을 찾을 수 없습니다.**

릴리스에는 종종 이미지 자막(PGS 비트맵)만 들어 있고, 온라인에 맞는 `.srt`가
존재하지 않습니다. 인기도 낮은 작품이나 방금 공개된 드라마는 자막 제작팀이 아직
아직 만들어지지 않았습니다 — 그럴 땐 기다리거나 아예 보지 않는 수밖에 없습니다.

**둘: 찾았어도 타이밍이 안 맞습니다.**

받아온 자막은 지금 가진 릴리스와 판본이 다릅니다 — Blu-ray 마스터인가, 확장판인가,
다시 편집된 판인가. 앞부분이 2초 밀리고, 끝에 1화가 통째로 더 있다.
자막 편집기에서 프레임 단위로 한 줄씩 조정해야 합니다. 회당 1시간,
한 시즌이면 몇 시간의 단순 노동입니다.

**그 둘 다 당신의 일이 아닙니다.**

그 파일에 영어 트랙(또는 읽을 수 있는 텍스트 트랙)이 이미 있다면 그것이 곧 대본입니다.
필요한 건 그것을 **번역하고, 지금 가진 영상 타임라인에 맞추는** 일 뿐입니다.

그게 AISub가 하는 일입니다.

## 원리

```
영상 드롭  →  내장 텍스트 자막 읽기(해당 파일 자체의 타임라인에 정렬됨)
          →  AI 번역
          →  이중 언어 자막 출력
```

타이밍을 직접 조정할 필요가 없습니다 — 자막은 **드롭한 그 파일**에서 읽히므로
타임스탬프가 구조적으로 일치합니다.

## 하이라이트

**MKV 내장 자막을 450배 빠르게 읽음**

직접 만든 Matroska 파서가 파일 끝의 Cues 인덱스로 바로 점프해 영상 페이로드의 99%를
건너뜁니다. 83GB 4K 리믹스에서 열기부터 자막 확보까지 **142분 → 19초**.

**여러 언어가 섞인 릴리스에서도 올바른 트랙 선택**

하나의 파일에 30개 이상의 언어가 들어있는 릴리스가 있습니다. AISub는 영어 트랙을
우선합니다. 영어 트랙에 언어 태그가 없어서(`und`만 읽히는 경우에도) 자막 수가 가장 많은
프랑스어 트랙으로 넘어가는 일은 없습니다.

**시즌 단위 일괄 처리**

폴더를 드롭하면 끝입니다. `S01E02` / `第2集` / `E02` 같은 회차 표기를 자동 인식하고,
시리즈별 진행 상황을 모아 보여주며, 시즌 전체를 한 번에 취소할 수 있습니다.

**여러 개 선택 후 일괄 처리**

여러 작업을 선택하면 한 번에 재시도·취소·삭제할 수 있습니다. 클릭으로 선택,
⌘+클릭으로 추가, 시리즈 머리글의 버튼으로 전체 선택. 도구막과 우클릭 메뉴
양쪽에서 모두 실행할 수 있습니다. 20화를 정리하려고 20번 클릭할 필요가 없습니다.

**재시도는 실패한 항목만**

재시도해도 아직 번역되지 않은 자막만 처리합니다. 배치 전체를 처음부터 다시 돌리지 않습니다.
40개 중 1개가 실패했다면 그 1개만 다시 전송됩니다. 남은 미번역 개수도 목록에 표시되고,
재시도할 때 “파일이 이미 있습니다”를 묻지 않습니다.

**번역하면서 보기**

내장 플레이어 + 이중 언어 자막 오버레이. 작업을 열면 번역이 끝나기 전에도 자막이 영상 위에 실시간으로 나타납니다. 외부 플레이어를 따로 열 필요가 없습니다.

**시즌 한 번에 설정**

시리즈 단위로 언어, 자막 순서, 용어집을 설정할 수 있습니다. 20화를 위해 전역 설정 창을 20번 열 필요가 없습니다.

**스타일이 지정된 서명이 있는 ASS 출력**

ASS 형식으로 스타일이 지정된 이중 언어 자막을 내보낼 수 있습니다. 파일을 공유할 때 모서리에 500ms의 AISub 서명이 살짝 나타나 다른 사람들이 AISub를 발견할 수 있게 해줍니다 —— 설정에서 끕 수 있습니다.

**외부 자막 파일만으로도 동작**

`.srt` / `.ass` / `.ssa` / `.vtt`를 그대로 드롭하면 됩니다. 영상 파일은 필요 없습니다.

**중복 결제 없음**

이미 이중 언어인 파일은 자동 인식되어 기존 번역을 추출하고 번역되지 않은 부분만 채우므로,
여러 번 실행해도 결과가 엉망이 되지 않습니다.

**기다리는 시간 없음**

체크포인트 재개, 언제든 취소(1초 내 반응), 실패한 배치는 자동 재시도하며 완료된 작업은 유지됩니다.

**대량 번역이 더 안정적**

용어집으로 고유명사 번역을 고정하고, 배치 간 문맥을 이어주고, 배치 병렬 처리 3회(조정 가능).

**완성도 높은 인터페이스**

8개 인터페이스 언어(실행 로그 현지화 포함), 라이트/다크 모드, 첫 실행 가이드,
API 연결 자체 점검.

## 다운로드

최신 버전은 [Releases 페이지](https://github.com/zhengxiexie/aisub/releases/latest)에서 받으세요:

| 파일 | 설명 |
|---|---|
| `AISub-*.dmg` | 권장, 더블클릭으로 설치 |
| `AISub-*.zip` | 동일, 압축을 풀고 App를 응용 프로그램으로 드래그 |

## ⚠️ 최초 실행 시 수동 허용 필요

이 프로젝트는 유료 Apple Developer 인증서로 서명되어 있지 않습니다(ad-hoc 서명).
그래서 macOS가 직접 열기를 차단합니다. **오류가 아닙니다. 아래 중 하나로 실행하세요:**

**방법 1 (권장)**: 다운로드 후 **App를 우클릭 → 열기**, 대화상자에서 «열기» 클릭.

**방법 2**: 응용 프로그램에서 AISub를 선택하고 우클릭 → 열기.

**방법 3** (터미널):
```bash
xattr -cr /Applications/AISub.app
```

이후에는 더블클릭으로 정상 실행되며 추가 승인이 필요 없습니다.

> Gatekeeper 검증을 마친 macOS 버전: macOS 14 Sonoma 이상.

## 사용 방법

1. AISub를 엽니다. 최초 실행 시 AI 서비스 설정을 안내합니다
2. 영상 또는 자막 파일(또는 폴더 전체)을 드롭합니다
3. 완료되면 이중 언어 `.srt` 자막이 출력됩니다

직접 준비한 AI API 키가 필요합니다(Anthropic 호환 API라면 무엇이든 가능).
설정 화면에 «연결 테스트» 버튼이 있어 제대로 설정했는지 그 자리에서 확인할 수 있습니다.

## 지원 입력

| 종류 | 지원 |
|---|---|
| MKV / WebM 텍스트 자막(SRT/ASS) | ✅ 내장 파서, ffmpeg 불필요 |
| 외부 `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ 직접 읽기 |
| MP4 / MOV / AVI 텍스트 자막 | ✅ ffmpeg으로 대체 처리 |
| PGS / VobSub 이미지 자막 | ❌ 비트맵은 OCR 필요, 미지원 |
| Blu-ray ISO 이미지 | ❌ 동일 (PGS 전용). 다른 소스 권장 |

> **주의**: 릴리스에 이미지 자막(PGS)만 있다면 실제로 자막을 사용할 수 없습니다 ——
> 번역하려면 원문을 OCR로 인식해야 하기 때문입니다. 다만 텍스트 트랙이 하나라도 있으면
> (영어든 프랑스어든), AISub는 그것을 원문으로 사용할 수 있습니다.

## 개인정보

- 영상 파일은 **절대로** Mac을 벗어나지 않습니다 — 파싱은 로컬에서 수행됩니다
- 자막 파일도 로컬에서만 읽습니다
- API로 전송되는 것은 번역을 위한 자막 **텍스트**뿐입니다
- API 키는 시스템 키체인에 저장되며 평문으로 저장되지 않습니다
- **앱은 사용자 데이터를 전혀 수집하지 않습니다** — 텔레메트리, 충돌 보고, 서드파티
  분석 SDK 모두 없습니다

## 알려진 제약

- PGS 이미지 자막은 OCR이 필요하며 아직 미지원입니다
- 번역 품질은 사용하는 모델에 따라 달라집니다
- 자막 트랙 수동 선택 UI는 아직 없습니다(최적의 트랙을 자동 선택)

## 업데이트

앱이 새 버전을 확인해 알려줍니다. [Releases 페이지](https://github.com/zhengxiexie/aisub/releases/latest)에서
새 버전을 받아 덮어씌우면 됩니다.

> 이전 Dualsub 버전을 쓰고 있다면? 그대로 덮어씌우기만 하면 됩니다. API 키, 기록,
> 용어집, 체크포인트는 자동으로 이전되어 재설정할 필요가 없습니다.

## 개발자

소스 코드는 공개되어 있지 않습니다. 이 저장소는 배포용입니다. 관리자는 다음을 실행할 수 있습니다:

```bash
./release.sh 2.0.0 "릴리스 노트"     # 빌드 + 배포 + 검증
python3 Tools/make_icon.py           # 앱 아이콘 재생성
```

스타 수는 GitHub 자체 카운터(shields.io 및 star-history)에서 나온 것으로,
앱 자체는 사용자 데이터를 수집하지 않습니다.

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

<sub>Swift + AppKit으로 작성 · 외부 의존성 없음</sub>