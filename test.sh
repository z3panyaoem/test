#!/bin/bash
mkdir -p output
echo start >> output/aaaa.txt

sudo apt-get -y install tree
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint

echo download src >> output/aaaa.txt
git clone -b openwrt-19.07 https://github.com/openwrt/openwrt.git
pushd openwrt

echo download feed >> ../output/aaaa.txt
./scripts/feeds update -a
./scripts/feeds install -a

echo config >> ../output/aaaa.txt
rm -rf .config .config.all
cat >> .config <<EOF
ONFIG_TARGET_bcm53xx=y
CONFIG_TARGET_bcm53xx_DEVICE_phicomm-k3=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_tcpdump=y
EOF
make defconfig
make V=99
popd
cp openwrt/.config output/config
tree openwrt/bin/ >> output/aaaa.txt
