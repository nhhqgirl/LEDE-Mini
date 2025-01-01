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

sed -i '$a src-git get https://github.com/217heidai/OpenWrt-Packages' feeds.conf.default

# 1-添加 Mosdns 插件
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns



# 2-添加 Openclash 插件
wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
unzip -d package/openclash package/openclash.zip
cp -r package/openclash/OpenClash-master/luci-app-openclash package/luci-app-openclash
rm -rf package/openclash package/openclash.zip

# 3-添加 PowerOff 插件
git clone https://github.com/nhyoungboy/luci-app-poweroff.git package/luci-app-poweroff

# 4-添加 onliner 插件
sed -i '$a src-git onliner https://github.com/nhyoungboy/luci-app-onliner' feeds.conf.default


# 5-添加 opentomcat 主题
git clone --depth=1 https://github.com/nhyoungboy/luci-theme-opentomcat.git package/luci-theme-opentomcat
