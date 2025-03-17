#!/usr/bin/env bash

set -euo pipefail

download_file() {
  local DESCRIPTION=$1
  shift
  local DIRECTORY_NAME=$1
  shift
  local URL=$1
  shift
  local OUTPUT_FILE=$1
  shift

  echo -e "\n*******************************************************************************************************************"
  echo "*** ${DESCRIPTION}"
  echo -e "*******************************************************************************************************************\n"

  test -d "$DIRECTORY_NAME" || mkdir "$DIRECTORY_NAME"

  if [ "$OUTPUT_FILE" != "" ]; then
    wget --continue "$URL" -O "${DIRECTORY_NAME}/${OUTPUT_FILE}"
  else
    wget --continue --directory-prefix="$DIRECTORY_NAME" "$URL"
  fi

  while IFS= read -r -d '' FILE; do
    mediainfo --Output=JSON "$FILE" > "${FILE}.json"
    mediainfo "$FILE" > "${FILE}.nfo"
  done < <(find "$DIRECTORY_NAME" -iregex '.*\.\(mp4\|mkv\|flac\|ogg\|m2ts\|ts\|mp3\)$')
}

# USB_DESTINATION="/run/media/ruzickap/peru/"
USB_DESTINATION="/tmp/x/"

test -d $USB_DESTINATION || echo "*** Destionation directory \"$USB_DESTINATION\" doesn't exists !!!"

cd $USB_DESTINATION

CZ_CHARACTERS="Příliš žluťoučký kůň úpěl ďábelské ódy"
test -d "${CZ_CHARACTERS}" || mkdir "${CZ_CHARACTERS}"
download_file "PDF" "${CZ_CHARACTERS}" "https://www.votruba.in/int/pisma.pdf" "pisma.pdf"

######################################################
# https://www.demo-world.eu/2d-demo-trailers-uhd/
######################################################

DESCRIPTION="Dolby Digital Plus 7.1 Channel Check [1920x1080, H.264, 8 bits, 5 Mbs, 29.970 fps] [48 kHz, E-AC-3, 6 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dolby_digital_plus_channel_check_lossless-DWEU.mkv"
OUTPUT_FILE="dolby_digital_plus_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Dolby TrueHD 7.1 Channel Check [1920x1080, H.264, 8 bits, 6.5 Mbs, 29.970 fps] [48 kHz, TrueHD, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dolby_truehd_channel_check_lossless-DWEU.mkv"
OUTPUT_FILE="dolby_truehd_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="DTS:X 7.1.4 Callout (Lossless) [3840x2160, H.265, 10 bits, 68.3 Mbs, 23.976 fps] [48 kHz, DTS XLL X, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://opendir.samicrusader.me/demoworld/dts_x_7_1_4_callout_lossless_uhd-DWEU.mkv"
OUTPUT_FILE="dts_x_7_1_4_callout_lossless_uhd-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

######################################################
# http://jell.yfish.us/
######################################################

DESCRIPTION="Jellyfish Video Bitrate Test File [3840x2160, HEVC, 10 bits, 400 Mbs, 30 fps]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://repo.jellyfin.org/archive/jellyfish/media/jellyfish-400-mbps-4k-uhd-hevc-10bit.mkv"
OUTPUT_FILE="jellyfish-400-mbps-4k-uhd-hevc-10bit.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Tears of Steel [4096x1720, HEVC, 8 bits, 2.5 Mbs, 24 fps] [48 kHz, AC3, 6 ch] [UTF Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://www.libde265.org/hevc-bitstreams/tos-4096x1720-tiles.mkv"
OUTPUT_FILE="tos-4096x1720-tiles.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Big Buck Bunny Stereoscopic 3D [1920x1080x2, H.264, 8 bits, 6.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_stereo_abl.mp4"
OUTPUT_FILE="bbb_sunflower_1080p_60fps_stereo_abl.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Big Buck Bunny Standard 2D [3840x2160, H.264, 8 bits, 8.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_2160p_60fps_normal.mp4"
OUTPUT_FILE="bbb_sunflower_2160p_60fps_normal.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Sintel [4096x1744, H.265, 8 bits, 4.3 Mbs, 24 fps] [48 kHz, AAC, 6 ch] [UTF Subs] [UTF Ext Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://www.libde265.org/hevc-bitstreams/sintel-4096x1744-cfg02.mkv"
OUTPUT_FILE="sintel-4096x1744-cfg02.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"
OUTPUT_FILE="sintel-4096x1744-cfg02-cz.srt"
download_file "Sintel CZ Subtitles (sintel_cz.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_cz.srt" "$OUTPUT_FILE"
cp "${DIRECTORY_NAME}/sintel-4096x1744-cfg02-cz.srt" "${DIRECTORY_NAME}/sintel-4096x1744-cfg02.srt"
OUTPUT_FILE="sintel-4096x1744-cfg02-sk.srt"
download_file "Sintel SK Subtitles (sintel_sk.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_sk.srt" "$OUTPUT_FILE"

DESCRIPTION="First 8K Video from Space [8192x4096, H.265, 8 bits, 138 Mbs, 23.976fps] [48 kHz, AAC, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://images-assets.nasa.gov/video/First-8K-Video-from-Space/First-8K-Video-from-Space~orig.mp4"
OUTPUT_FILE="First-8K-Video-from-Space~orig.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="OGG"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://upload.wikimedia.org/wikipedia/en/2/26/Europe_-_The_Final_Countdown.ogg"
OUTPUT_FILE="Europe_-_The_Final_Countdown.ogg"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="OGA"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://upload.wikimedia.org/wikipedia/commons/f/ff/Vivaldi_-_Four_Seasons_1_Spring_mvt_1_Allegro_-_John_Harrison_violin.oga"
OUTPUT_FILE="Vivaldi_-_Four_Seasons_1_Spring_mvt_1_Allegro_-_John_Harrison_violin.oga"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Opus"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://media.xiph.org/tearsofsteel/tearsofsteel-surround.opus"
OUTPUT_FILE="tearsofsteel-surround.opus"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="FLAC [192 kHz, FLAC, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://samples.mplayerhq.hu/flac/24-bit_192kHz.flac"
OUTPUT_FILE="24-bit_192kHz.flac"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="FLAC [44 kHz, FLAC, 2 ch] [Metadata, Cover]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://samples.mplayerhq.hu/flac/larger_than_64k_flac_metadata.flac"
OUTPUT_FILE="larger_than_64k_flac_metadata.flac"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"
URL="https://samples.mplayerhq.hu/flac/larger_than_64k_flac_metadata.txt"
OUTPUT_FILE="larger_than_64k_flac_metadata.txt"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

echo -e "\n*** 4k 8k 16k photos"
DIRECTORY_NAME="4k_8k_16k_Photos"
test -d "$DIRECTORY_NAME" || mkdir "$DIRECTORY_NAME"
wget -c --directory-prefix="$DIRECTORY_NAME" \
  http://www.loadthegame.com/wp-content/uploads/2016/06/DOOM_4_02_1463158191.jpg \
  https://orig00.deviantart.net/4a77/f/2015/264/4/4/spiral_fractal_at_15360x8640___16k__by_ksennon-d9ae2ul.jpg \
  https://hitokageproduction.com/files/imageSamples/avif-yuv444p12le.avif \
  https://hitokageproduction.com/files/imageSamples/png-rgba64be.png

echo -e "\n*** Test Patterns"
DIRECTORY_NAME="Test_Patterns"
test -d "$DIRECTORY_NAME" || mkdir "$DIRECTORY_NAME"
wget -c --directory-prefix="$DIRECTORY_NAME" \
  https://upload.wikimedia.org/wikipedia/commons/a/aa/Philips_PM5544.svg \
  https://www.clker.com/cliparts/d/3/4/8/122620237858385735ivak_TV_Test_Screen.svg \
  https://upload.wikimedia.org/wikipedia/commons/2/2b/EIA_Resolution_Chart_1956.svg
