# dotfiles
Catppuccin themed NixOS flake for hardcore Rustaceans.

![wallpaper](https://github.com/DaraJKong/dotfiles/blob/2219742ee92756f6a0ca7cb1f5d881da06194843/theme/wall.png)

## UPDATE 02/09/2024:
After a great experience lasting over half a year with this innovative system, I decided to drop NixOS. Why? Keep on reading.

There are multiple reasons that forced me to take this hard decision. Here we go:

The first reason has to be the huge amount of time required to debug the OS instead of debugging my code. In the beginning it didn't bother me, because I was able to get through my issues after some research online. And I thought that the more I learn about NixOS the more I'll be able to debug my system quickly. But over my seven months of using Nix, my walls just got even bigger to the point where there was concrete, and it hit really hard.

The second reason is the poor stability due to the iteroperability issues. Being able to reproduce my configuration is super nice. And being able to roll back to a previous version of my system is amazing, but I found that it's not worth the trouble. A great amount of new packages I installed didn't work out of the box, they required some tinkering. This is fine, I like tweaking and debugging until it works. The best part about it is I learn a lot about how my system really works. But sometimes it takes so much time and effort and new problems popup constantly. It became too much when I started wanting to compile Tauri for Android with Android Studio. Maybe my needs are just too niche to be using an even more niche system like NixOS.

These are the things I was trying to get to work before quitting NixOS:
- Compiling Tauri + Leptos for Android with Android Studio (I've tried for over a month to get it to work)
- Compiling Xilem (always got the same mysterious error not matter what I did)
- Producing music with either Waveform (not yet packaged for Nix) or LMMS with Vital synth (LMMS & Vital worked individually but never together)
- Some other minor problem with my Lemur Pro laptop config

This is so unfortunate as I really liked the concept. It's something I always dreamt of and I hope it will become better in the future (or that an improved concept appears). It's not just something that I wanted to try without the dedication and the motivation necessary to succeed. No, I switched to NixOS and I daily drived it for seven months. And I still failed... For now, I'm going back to my previous distribution. Maybe I'll get back to Nix one day, but I'm never daily driving this OS unless all my use cases work flawlessly.

That's all I had to say. Thanks, bye!

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
