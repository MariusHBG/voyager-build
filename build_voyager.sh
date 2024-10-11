# This is a utility script to include custom functionality in QMK firmware for ZSA voyager.
# 
# When using home row mods, it is preferable if the hold action was triggered when tapping a home row key, and quickly after holding it.
# But in the default setup, the second key press will trigger the auto-repeat action instead. This can be turned off
# with the "Tapping force hold" setting in the web-configurator, but as it is a global setting,
# we loose the auto-repeat functionality on all other keys. What we really want is to configure
# "Tapping force hold" per key, but the web-configurator doesn't support this.
# However, the QMK firmware, on which the voyager firmware is based on, does support this by
# setting the "quick-tap-term" for the respective home row keys to 0.
#
# This script takes the downloaded layout source code from the web-configurator as an input,
# adds a custom code snippet that configures the quick-tap-term for selected keys,
# builds the QMK firmware, and finally flashes it on a connected voyager keyboard.
#
# Usage instructions:
# 1. Download the layout source code from https://configure.zsa.io/.
# 2. Run this script from the QMK MSYS terminal, and provide the source archive path as an input.
# 3. Reset the voyager when the script attempts to flash the firmware.


# set -e
set -x

name=${1%.zip}
keymaps_dir="C:\Users\Marius\qmk_firmware\keyboards\voyager\keymaps"
# firmware_path="C:\Users\Marius\qmk_firmware\.build\\voyager_$name.bin"
header_template="00_template\config_template.h"
keymap_template="00_template\keymap_template.c"

echo "Processing layout archive \"$1\"."
echo "Using header template $header_template."
echo "Using keymap template $keymap_template."

echo "Extracting archive..."
unzip -j -o $1 -d $name

echo "Modifying source..."
header_path="$name/config.h"
keymap_path="$name/keymap.c"
cat $header_template >> $header_path
cat $keymap_template >> $keymap_path

dest="${keymaps_dir}\\$name"
echo "Copying output to destination $dest"
mkdir -p $dest
cp -r $name/*.c $name/*.h $name/rules.mk -t $dest

echo "Running qmk compilation..."
qmk flash -kb voyager -km $name

# cp $firmware_path ./$name.bin

