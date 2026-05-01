<div align="center">

# nvim-appimage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/siddhantladdha/nvim-appimage/total?logo=github&label=GitHub%20Downloads)](https://github.com/siddhantladdha/nvim-appimage/releases/latest)
[![CI Build Status](https://github.com/siddhantladdha/nvim-appimage/actions/workflows/appimage.yml/badge.svg)](https://github.com/siddhantladdha/nvim-appimage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/siddhantladdha/nvim-appimage)](https://github.com/siddhantladdha/nvim-appimage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/static/logos/neovim-logo-300x87.png" alt="Neovim" width="128">
  <img src="https://raw.githubusercontent.com/siddhantladdha/nvim-appimage/refs/heads/main/nvim.svg" alt="Treesitter" width="128">
</p>


| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/siddhantladdha/nvim-appimage/releases/latest) | [Click here](https://github.com/pkgforge-dev/Anylinux-AppImages) |

</div>

---

AppImage made using [sharun](https://github.com/VHSgunzo/sharun) and its wrapper [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks. 

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

Self-updater is disabled by default.

<details>
  <summary><b><i>raison d'être</i></b></summary>
  <img width="1151" height="430" alt="nvim-v0.12" src="https://github.com/user-attachments/assets/ed075c23-cfcd-4664-b934-815718407d07" />
  <img width="2549" height="1067" alt="treesitter parsers" src="https://github.com/user-attachments/assets/5a4710a6-7830-4561-928d-da01ece4ecbb" />
  <img width="2549" height="1098" alt="treesitter queries" src="https://github.com/user-attachments/assets/766d083c-3f0d-4f68-8ec5-4afb8a5e9324" />
<img width="1918" height="375" alt="fuck glibc" src="https://github.com/user-attachments/assets/8f914cf1-c9ec-412f-8009-be82e0faca39" />
</details>

## Make it your own.

- This is a forkable repository, based on the excellent [forkable template](https://github.com/pkgforge-dev/TEMPLATE-AppImage). Fork it, if you want to make changes, otherwise feel free to download the released appimage.
- `init.lua` is the minimal config which is used to install plugins and parsers. Add your language to the list of parsers and run the the workflow *Anylinux-AppImage*.

## Actions setup

- Go to your Actions settings -> General -> Actions Permissions
- Select **Allow _your username_, and select _your username_, actions and reusable workflows.**
- Add the following to **Allow or block specified actions and reusable workflows**.

```
actions/checkout@08c6903cd8c0fde910a37f88322edcfb5dd907a8,
actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd,
actions/download-artifact@37930b1c2abaa49bbe596cd826c3c89aef350131,
actions/upload-artifact@b7c566a772e6b6bfb58ed0dc250532a479d7789f,
pkgforge-dev/anylinux-setup-action@0964f2258d6c93d1391359978dde081fd8b3c6af,
pkgforge-dev/make-stable-appimage-release@4ed3d48ccb065352b6e6c0db6d39885b201c54a0,
softprops/action-gh-release@5be0e66d93ac7ed76da52eca8bb058f665c3a5fe,
```

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)
