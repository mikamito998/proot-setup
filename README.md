# Setup Box 86-64 + wine x86-64
First edit /etc/apt/sources.list

sudo dpkg --add-architecture armhf

sudo apt update && sudo apt upgrade

Install related kits :

sudo apt update

sudo apt install git build-essential cmake wget gcc-arm-linux-gnueabihf zenity:armhf libasound*:armhf libstdc++6:armhf mesa*:armhf

sudo apt install zenity:armhf libasound*:armhf libstdc++6:armhf mesa*:armhf #box86_dependencies

sudo apt install mesa* zenity* #box64_dependencies
# Compile Box86 with parameters for Raspberry Pi 4
cd

git clone https://github.com/ptitSeb/box86

cd box86

mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo

make -j$(nproc)

sudo make install

cd

rm -rf box86
# Compile Box64
git clone https://github.com/ptitSeb/box64.git

cd box64

mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo

make -j$(nproc)

sudo make install

cd

rm -rf box64

# Download Wine 7.0-rc5
mkdir wine

cd wine

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-7.0-rc5-upstream-linux-x86.tar.gz

tar -xvf *.tar.gz

cd

# Download Wine64 6.17
cd

mkdir wine64

cd wine64

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.17-upstream-linux-amd64.tar.gz

tar -xvf *.tar.gz

cd

# Add these lines to your /etc/profile:

export BOX86_PATH=~/wine/bin/

export BOX86_LD_LIBRARY_PATH=~/wine/lib/wine/i386-unix/:/lib/i386-linux-gnu:/lib/aarch64-linux-gnu/

export BOX64_PATH=~/wine64/bin/

export BOX64_LD_LIBRARY_PATH=~/wine64/lib/i386-unix/:~/wine64/lib/wine/x86_64-unix/:/lib/i386-linux-gnu/:/lib/x86_64-linux-gnu:/lib/aarch64-linux-gnu
