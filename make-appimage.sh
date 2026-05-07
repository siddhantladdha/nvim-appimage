#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q nvim | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
# Uncomment to add self-update possible.
# export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=./nvim.svg
export DESKTOP=./nvim.desktop
# This method is used to make sure that user specific parsers/queries take precendence if they exist.
# and sharun autorecognizes them and works with it.
export XDG_DATA_DIRS=/usr/share/
export URUNTIME_PRELOAD=1
export APPIMAGE_EXTRACT_AND_RUN=1
# ts_install_subdir="nvim/site"
# Deploy dependencies
# quick-sharun "$(command -v nvim)"  "$XDG_DATA_DIRS$ts_install_subdir"
quick-sharun "$(command -v nvim)"
# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
