git clone https://github.com/AndreaCatania/godot.git -b brain
sudo chown -R $USER godot
sudo apt-get install build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
    libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev yasm
sudo apt install libfreetype6-dev
cd godot/thirdparty
sudo rm -r brain
git clone https://github.com/AndreaCatania/brain.git -b 24831accd8
sudo chown -R $USER brain
cd ..
cd ..
sudo chown -R $USER godot
cd godot
scons platform=x11 -j8scons platform=x11 -j8