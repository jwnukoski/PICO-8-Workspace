# Pico-8 Workspace
Workspace for creating Pico-8 games.

## Overview
.p8 files will only have `#include filename.lua` lines and art/assets. No code should be written in the .p8 file directly. Code should be in an OOP style within the .lua files.  

In the future [PicoTool](https://github.com/dansanderson/picotool) will be used to compress these - possibly with GitHub Actions.

## Setup
1. `git clone` this repo into your Pico-8 carts directory. Linux's default directory would be `/home/user/.lexaloffle/pico-8/carts/`. For example, after cloning you would have a `/home/user/.lexaloffle/pico-8/carts/workspace` directory.
2. Launch Pico-8.
3. `cd workspace`.
4. `load [cart name]`.
5. `run`.

## Carts
### Test
Currently a basic bullet hell shmup in progress while developing reusable utilities.