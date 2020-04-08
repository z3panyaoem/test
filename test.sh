#!/bin/bash
mkdir -p output
echo start >> output/aaaa.txt

echo download src >> output/aaaa.txt
git clone -b openwrt-19.07 https://github.com/openwrt/openwrt.git
pushd openwrt

echo download feed >> ../output/aaaa.txt
./scripts/feeds update -a
./scripts/feeds install -a

echo config >> ../output/aaaa.txt
make defconfig
popd
cp openwrt/.config output/
tree openwrt/ >> output/aaaa.txt
