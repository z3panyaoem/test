#!/bin/bash
mkdir -p output

# 更新系统
sudo apt-get update
sudo apt-get -y install tree
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint

# 下载openwrt源码
git clone -b openwrt-19.07 https://github.com/openwrt/openwrt.git
pushd openwrt

# 更新feed
./scripts/feeds update -a
./scripts/feeds install -a

# 配置
rm -rf .config .config.all
cat >> .config <<EOF
CONFIG_TARGET_bcm53xx=y
CONFIG_TARGET_bcm53xx_DEVICE_phicomm-k3=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_tcpdump=y
EOF
make defconfig >> ../output/log_cfg.txt 2>&1

# 开始编译
make V=99 >> ../output/log_build.txt 2>&1
popd

# 上载文件
cp openwrt/.config output/config
tree openwrt/bin/ >> output/log_tree.txt
