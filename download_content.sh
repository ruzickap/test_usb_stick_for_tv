#!/usr/bin/env bash

set -euo pipefail

download_file() {
  local DESCRIPTION=$1 DIRECTORY_NAME=$2 URL=$3 OUTPUT_FILE=${4:-${3##*/}}
  local FILE="${DIRECTORY_NAME}/${OUTPUT_FILE}"

  echo -e "\n*******************************************************************************************************************"
  echo "*** ${DESCRIPTION}"
  echo -e "*******************************************************************************************************************\n"

  mkdir -p "$DIRECTORY_NAME"

  wget --continue "$URL" -O "$FILE" || {
    echo "*** FAILED: ${URL}" >&2
    FAILED=1
    return 0
  }

  case "$FILE" in
    *.mp4 | *.mkv | *.m2ts | *.ts | *.mp3 | *.flac | *.ogg | *.oga | *.opus)
      mediainfo --Output=JSON "$FILE" > "${FILE}.json"
      mediainfo "$FILE" > "${FILE}.nfo"
      ;;
  esac
}

USB_DESTINATION=${1:?Usage: $0 <usb-stick-dir>}
FAILED=0

cd "$USB_DESTINATION"

CZ_CHARACTERS="Příliš žluťoučký kůň úpěl ďábelské ódy"
download_file "PDF" "${CZ_CHARACTERS}" "https://web.archive.org/web/20240518041230id_/https://www.votruba.in/int/pisma.pdf"

######################################################
# https://opendir.samicrusader.me/demoworld/
######################################################

DESCRIPTION="Dolby Digital Plus 7.1 Channel Check [1920x1080, H.264, 8 bits, 5 Mbs, 29.970 fps] [48 kHz, E-AC-3, 6 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dolby_digital_plus_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Dolby TrueHD 7.1 Channel Check [1920x1080, H.264, 8 bits, 6.5 Mbs, 29.970 fps] [48 kHz, TrueHD, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dolby_truehd_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="DTS-X 7.1.4 Callout (Lossless) [3840x2160, H.265, 10 bits, 68.3 Mbs, 23.976 fps] [48 kHz, DTS XLL X, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dts_x_7_1_4_callout_lossless_uhd-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

######################################################
# https://repo.jellyfin.org/archive/jellyfish/
######################################################

DESCRIPTION="Jellyfish Video Bitrate Test File [3840x2160, HEVC, 10 bits, 400 Mbs, 30 fps]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://repo.jellyfin.org/archive/jellyfish/media/jellyfish-400-mbps-4k-uhd-hevc-10bit.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Tears of Steel [4096x1720, HEVC, 8 bits, 2.5 Mbs, 24 fps] [48 kHz, AC3, 6 ch] [UTF Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://www.libde265.org/hevc-bitstreams/tos-4096x1720-tiles.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Big Buck Bunny Stereoscopic 3D [1920x1080x2, H.264, 8 bits, 6.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_stereo_abl.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Big Buck Bunny Standard 2D [3840x2160, H.264, 8 bits, 8.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_2160p_60fps_normal.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Sintel [4096x1744, H.265, 8 bits, 4.3 Mbs, 24 fps] [48 kHz, AAC, 6 ch] [UTF Subs] [UTF Ext Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://www.libde265.org/hevc-bitstreams/sintel-4096x1744-cfg02.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"
OUTPUT_FILE="sintel-4096x1744-cfg02-cz.srt"
download_file "Sintel CZ Subtitles (sintel_cz.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_cz.srt" "$OUTPUT_FILE"
# Same file under the video's name, so players load it by default
download_file "Sintel CZ Subtitles (sintel_cz.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_cz.srt" "sintel-4096x1744-cfg02.srt"
OUTPUT_FILE="sintel-4096x1744-cfg02-sk.srt"
download_file "Sintel SK Subtitles (sintel_sk.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_sk.srt" "$OUTPUT_FILE"

DESCRIPTION="First 8K Video from Space [8192x4096, H.265, 8 bits, 138 Mbs, 23.976fps] [48 kHz, AAC, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://images-assets.nasa.gov/video/First-8K-Video-from-Space/First-8K-Video-from-Space~orig.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="OGG"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://upload.wikimedia.org/wikipedia/en/2/26/Europe_-_The_Final_Countdown.ogg"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="OGA"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://upload.wikimedia.org/wikipedia/commons/f/ff/Vivaldi_-_Four_Seasons_1_Spring_mvt_1_Allegro_-_John_Harrison_violin.oga"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Opus"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://media.xiph.org/tearsofsteel/tearsofsteel-surround.opus"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="FLAC [192 kHz, FLAC, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://samples.mplayerhq.hu/flac/24-bit_192kHz.flac"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="FLAC [44 kHz, FLAC, 2 ch] [Metadata, Cover]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://samples.mplayerhq.hu/flac/larger_than_64k_flac_metadata.flac"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"
URL="https://samples.mplayerhq.hu/flac/larger_than_64k_flac_metadata.txt"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

echo -e "\n*** 4k 8k 16k Photos"
DIRECTORY_NAME="4k_8k_16k_Photos"
wget -c --directory-prefix="$DIRECTORY_NAME" \
  https://orig00.deviantart.net/4a77/f/2015/264/4/4/spiral_fractal_at_15360x8640___16k__by_ksennon-d9ae2ul.jpg \
  https://hitokageproduction.com/files/imageSamples/avif-yuv444p12le.avif \
  https://hitokageproduction.com/files/imageSamples/png-rgba64be.png || FAILED=1

echo -e "\n*** Test Patterns"
DIRECTORY_NAME="Test_Patterns"
wget -c --directory-prefix="$DIRECTORY_NAME" \
  https://upload.wikimedia.org/wikipedia/commons/a/aa/Philips_PM5544.svg \
  https://web.archive.org/web/20230130225448id_/http://www.clker.com/cliparts/d/3/4/8/122620237858385735ivak_TV_Test_Screen.svg \
  https://upload.wikimedia.org/wikipedia/commons/2/2b/EIA_Resolution_Chart_1956.svg || FAILED=1

exit "$FAILED"
