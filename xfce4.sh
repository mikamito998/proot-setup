#!/bin/bash
set -e

apt update && apt upgrade -y
apt install -y sudo nano wget aptitude tzdata dbus-x11 tigervnc-standalone-server adwaita-icon-theme-full gnome-themes-extra --no-install-recommends --no-install-suggests
apt install udisks2 -y
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2
apt-mark hold libc6
apt install -y xfce4 xfce4-terminal --no-install-recommends --no-install-suggests

apt clean && apt autoremove -y
apt --fix-broken install
apt update && apt upgrade -y
dpkg --configure -a
apt install -f

mkdir ~/.vnc &> /dev/null

echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo 'taskset -c 4-7 termux-x11 :1 -xstartup startxfce4 2> /dev/null &' > /usr/local/bin/x11
echo 'vncserver :1 -name remote-desktop -geometry 1280x720 -localhost no' > /usr/local/bin/vnc-start
echo 'vncserver -kill' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/x11
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop
chmod +x /usr/local/bin/*
