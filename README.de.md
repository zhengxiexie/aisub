<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**Zweisprachige Untertitel für jedes Video, übersetzt per KI**

Eine ganze Staffel ziehen → eingebettete Untertitelspur auslesen → KI übersetzt sie → zweisprachige `.srt` als Ergebnis

Nur macOS · Keine Werbung · Video- und Untertiteldateien verlassen deinen Mac nie

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=Downloads&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=Version&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
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

## Star-Verlauf

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

## Das Problem

Du willst einen ausländischen Film mit deutschen Untertiteln sehen. Dabei stößt du gegen zwei
Wände:

**Erstens: Es gibt schlicht keine Untertiteldatei zu finden.**

Releases enthalten oft nur Bild-Untertitel (PGS-Bitmaps), und online existiert keine
passende `.srt`. Bei Obskuren Filmen oder brandneuen Serien sind die Untertitel-Gruppen noch
nicht durch. Dann wartest du — oder du lässt den Film aus.

**Zweitens: Selbst wenn du eine findest, passt das Timing nicht.**

Der gefundene Untertitel ist nicht auf deine exakte Schnittfassung geschnitten — ist es die
Blu-ray-Masteraufnahme, die erweiterte Fassung, ein Remake? Zwei Sekunden Versatz am Anfang,
eine Folge zu viel am Ende. Du schiebst Cue für Cue in einem Untertitel-Editor. Eine Stunde
pro Folge, ein paar Stunden mechanische Arbeit für eine ganze Staffel.

**Nichts davon sollte deine Aufgabe sein.**

Wenn die Datei bereits eine englische Spur hat — oder irgendeine Textspur, die du lesen
kannst — ist das das Originalskript. Was du eigentlich willst, ist **sie übersetzen und an
die Timeline des Videos auf deiner Festplatte anpassen.**

Genau das macht AISub.

## So funktioniert es

```
Video ziehen  →  Eingebettete Textuntertitel auslesen (an der Timeline der Datei ausgerichtet)
             →  KI übersetzt
             →  Zweisprachiger Untertitel als Ergebnis
```

Du musst das Timing nie von Hand nachstellen — die Untertitel werden **aus genau der Datei
gelesen, die du gezogen hast**, die Zeitstempel passen also strukturell.

## Highlights

**Liest eingebettete MKV-Untertitel 450× schneller**

Ein eigens geschriebener Matroska-Parser springt direkt zum Cues-Index am Dateiende und
überspringt 99 % der Video-Nutzlast. Ein 83-GB-4K-Remux braucht vom Öffnen bis zu den
Untertiteln **142 Minuten → 19 Sekunden**.

**Wählt die richtige Spur bei mehrsprachigen Releases**

Manche Releases packen 30+ Sprachen in eine Datei. AISub bevorzugt die englische Spur; und
selbst wenn die englische Spur kein Sprach-Tag trägt (nur `und` lesbar ist), fällt es nicht
auf die französische Spur zurück, nur weil dort die meisten Einträge stehen.

**Ganze Staffeln mit einem Zug**

Zieh einen Ordner rein. Episodennamen wie `S01E02` / `第2集` / `E02` werden automatisch
erkannt, der Fortschritt nach Serie gruppiert, und eine ganze Staffel lässt sich auf einmal
abbrechen.

**Stapeloperationen für ganze Staffeln**

Mehrere Aufgaben auswählen — Klick, ⌘-Klick zum Hinzufügen, oder „Ganze Serie auswählen"
in der Serienleiste — und alle auf einmal erneut übersetzen, abbrechen oder löschen, über die
Leiste oder das Rechtsklick-Menü. Eine 20-teilige Staffel muss nicht mehr mit zwanzig
Klicks abgearbeitet werden.

**Wiederholen kostet nur das, was fehlschlug**

Eine Wiederholung übersetzt nur die Einträge, die noch fehlen — nicht die ganze Charge. Wenn
eine von vierzig Zeilen scheitert, wird diese eine Zeile gesendet, nicht vierzig. Die Zeile
zeigt an, wie viele Einträge unübersetzt bleiben, und „Wiederholen" überschreibt die
vorherige Teilausgabe, ohne nachzufragen.

**Externe Untertitel funktionieren für sich allein**

Zieh `.srt` / `.ass` / `.ssa` / `.vtt` rein — keine Videodatei nötig.

**Du zahlst nie doppelt**

Bereits zweisprachige Dateien werden automatisch erkannt: Die vorhandene Übersetzung wird
herausgelöst und nur der unübersetzte Teil ergänzt, sodass wiederholte Läufe das Ergebnis
nicht verschlechtern.

**Keine tote Wartezeit**

Fortsetzen von Prüfpunkten, jederzeit abbrechen (Antwort innerhalb einer Sekunde),
fehlgeschlagene Stapel werden automatisch erneut versucht, fertige Arbeit bleibt erhalten.

**Stapelübersetzung wird stabiler**

Ein Glossar fixiert die Terminologie für Eigennamen, Kontext wird über Stapelgrenzen hinweg
geführt, 3 Stapel parallel (einstellbar).

**Vollständige Oberfläche**

8 Oberflächensprachen (einschließlich lokalisierter Laufzeitlogs), Hell/Dunkel-Modus,
Erststart-Assistent, API-Konnektivitätsprüfung.

## Download

Die neueste Version gibt es auf der [Releases-Seite](https://github.com/zhengxiexie/aisub/releases/latest):

| Datei | Hinweise |
|---|---|
| `AISub-*.dmg` | Empfohlen, Doppelklick zum Installieren |
| `AISub-*.zip` | Genauso, entpacken und die App in Programme ziehen |

## ⚠️ Der erste Start erfordert eine manuelle Freigabe

Dieses Projekt ist nicht mit einem kostenpflichtigen Apple-Entwicklerzertifikat signiert
(ad-hoc-Signierung), daher blockiert macOS das direkte Öffnen. **Das ist kein Defekt — nutze
eine der folgenden Methoden:**

**Methode 1 (empfohlen)**: Nach dem Download **Rechtsklick auf die App → Öffnen**, dann im
Dialog auf „Öffnen" klicken.

**Methode 2**: AISub in „Programme" auswählen, Rechtsklick → Öffnen.

**Methode 3** (Terminal):
```bash
xattr -cr /Applications/AISub.app
```

Danach startest du ganz normal per Doppelklick, ohne weitere Freigaben.

> Mit Gatekeeper geprüfte macOS-Versionen: macOS 14 Sonoma und neuer.

## Bedienung

1. AISub öffnen; beim ersten Start führt ein Assistent durch die Eingabe deiner KI-Dienste
2. Videos oder Untertiteldateien (oder einen ganzen Ordner) ziehen
3. Warten, bis es fertig ist — du erhältst einen zweisprachigen `.zh-en.srt`

Du brauchst deinen eigenen KI-API-Schlüssel (jeder Anthropic-kompatible Endpunkt funktioniert).
In den Einstellungen gibt es einen „Verbindung testen"-Knopf, du weißt also sofort, ob es
stimmt.

## Unterstützte Eingaben

| Typ | Unterstützung |
|---|---|
| MKV / WebM Text-Untertitel (SRT/ASS) | ✅ Eingebauter Parser, kein ffmpeg nötig |
| Externe `.srt` / `.ass` / `.ssa` / `.vtt` | ✅ Direkt gelesen |
| MP4 / MOV / AVI Text-Untertitel | ✅ Rückfall auf ffmpeg |
| PGS / VobSub Bild-Untertitel | ❌ Bitmaps brauchen OCR, nicht unterstützt |
| Blu-ray ISO-Images | ❌ Aus demselben Grund (nur PGS); probiere eine andere Quelle |

> **Hinweis**: Wenn dein Release nur Bild-Untertitel (PGS) hat, gibt es tatsächlich keine
> verwendbaren Untertitel — der Originaltext muss erst per OCR erkannt werden, bevor er
> übersetzt werden kann. Sobald die Datei aber eine Textspur hat (auch Englisch, auch
> Französisch), kann AISub sie als Originalskript verwenden.

## Datenschutz

- Videodateien **verlassen** deinen Mac **niemals** — das Parsen erfolgt lokal
- Untertiteldateien werden ebenfalls nur lokal gelesen
- Nur der **Text** der Untertitel wird zur Übersetzung an die von dir konfigurierte API gesendet
- Der API-Schlüssel liegt im System-Schlüsselbund, nicht im Klartext
- **Die App sammelt keine Nutzerdaten** — kein Telemetrie, kein Crash-Reporting, kein
Drittanbieter-Analytics-SDK

## Bekannte Einschränkungen

- PGS-Bild-Untertitel benötigen OCR und werden noch nicht unterstützt
- Die Übersetzungsqualität hängt vom verwendeten Modell ab
- Noch keine manuelle Auswahl der Untertitelspur (die beste Spur wird automatisch gewählt)

## Updates

Die App sucht nach neuen Versionen und meldet sich. Lade die neue Version von der
[Releases-Seite](https://github.com/zhengxiexie/aisub/releases/latest) herunter und
installiere sie darüber.

> Du kommst von der älteren Dualsub-Version? Einfach darüber installieren. API-Schlüssel,
Verlauf, Glossar und Prüfpunkte werden automatisch übernommen — nichts neu einrichten.

## Entwickler

Der Quellcode ist nicht öffentlich; dieses Repository dient nur zur Verteilung. Der
Maintainer kann Folgendes ausführen:

```bash
./release.sh 2.0.0 "Release Notes"      # Build + Veröffentlichung + Verifikation
python3 Tools/make_icon.py             # App-Symbol neu erzeugen
```

Die Sternzahl stammt aus den Zählern von GitHub selbst (shields.io und star-history); die App
selbst sammelt keine Nutzerdaten.

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

<sub>Geschrieben in Swift + AppKit · Keine Drittanbieter-Abhängigkeiten</sub>