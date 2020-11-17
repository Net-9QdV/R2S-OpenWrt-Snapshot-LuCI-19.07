# NanoPi-R2S 的 OpenWrt 固件  
![R2S-OpenWrt-Snapshot-LuCI-19.07](https://github.com/RikudouPatrickstar/R2S-OpenWrt-Snapshot-LuCI-19.07/workflows/R2S-OpenWrt-Snapshot-LuCI-19.07/badge.svg)  

## 一、固件特性  
### 基于 [nicksun98/R2S-OpenWrt](https://github.com/nicksun98/R2S-OpenWrt) 并做如下修改：  
1. 插件包含： `SSRPlus` `Samba4网络共享`  
2. 移除 `luci-app-opkg` `luci-app-autoreboot` `luci-app-ramfree` `luci-theme-bootstrap`  
3. 设置 `luci-theme-argon` 为默认主题且删除主题底部文字  
4. 重命名 `ShadowSocksR Plus+` 为 `SSRPlus`，不用占两行了，并且微调其设置首页内容  
5. 提供 `EXT4FS` 和 `SQUASHFS` 两种类型固件  
6. 设置 `SSH` 仅可 `LAN` 访问  
7. 设置主机名为 `NanoPi-R2S`  
8. 移除 `fuck` 组件  
9. 精简 LuCI 界面，移除 `备份/升级`  

### 默认 LAN IP、用户、密码：  
1. 默认 LAN IP： `192.168.1.1`  
2. 默认用户、密码： `root` `无`  

## 二、感谢  
   感谢所有提供了上游项目代码和给予了帮助的大佬们  

