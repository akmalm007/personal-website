---
date: 2026-06-18 11:11:27 +0700
title: Giving NixOS another chance
category: blog
tags: linux nixos
---
In the past when I am still exploring about Linux during my college internship I stumble with NixOS, from what I remember back then NixOS is bleeding age distro like Arch and in their website they said something like reproducible and same environment everywhere the term I still don't know the meaning at the time. 

I tried to install once in VM and is alright, another thing with NixOS you can install their [package manager](https://nixos.org/download/) everywhere like MacOS, Windows, and Linux. I have tried NixOS package manager once in Alibaba VPS, at that time I want to install Neovim newest version in the VPS but the package manager *yum* is old and only provided 6.0 version from what I remember.

I have tried to build from source in VPS with 1 vcore but that didn't work and then I remember NixOS package manager, I install it and it give me newest version of Neovim. My purpose to install Neovim in VPS is to use Neovim plugins like LSP, treesitter and so on but that is overkill for VPS purpose and Vim exist.

I encouter NixOS again from Youtube channel [@tony-btw](https://www.youtube.com/@tony-btw) he created Linux tutorial videos for dekstop user like compositor setup and install various Linux and BSD system, from his channel I know about wayland compositor [Niri]({% post_url 2026-05-17-niri-tearing %}) and have been daily driving it. 

In his recent videos he make [tier list for Linux and BSD system](https://youtu.be/7M00ZDCjAA8?si=ETxMkdsacNl4SxcT&t=236) and ranking NixOS as S tier for operator friendly system. For me the thing that make NixOS appealing again is declarative approach system, in distro like Arch or Debian if you want to install packages you do it *imperatively* meaning you make change in your system bit by bit. Like example I want to install qemu I have to install with package manager like Pacman or APT:
```sh
sudo pacman -S qemu-full
```
It make change in my system by adding the packages and depedencies, in the future if I want to remove it I have to removing it manually with package manager and sometimes you can forget about the packages name you install so it will sit there eating your storage capacity.

With NixOS you have several ways to install packages mention in [NixOS Package Search](https://search.nixos.org/packages?channel=unstable&query=qemu#show=qemu_full) the recommended approach is to install with Nix Configuration file. With this you *declaratively* install package in your system with the file you can preview:
```nix
  environment.systemPackages = [
    pkgs.qemu_full
  ];
```
It make easier to version control your system and known what packages that break your system. 

The philosopy about declarative approach is something I have read in Kubernetes or Containers Book because in the past is hard to track change in the system to look something that broke or make the application not working anymore and with this technology it try to standardize how the system should be applied in production and with NixOS I think is try to achieve the same thing either for home or production use case.

I have installed NixOS in my old laptop that previously used Debian Sid, for starter I am using Tony tutorial video to setup NixOS with [Flake](https://wiki.nixos.org/wiki/Flakes) and my goal is to reproduce my current system in Arch with NixOS configuration file and make repository for version control.

In the past few days I have been trying to learn Kubernetes and when I try to install *kind* in my old laptop it refused because Flake detect I haven't version control my Niri config file, since I have reproduce my system in NixOS I am thinking to have second version of NixOS for server use case with minimal packages. 

Then I make new directory with Flake and Nix configuration file for server setup and only install necessary packages like SSH, Container Runtime, and Kubernetes. When I am rebuild the system it remove my Niri setup and successfully installed container runtime and kubernetes, at that moment I am blown away how easily to switch between two different system with ease and I am considering to switching from Arch to NixOS in future.

