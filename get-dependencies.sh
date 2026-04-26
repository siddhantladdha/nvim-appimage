#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm neovim tree-sitter-cli nodejs

# echo "Installing debloated packages..."
# echo "---------------------------------------------------------------"
# get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
# downloads a lazy and set's up treesitter parsers, queries and treesitter textobjects.
# Change NVIM_APPNAME if you need to make any changes to where all the
# plugins, parsers are downloaded.
# NVIM_APPNAME=nvim nvim -u ./init.lua --headless
export XDG_DATA_DIRS=/usr/share/
nvim -u ./init.lua --headless

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
