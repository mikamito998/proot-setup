#!/bin/bash

cd
rm -rf ~/.wine
rm -rf ~/64bit-wine.tar.xz
wget https://github.com/ThieuMinh26/Proot-Setup/releases/download/1.0/64bit-wine.tar.xz
tar -xf 64bit-wine.tar.xz
echo 'alias gst="WINEDLLOVERRIDES=\"winegstreamer=\""' >> ~/.bashrc
source ~/.bashrc
clear

echo "If you have kernel32.dll problem , restart Termux"
echo "And use : gst box86 wine winecfg"
echo "Or : rm -rf ~/.wine && WINEARCH=win32 box86 wine winecfg"

