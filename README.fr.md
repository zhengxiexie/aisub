<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**Des sous-titres bilingues pour n'importe quelle vidéo, traduits par IA**

Glissez une saison entière → lecture de la piste de sous-titres intégrée → l'IA la traduit → un `.srt` bilingue

macOS uniquement · Sans publicité · La vidéo et les fichiers de sous-titres ne quittent jamais votre Mac

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=Téléchargements&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
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

## Historique des étoiles

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

## Le problème

Vous voulez regarder un film étranger avec des sous-titres. Vous heurtez deux murs :

**Un : il n'existe aucun fichier de sous-titres à trouver.**

Les éditions contiennent souvent uniquement des sous-titres image (PGS bitmap), et aucun `.srt`
correspondant n'existe en ligne. Pour les films rares ou les séries fraîchement sorties, les
équipes de sous-titrage n'y sont pas encore. Dans ce cas, vous attendez, ou vous sautez
le film.

**Deux : même en en trouvant un, la synchronisation ne correspond pas.**

Le sous-titre téléchargé n'est pas calé sur votre édition exacte — est-ce le master Blu-ray, la
version étendue, un remontage ? Deux secondes de décalage au début, un épisode en trop à la
fin. Vous vous retrouvez à décaler les sous-titres cadence par cadence dans un éditeur. Une
heure par épisode, quelques heures de travail mécanique pour une saison.

**Aucune de ces deux choses ne devrait être votre travail.**

Si le fichier contient déjà une piste anglaise — ou n'importe quelle piste texte que vous
pouvez lire — c'est là le scénario original. Ce que vous voulez en réalité, c'est **le
traduire et l'aligner sur la timeline de la vidéo présente sur votre disque.**

C'est exactement ce que fait AISub.

## Comment ça marche

```
Glisser la vidéo  →  Lire la piste de sous-titres texte intégrée (alignée sur la timeline du fichier)
                 →  L'IA la traduit
                 →  Sous-titre bilingue en sortie
```

Vous n'avez jamais à ajuster la synchronisation à la main — les sous-titres sont lus **dans le
fichier même que vous avez glissé**, donc les timecodes correspondent par construction.

## Points forts

**Lit les sous-titres MKV intégrés 450× plus vite**

Un analyseur Matroska écrit à la main saute directement à l'index Cues situé à la fin du
fichier, évitant 99 % de la charge vidéo. Un remux 4K de 83 GB passe de 142 minutes à
**19 secondes** entre l'ouverture et l'obtention des sous-titres.

**Choisit la bonne piste sur les éditions multilingues**

Certaines éditions packagent plus de 30 langues dans un seul fichier. AISub privilégie la
piste anglaise ; et même quand la piste anglaise n'a pas d'étiquette de langue (seul `und` est
lisible), il ne se rabat pas sur la piste française simplement parce qu'elle contient le plus
d'entrées.

**Une saison entière en un seul dépôt**

Déposez un dossier. Les noms d'épisodes comme `S01E02` / `第2集` / `E02` sont détectés
automatiquement, la progression est regroupée par série, et toute une saison peut être
annulée d'un clic.

**Opérations groupées sur toute une saison**

Sélectionnez plusieurs tâches — clic, ⌘-clic pour en ajouter, ou le bouton de sélection sur
l'en-tête de série — puis relancez, annulez ou supprimez-les toutes en une seule action, via
la barre ou le menu contextuel. Nettoyer une saison de 20 épisodes ne demande plus vingt
clics.

**Une reprise ne coûte que ce qui a échoué**

Une reprise ne traduit que les entrées encore manquantes — pas le lot entier. Sur quarante
lignes, si une seule échoue, c'est cette seule ligne qui est renvoyée. La ligne indique
combien d'entrées restent non traduites, et la reprise écrase la sortie partielle précédente
sans rien demander.

**Les sous-titres externes fonctionnent seuls**

Glissez un `.srt` / `.ass` / `.ssa` / `.vtt` — aucun fichier vidéo requis.

**Vous ne payez jamais deux fois**

Les fichiers déjà bilingues sont détectés automatiquement : la traduction existante est
extraite et seules les parties non traduites sont complétées, donc les exécutions successives
ne dégradent pas le résultat.

**Aucune attente inutile**

Reprise depuis un point de contrôle, annulation à tout moment (réponse en moins d'une
seconde), lots échoués automatiquement réessayés en conservant le travail déjà accompli.

**Traduction par lots plus stable**

Un glossaire verrouille la terminologie des noms propres, le contexte se poursuit d'un lot à
l'autre, concurrence de 3 lots (ajustable).

**Interface complète**

8 langues d'interface (y compris les journaux d'exécution localisés), mode clair/sombre,
assistant de premier lancement, auto-vérification de la connexion API.

## Téléchargement

Récupérez la dernière version depuis la [page Releases](https://github.com/zhengxiexie/aisub/releases/latest) :

| Fichier | Remarques |
|---|---|
| `AISub-*.dmg` | Recommandé, double-clic pour installer |
| `AISub-*.zip` | Idem, décompressez et glissez l'App dans Applications |

## ⚠️ Le premier lancement nécessite une validation manuelle

Ce projet n'est pas signé avec un certificat développeur Apple payant (signature ad-hoc),
macOS bloque donc l'ouverture directe. **Ce n'est pas un dysfonctionnement — utilisez l'une
des méthodes suivantes :**

**Méthode 1 (recommandée)** : après téléchargement, **faites un clic droit sur l'App →
Ouvrir**, puis cliquez sur « Ouvrir » dans la boîte de dialogue.

**Méthode 2** : sélectionnez AISub dans Applications, clic droit → Ouvrir.

**Méthode 3** (terminal) :
```bash
xattr -cr /Applications/AISub.app
```

Ensuite vous pourrez lancer normalement par double-clic, sans autre validation.

> Versions de macOS vérifiées avec Gatekeeper : macOS 14 Sonoma et ultérieur.

## Utilisation

1. Ouvrez AISub ; au premier lancement un guide vous demande de renseigner votre service IA
2. Déposez des vidéos ou des fichiers de sous-titres (ou un dossier entier)
3. Attendez la fin, et vous obtenez un sous-titre bilingue `.zh-en.srt`

Vous avez besoin de votre propre clé API IA (tout endpoint compatible Anthropic fonctionne).
Le panneau Réglages dispose d'un bouton « Tester la connexion », donc vous savez
immédiatement si c'est correct.

## Entrées prises en charge

| Type | Prise en charge |
|---|---|
| Sous-titres texte MKV / WebM (SRT/ASS) | ✅ Analyseur intégré, pas besoin de ffmpeg |
| `.srt` / `.ass` / `.ssa` / `.vtt` externes | ✅ Lecture directe |
| Sous-titres texte MP4 / MOV / AVI | ✅ Repli sur ffmpeg |
| Sous-titres image PGS / VobSub | ❌ Les bitmaps exigent de l'OCR, non pris en charge |
| Images ISO Blu-ray | ❌ Même raison (PGS uniquement) ; essayez une autre source |

> **Remarque** : si votre édition ne contient que des sous-titres image (PGS), il n'y a
> effectivement aucun sous-titre exploitable — le texte original doit d'abord être reconnu par
> OCR avant d'être traduit. Mais tant que le fichier contient une piste texte (même anglaise,
> même française), AISub peut l'utiliser comme scénario source.

## Confidentialité

- Les fichiers vidéo **ne quittent jamais** votre Mac — l'analyse est locale
- Les fichiers de sous-titres sont également lus en local
- Seul le **texte** des sous-titres est envoyé à l'API que vous avez configurée, pour traduction
- La clé API est stockée dans le Trousseau système, en clair nul
- **L'application ne collecte aucune donnée utilisateur** — ni télémétrie, ni rapport d'incident,
ni SDK d'analyse tiers

## Limites connues

- Les sous-titres image PGS nécessitent de l'OCR et ne sont pas encore pris en charge
- La qualité de la traduction dépend du modèle utilisé
- Pas encore de sélecteur manuel de piste de sous-titres (la meilleure piste est choisie automatiquement)

## Mises à jour

L'application recherche les nouvelles versions et vous avertit. Téléchargez la nouvelle
version depuis la [page Releases](https://github.com/zhengxiexie/aisub/releases/latest) et
installez par-dessus.

> Vous veniez de l'ancienne version Dualsub ? Installez simplement par-dessus. Votre clé API,
l'historique, le glossaire et les points de contrôle sont migrés automatiquement — rien à
reconfigurer.

## Développeur

Le code source n'est pas public ; ce dépôt sert uniquement à la distribution. Le mainteneur
peut exécuter :

```bash
./release.sh 2.0.0 "Notes de version"   # build + publication + vérification
python3 Tools/make_icon.py             # régénérer l'icône de l'app
```

Les nombres d'étoiles proviennent des compteurs de GitHub lui-même (shields.io et
star-history) ; l'application ne collecte aucune donnée utilisateur.

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

<sub>Écrit en Swift + AppKit · Aucune dépendance tierce</sub>