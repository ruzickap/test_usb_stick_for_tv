#!/bin/bash -x

download_file() {
  local DESCRIPTION=$1; shift
  local DIRECTORY_NAME=$1; shift
  local URL=$1; shift
  local OUTPUT_FILE=$1; shift

  echo "*** $DESCRIPTION"

  test -d "$DIRECTORY_NAME" || mkdir "$DIRECTORY_NAME"

  if [ "$OUTPUT_FILE" != "" ]; then
    wget --continue "$URL" -O "${DIRECTORY_NAME}/${OUTPUT_FILE}"
  else
    wget --continue --directory-prefix="$DIRECTORY_NAME" "$URL"
  fi

  for FILE in `find $DIRECTORY_NAME -iregex '.*\.\(mp4\|mkv\|flac\|ogg\|m2ts\|mp3\)$'`; do
    #ffprobe -v quiet -print_format json -show_format -show_streams -print_format json $FILE > ${FILE}.json
    mediainfo $FILE > ${FILE}.nfo
  done
}


USB_DESTINATION="/run/media/ruzickap/peru/"

test -d $USB_DESTINATION || echo "*** Destionation directory \"$USB_DESTINATION\" doesn't exists !!!"

cd $USB_DESTINATION

CZ_CHARACTERS="Příliš žluťoučký kůň úpěl ďábelské ódy"
test -d "${CZ_CHARACTERS}" || mkdir "${CZ_CHARACTERS}"

DESCRIPTION="Dolby Digital Plus 7.1 Channel Check [1920x1080, H.264, 8 bits, 5 Mbs, 29.970 fps] [48 kHz, E-AC-3, 6 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://s1.demo-world.eu/hd_trailers.php?file=dolby_digital_plus_channel_check_lossless-DWEU.mkv"
OUTPUT_FILE="dolby_digital_plus_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Dolby TrueHD 7.1 Channel Check [1920x1080, H.264, 8 bits, 6.5 Mbs, 29.970 fps] [48 kHz, TrueHD, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://s1.demo-world.eu/hd_trailers.php?file=dolby_truehd_channel_check_lossless-DWEU.mkv"
OUTPUT_FILE="dolby_truehd_channel_check_lossless-DWEU.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="Dolby ATMOS 'Amaze' Demo [1920x1080, H.264, 8 bits, 23 Mbs, 24 fps] [48 kHz, Atmos, 8 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://s1.demo-world.eu/hd_trailers.php?file=dolby_amaze_lossless-DWEU.m2ts"
OUTPUT_FILE="dolby_amaze_lossless-DWEU.m2ts"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL" "$OUTPUT_FILE"

DESCRIPTION="LG Colors of Journey - HDR [3840x2160, HEVC, 10 bits, 40 Mbs, 60 fps] [48 kHz, AAC, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://demo-uhd3d.com/files/uhd4k/LG_Colors-of-Journey-HDR.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Jellyfish Video Bitrate Test File [3840x2160, HEVC, 10 bits, 400 Mbs, 30 fps]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://jell.yfish.us/media/jellyfish-400-mbps-4k-uhd-hevc-10bit.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Tears of Steel [4096x1720, HEVC, 8 bits, 2.5 Mbs, 24 fps] [48 kHz, AC3, 6 ch] [UTF Subs] [UTF Ext Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://www.libde265.org/hevc-bitstreams/tos-4096x1720-tiles.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"
download_file "Tears of Steel CZ Subtitles (TOS-CZ.srt)" "$DIRECTORY_NAME" "https://download.blender.org/demo/movies/ToS/subtitles/TOS-CZ.srt"

DESCRIPTION="Big Buck Bunny Stereoscopic 3D [1920x1080x2, H.264, 8 bits, 6.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_stereo_abl.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Big Buck Bunny Standard 2D [3840x2160, H.264, 8 bits, 8.5 Mbs, 60fps] [48 kHz, MP3, 2 ch]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_2160p_60fps_normal.mp4"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"

DESCRIPTION="Sintel [3840x2160, H.264, 8 bits, 40 Mbs, 24 fps] [48 kHz, AC3, 6 ch] [UTF Subs] [UTF Ext Subs]"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://download.blender.org/durian/movies/Sintel.2010.4k.mkv"
download_file "$DESCRIPTION" "$DIRECTORY_NAME" "$URL"
download_file "Sintel CZ Subtitles (sintel_cz.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_cz.srt"
download_file "Sintel SK Subtitles (sintel_sk.srt)" "$DIRECTORY_NAME" "https://download.blender.org/durian/subs/sintel_sk.srt"

DESCRIPTION="OGG"
DIRECTORY_NAME="${DESCRIPTION// /_}"
URL="https://upload.wikimedia.org/wikipedia/commons/3/3c/01_-_Vivaldi_Spring_mvt_1_Allegro_-_John_Harrison_violin.ogg"
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


echo "*** UHD (4k) photos"
DIRECTORY_NAME="UHD_4k_Photos"
test -d "$DIRECTORY_NAME" || mkdir "$DIRECTORY_NAME"
wget -c --directory-prefix="$DIRECTORY_NAME" \
https://4.bp.blogspot.com/-9jVzXU0v2_8/V9zxg9kr25I/AAAAAAACD0w/iJs-avKSVMUbLKQyzLANNHLhN5HHRguRgCPcB/s0/Hot_Landscape_from_Glencoe_UK_4k.jpg \
https://4.bp.blogspot.com/-gc6IoIHTTvA/V6NdnwTUk0I/AAAAAAACChM/OlcKQYg2S986CgSjwD4qkhDKFYR5hk0OACPcB/s0/Long_Exposure_Light_Effect_4k.jpg \
https://4.bp.blogspot.com/-JEvVd43ZZ-A/V33tA-XCrzI/AAAAAAACBsg/ouw1mWSa3FwY6LXlQqPrg07dfs4SzOoCACKgB/s0/Two_Fireworks_uhd.jpg \
https://4.bp.blogspot.com/-CDDg8LTum9E/V1OuvJ2nO6I/AAAAAAACBFk/qC6MULjIuQoXES6lnBKnlKP1QfxNtgWGwCKgB/s0/Orion_Nebula_uhd.jpg \
https://4.bp.blogspot.com/-z_g8jk_x__U/VwDViKVEbYI/AAAAAAAB-28/RrxJmWQ9Na4o-BIDihSJqKyi3P2J9gnsA/s0/Premium_Flower_Image_uhd.jpg
