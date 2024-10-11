# voyager-build
This repository contains documentation and helper scripts to build qmk keyboard firmware for ZSA voyager.

# Getting Started

Setup a fresh build environment on a machine.

1. Download and install the QMK MSYS combined bundle from https://msys.qmk.fm/.
It is a MSYS terminal that is preconfigured to contain the QMK cli and necessary compilers.
2. Copy the setup command from ZSA's fork of the QMK firmware https://github.com/zsa/qmk_firmware/
3. Run the command from the QMK MSYS terminal. Optionally specify the target directory with the -H flag.
This will clone the ZSA repository to the target directory.
4. Download the zipped keymap source from the ZSA Oryx web configurator and copy it into the 01_input folder.
5. Install unzip in MSYS via 'pacman -S unzip'
5. From the MSYS terminal, run 'bash build_voyager.sh' and provide the path to the zip folder as an argument.
This will extract the source, inject the custom snippets from the template folder, compile it, and initiate the flashing process.
6. Reset the keyboard to flash it when prompted.

# Customize keyboard settings
