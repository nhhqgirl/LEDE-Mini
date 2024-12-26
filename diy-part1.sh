#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 1-添加 PowerOff 插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 2-添加 Mosdns 插件
rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
# git clone https://github.com/sbwml/luci-app-mosdns.git package/lean/luci-app-mosdns

# 3-添加 Openclash 插件
wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
unzip -d package/openclash package/openclash.zip
cp -r package/openclash/OpenClash-master/luci-app-openclash package/lean/luci-app-openclash
rm -rf package/openclash package/openclash.zip

# 4-添加 argon 主题
rm -rf feeds/luci/themes/luci-theme-argon
git clone https://github.com/sbwml/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

# 5-添加 samba4 插件
rm -rf feeds/packages/libs/liburing
git clone https://github.com/sbwml/feeds_packages_libs_liburing feeds/packages/libs/liburing
rm -rf feeds/packages/net/samba4
git clone https://github.com/sbwml/feeds_packages_net_samba4 feeds/packages/net/samba4
