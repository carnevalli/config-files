#!/usr/bin/env bash

apt install kate breeze-icon-theme-rcc

# From https://askubuntu.com/questions/695409/kate-is-missing-all-button-icons?noredirect=1&lq=1
cp /usr/share/icons/breeze/breeze-icons.rcc ~/.local/share/kate/icontheme.rcc
