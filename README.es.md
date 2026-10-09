<div align="center">

# AISub

<img src="logo.png" width="120" alt="AISub">

**Subtítulos bilingües para cualquier vídeo, traducidos con IA**

Arrastra una temporada entera → lee la pista de subtítulos incrustada → la IA lo traduce a un `.srt` bilingüe

Solo macOS · Sin anuncios · El vídeo y los archivos de subtítulos nunca salen de tu Mac

[![Downloads](https://img.shields.io/github/downloads/zhengxiexie/aisub/total.svg?style=flat&label=Descargas&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases)
[![Stars](https://img.shields.io/github/stars/zhengxiexie/aisub?style=flat&label=Star&color=6B73F2)](https://github.com/zhengxiexie/aisub/stargazers)
[![Forks](https://img.shields.io/github/forks/zhengxiexie/aisub?style=flat&label=Fork&color=9E66F2)](https://github.com/zhengxiexie/aisub/network/members)
[![Latest](https://img.shields.io/github/v/release/zhengxiexie/aisub?label=Versión&color=6B73F2)](https://github.com/zhengxiexie/aisub/releases/latest)
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

## Historial de estrellas

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

## El problema

Quieres ver una película extranjera con subtítulos. Te topas con dos muros:

**Uno: no hay ningún archivo de subtítulos que encontrar.**

Las ediciones suelen traer solo subtítulos de imagen (mapas de bits PGS), y no existe un
`.srt` que coincida en línea. En películas poco conocidas o series recién estrenadas, los grupos de
subtitulado aún no han llegado. Entonces esperas, o directamente te saltas la película.

**Dos: aunque lo encuentres, la sincronización no cuadra.**

El subtítulo que descargaste no está cortado para tu edición exacta: ¿es el master de Blu-ray, la
versión extendida, un remontaje? Dos segundos de desfase al principio, un episodio de más al
final. Te toca ajustar los tiempos de cada línea a uno a uno en un editor de subtítulos. Una hora por episodio,
unas horas de trabajo mecánico por temporada.

**Ninguna de esas dos cosas debería ser tarea tuya.**

Si el archivo ya tiene una pista en inglés — o cualquier pista de texto que puedas leer — esa
es la obra original. Lo que realmente quieres es **traducirla y alinearla con la línea de
tiempo del vídeo que tienes en el disco.**

Eso es exactamente lo que hace AISub.

## Cómo funciona

```
Arrastrar vídeo  →  Leer la pista de subtítulos de texto incrustada (alineada con la línea de tiempo del archivo)
                →  La IA lo traduce
                →  Salida de subtítulo bilingüe
```

Nunca tienes que ajustar la sincronización a mano: los subtítulos se leen **del mismo archivo
que arrastraste**, así que las marcas de tiempo cuadran por construcción.

## Puntos destacados

**Lee subtítulos incrustados en MKV 450 veces más rápido**

Un analizador Matroska escrito a mano salta directamente al índice Cues del final del archivo,
evitando el 99 % de la carga útil del vídeo. Un remux 4K de 83 GB pasa de 142 minutos a
**19 segundos** entre abrirlo y obtener los subtítulos.

**Elige la pista correcta en ediciones multilingües**

Algunas ediciones empaquetan más de 30 idiomas en un mismo archivo. AISub prioriza la pista
en inglés; e incluso cuando esa pista no lleva etiqueta de idioma (solo se puede leer `und`),
no recurre a la pista francesa solo porque sea la que tiene más entradas.

** Temporadas enteras en una sola operación**

Arrastra una carpeta. Los nombres de episodio como `S01E02` / `第2集` / `E02` se detectan
automáticamente, el progreso se agrupa por serie y puedes cancelar una temporada entera de una
vez.

**Los subtítulos externos funcionan por sí solos**

Arrastra un `.srt` / `.ass` / `.ssa` / `.vtt`: no hace falta ningún archivo de vídeo.

**Nunca pagas dos veces**

Los archivos que ya son bilingües se detectan automáticamente: se extrae la traducción
existente y solo se completa la parte sin traducir, de modo que las ejecuciones sucesivas no
empeoran el resultado.

**Sin esperas muertas**

Reanudación desde puntos de control, cancelación en cualquier momento (responde en menos de un
segundo) y reintento automático de los lotes fallidos conservando el trabajo ya terminado.

**Traducción por lotes más estable**

Un glosario fija la terminología de los nombres propios, el contexto se mantiene entre lotes y
hay una concurrencia de 3 lotes (ajustable).

**Interfaz completa**

8 idiomas de interfaz (incluidos los registros de ejecución localizados), modo claro/oscuro,
guía de primer arranque y autocomprobación de la conexión con la API.

## Descarga

Consigue la última versión desde la [página de Releases](https://github.com/zhengxiexie/aisub/releases/latest):

| Archivo | Notas |
|---|---|
| `AISub-*.dmg` | Recomendado, doble clic para instalar |
| `AISub-*.zip` | Igual, descomprime y arrastra la App a Aplicaciones |

## ⚠️ El primer arranque requiere una aprobación manual

Este proyecto no está firmado con un certificado de desarrollador de Apple de pago (usa firma
ad-hoc), así que macOS bloquea la apertura directa. **No es un fallo: usa cualquiera de estos
métodos:**

**Método 1 (recomendado)**: tras descargar, **haz clic derecho en la App → Abrir** y luego
pulsa «Abrir» en el diálogo.

**Método 2**: selecciona AISub en Aplicaciones, clic derecho → Abrir.

**Método 3** (terminal):
```bash
xattr -cr /Applications/AISub.app
```

Después puedes iniciarla con normalidad con doble clic, sin más aprobaciones.

> Versiones de macOS verificadas con Gatekeeper: macOS 14 Sonoma y posteriores.

## Uso

1. Abre AISub; en el primer arranque una guía te pide introducir los datos de tu servicio de IA
2. Arrastra vídeos o archivos de subtítulos (o una carpeta entera)
3. Espera a que termine y obtendrás un subtítulo bilingüe `.zh-en.srt`

Necesitas tu propia clave de API de IA (sirve cualquier endpoint compatible con Anthropic). El
panel de Ajustes tiene un botón «Probar conexión», así que sabes de inmediato si está bien.

## Entradas admitidas

| Tipo | Compatibilidad |
|---|---|
| Subtítulos de texto MKV / WebM (SRT/ASS) | ✅ Analizador integrado, sin necesidad de ffmpeg |
| `.srt` / `.ass` / `.ssa` / `.vtt` externos | ✅ Lectura directa |
| Subtítulos de texto en MP4 / MOV / AVI | ✅ Recurre a ffmpeg |
| Subtítulos de imagen PGS / VobSub | ❌ Los mapas de bits requieren OCR, no compatible |
| Imágenes ISO de Blu-ray | ❌ Por lo mismo (solo PGS); prueba otra fuente |

> **Nota**: si tu edición solo tiene subtítulos de imagen (PGS), realmente no hay subtítulos
> usables: el texto original debe reconocerse mediante OCR antes de poder traducirlo. Pero
> siempre que el archivo tenga una pista de texto (aunque sea inglés o francés), AISub puede
> usarla como guion de origen.

## Privacidad

- Los archivos de vídeo **nunca** salen de tu Mac: el análisis es local
- Los archivos de subtítulos también se leen localmente
- Solo el **texto** de los subtítulos se envía a la API que configuraste, para traducirlo
- La clave de API se guarda en el Llavero del sistema, no en texto plano
- **La app no recopila ningún dato del usuario**: sin telemetría, sin informes de fallos y sin
SDK de analítica de terceros

## Limitaciones conocidas

- Los subtítulos de imagen PGS requieren OCR y aún no son compatibles
- La calidad de la traducción depende del modelo que utilices
- Todavía no hay selector manual de pista de subtítulos (se elige automáticamente la mejor)

## Actualizaciones

La app busca nuevas versiones y te avisa. Descarga la nueva versión desde la
[página de Releases](https://github.com/zhengxiexie/aisub/releases/latest) e instálala encima.

> ¿Venías de la versión antigua Dualsub? Solo instálala encima. Tu clave de API, el historial,
el glosario y los puntos de control se migran automáticamente: no hay nada que reconfigurar.

## Desarrollador

El código fuente no es público; este repositorio es solo para distribución. El mantenedor
puede ejecutar:

```bash
./release.sh 2.0.0 "Notas de la versión"   # compilar + publicar + verificar
python3 Tools/make_icon.py                 # regenerar el icono de la app
```

Las estrellas provienen de los contadores de GitHub (shields.io y star-history); la app en sí
no recopila ningún dato del usuario.

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

<sub>Escrito en Swift + AppKit · Sin dependencias de terceros</sub>