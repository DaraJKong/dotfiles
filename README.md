# dotfiles
Catppuccin themed NixOS flake for hardcore Rustaceans.

![wallpaper](https://github.com/DaraJKong/dotfiles/blob/2219742ee92756f6a0ca7cb1f5d881da06194843/theme/wall.png)

## Features
- ❄️ Flake enabled
- 🟢 GNOME + X11 + Nvidia
- 💻 Multiple hosts setup
- 🦀 Everything Rust
- 🐱 Catppuccin themed

## How to install this config
This configuration is tailored to my needs and made for my hardware. You are free to use it or get inspiration from it, but keep in mind that it may not work for your specific system. The configuration is dependent on the host machine I'm on. Currently, I have two hosts: okarin and mayushii. Okarin is for my Lenovo Legion desktop and Mayushii is for my Lemur Pro laptop. To get started, here's a guick guide:

1. First, clone this repository wherever you want using git.
```console
git clone https://github.com/DaraJKong/dotfiles.git
```
2. Then, go into the cloned directory.
```console
cd dotfiles/
```
3. Choose the host config you want to switch to, and run this command (make sure to replace "okarin" by the host name you chose).
```console
sudo nixos-rebuild switch --flake .#okarin
```
Or if you just want to test the configuration without adding it to the grub menu, use this command instead.
```console
sudo nixos-rebuild test --flake .#okarin
```

## TODO:
### Short-term
- [ ] Add laptop optimisations such as battery life (charging threshold), power saving, prevent over-heating
- [ ] Fix Lemur Pro not resuming after suspend
- [x] Configure touchpad
- [ ] Optimise flake build-time by preventing multiple evaluations of nixpkgs
- [ ] Fix unstable network/internet connection
- [ ] Style every remaining thing with Catpuccin
### Long-term
- [ ] Use agenix (or alternative) for managing secrets
- [ ] Try an impermanence setup and migrate if I like it
- [ ] Try Wayland and migrate to it
- [ ] Dump GNOME and use Cosmic DE when stable

## 🌺 Inspirations 🌷
[Sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)
