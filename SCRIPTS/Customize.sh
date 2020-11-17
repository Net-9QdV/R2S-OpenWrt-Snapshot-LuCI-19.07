#!/bin/bash
clear

MY_PATH=$(pwd)

# 调整 02 脚本内容
## 移除 fuck 组件
sed -i '/fuck/d' 02_prepare_package.sh
## 更换 LuCI 为 19.07 版本
sed -i 's/nicksun98\/openwrt/openwrt\/openwrt/' 02_prepare_package.sh
sed -i 's/^#\(patch -p1 < ..\/PATCH\/new\/main\/luci_network-add-packet-steering.patch\)/\1/' 02_prepare_package.sh
# 替换默认设置
pushd ${MY_PATH}/../PATCH/duplicate/addition-trans-zh-master/files
rm -fr zzz-default-settings
cp ${MY_PATH}/../PATCH/zzz-default-settings ./
popd

# 执行 02 脚本
/bin/bash 02_prepare_package.sh

# 调整luci依赖，去除 luci-app-opkg，替换 luci-theme-bootstrap 为 luci-theme-argon
sed -i 's/+luci-app-opkg //' ./feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' ./feeds/luci/collections/luci/Makefile

# 主题
rm -fr package/new/luci-theme-argon
git clone -b master --single-branch https://github.com/jerrykuku/luci-theme-argon package/new/luci-theme-argon
sed -i '/<a class=\"luci-link\" href=\"https:\/\/github.com\/openwrt\/luci\">/d' package/new/luci-theme-argon/luasrc/view/themes/argon/footer.htm
sed -i '/<a href=\"https:\/\/github.com\/jerrykuku\/luci-theme-argon\">/d' package/new/luci-theme-argon/luasrc/view/themes/argon/footer.htm
sed -i '/<%= ver.distversion %>/d' package/new/luci-theme-argon/luasrc/view/themes/argon/footer.htm
sed -i '/<a href=\"https:\/\/github.com\/openwrt\/luci\">/d' feeds/luci/themes/luci-theme-bootstrap/luasrc/view/themes/bootstrap/footer.htm

# SSRP 微调
pushd package/lean/
cp ${MY_PATH}/../PATCH/modifySSRPlus.sh ./
bash modifySSRPlus.sh
popd

# 移除 LuCI 部分页面
pushd feeds/luci/modules/luci-mod-system/root/usr/share/luci/menu.d
rm -fr luci-mod-system.json
cp ${MY_PATH}/../PATCH/luci-mod-system.json ./
popd
pushd feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system
rm -fr flash.js mounts.js
popd
pushd feeds/luci/modules/luci-mod-system/luasrc/model/cbi/admin_system
rm -fr backupfiles.lua
popd

unset MY_PATH
exit 0
