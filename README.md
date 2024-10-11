# voyager-build
This repository contains documentation and helper scripts to build qmk keyboard firmware for ZSA voyager.

# Getting Started

Setup a fresh build environment on a machine.

1. Download and install the QMK MSYS combined bundle from https://msys.qmk.fm/.
It is a MSYS terminal that is preconfigured to contain the QMK cli and necessary compilers.
2. Copy the setup command from ZSA's fork of the QMK firmware https://github.com/zsa/qmk_firmware/
3. Run the command from the QMK MSYS terminal. Optionally specify the target directory with the -H flag.
This will clone the ZSA repository to the target directory.
