# Setup 
This is tutorial for setup Linux Proot/Chroot on Android with Pulse audio

## Proot Ubuntu 
```
echo "allow-external-apps = true" >> ~/.termux/termux.properties
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties

pkg clean && termux-setup-storage && yes | pkg update &&
pkg install nano wget proot-distro pulseaudio -y && pkg clean &&
proot-distro install ubuntu &&
proot-distro clear-cache &&
echo 'pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1   
proot-distro login ubuntu --shared-tmp --no-sysvipc' > ~/.bashrc &&
termux-reload-settings
source ~/.bashrc
```

## Chroot Ubuntu 
```
su -c /data/adb/magisk/busybox wget https://github.com/ThieuMinh26/Proot-Setup/raw/main/Chroot/Test_install.sh && 
su -c chmod 777 ~/Test_install.sh && ./Test_install.sh && source ~/.bashrc ; su -c rm ~/Test_install.sh
```

## Install xfce 
```
wget https://raw.githubusercontent.com/ThieuMinh26/Proot-Setup/main/Proot-Distro.sh &&
chmod +x Proot-Distro.sh && ./Proot-Distro.sh
```

## Install box86/box64
```
wget https://raw.githubusercontent.com/ThieuMinh26/Proot-Setup/main/Box86-64_Wine86-64.sh && 
chmod +x Box86-64_Wine86-64.sh && ./Box86-64_Wine86-64.sh
```
## VirGL
### VirGL gles (Recommended)
- Install required packages
```
pkg install x11-repo 
pkg install virglrenderer-android
```
- Creating alias
```
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> /data/data/com.termux/files/home/.bashrc 
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT GALLIUM_DRIVER=virpipe WINEDEBUG=-all"' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/.bashrc
```
### VirGL zink (Not recommended)
- Install required packages
```
pkg install x11-repo tur-repo
pkg install mesa-zink virglrenderer-mesa-zink
```
- Creating alias
```
echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &"' >> /data/data/com.termux/files/home/.bashrc
echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT GALLIUM_DRIVER=virpipe WINEDEBUG=-all"' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/.bashrc
```


