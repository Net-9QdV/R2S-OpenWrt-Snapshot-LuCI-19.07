#!/bin/sh

# 替换首页标题及其翻译
sed -i 's/ShadowSocksR Plus+ Settings/Basic Settings/' luci-app-ssr-plus/po/zh-cn/ssr-plus.po
sed -i 's/ShadowSocksR Plus+ 设置/基本设置/' luci-app-ssr-plus/po/zh-cn/ssr-plus.po

# 删除首页不必要的内容
sed -i '/<h3>Support SS/d' luci-app-ssr-plus/po/zh-cn/ssr-plus.po
sed -i '/<h3>支持 SS/d' luci-app-ssr-plus/po/zh-cn/ssr-plus.po
sed -i 's/Map(shadowsocksr, translate("ShadowSocksR Plus+ Settings"),/Map(shadowsocksr, translate("Basic Settings"))/' luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua
sed -i '/translate("<h3>Support SS/d' luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua

# 全局替换 ShadowSocksR Plus+ 为 SSRPlus
files="$({ find luci-app-ssr-plus; } 2>"/dev/null")"
for f in ${files}
do
	if [ -f "$f" ]
	then
		# echo "$f"
		sed -i 's/ShadowSocksR Plus+/SSRPlus/gi' "$f"
	fi
done

