# 大气层个人整合包生成脚本

## 功能如下：

- 下载最新：
  - 大气层三件套
    - [x] `Atmosphere + Fusee` [From Here](https://github.com/Atmosphere-NX/Atmosphere/releases/latest)
    - [x] `Hekate + Nyx 简体中文` [From Here](https://github.com/easyworld/hekate/releases/latest)
    - [x] `Sigpatches` [From Here](https://hackintendo.com/download/sigpatches/)
  - Payload插件
    - [x] 主机系统的密钥提取工具 `Lockpick_RCM` [From Here](https://github.com/Decscots/Lockpick_RCM/releases/latest)
    - [x] Hekate下删除主题和关闭插件自动启动 `CommonProblemResolver` [From Here](https://github.com/zdm65477730/CommonProblemResolver/releases/latest)
  - Nro插件
    - [x] 联网检测是否屏蔽任天堂服务器 `Switch_90DNS_tester` [From Here](https://github.com/meganukebmp/Switch_90DNS_tester/releases/latest)
    - [x] 游戏安装，存档管理和文件传输工具 `DBI` [From Here](https://github.com/rashevskyv/dbi/releases/latest)
    - [x] 游戏安装和文件传输工具 `Awoo Installer` [From Here](https://github.com/dragonflylee/Awoo-Installer/releases/latest)
    - [x] 深海工具箱 `Hekate-toolbox` [From Here](https://github.com/WerWolv/Hekate-Toolbox/releases/latest)
    - [x] 游戏游玩时间记录工具 `NX-Activity-Log` [From Here](https://github.com/zdm65477730/NX-Activity-Log/releases/latest)
    - [x] 主题安装工具 `NXThemesInstaller` [From Here](https://github.com/exelix11/SwitchThemeInjector/releases/latest)
    - [x] 游戏存档管理工具 `JKSV` [From Here](https://github.com/J-D-K/JKSV/releases/latest)
    - [x] 第三方B站客户端 `wiliwili` [From Here](https://github.com/xfangfang/wiliwili/releases/latest)
    - [x] Mod下载器 `SimpleModDownloader` [From Here](https://github.com/PoloNX/SimpleModDownloader/releases/latest)
    - [x] 串流工具 `Moonlight-nx` [From Here](https://api.github.com/repos/rock88/moonlight-nx/releases/latest)
    - [x] 文件管理 `NX-Shell` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 黑商店 `hb-appstore`  [From Here](https://github.com/fortheusers/hb-appstore/releases/latest)
    - [x] 系统升级工具 `daybreak`  [From Here](https://www.tekqart.com/thread-258184-1-1.html)

  - 补丁
    - [x] 主题破解 `theme-patches` [From Here](https://github.com/exelix11/theme-patches)

  - Ultrahand
    - [x] 加载器 `nx-ovlloader` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 菜单 `Ultrahand-Overlay` [From Here](https://github.com/ppkantorski/Ultrahand-Overlay/releases/latest)

  - Ovl插件
    - [x] 系统模块 `ovl-sysmodules` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 系统监视 `StatusMonitor` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 掌机底座模式切换 `ReverseNX-RT` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 局域网联机 `ldn_mitm` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 虚拟Amiibo `emuiibo` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] Amiibo下载器 `AmiiboGenerator` [From Here](https://github.com/Slluxx/AmiiboGenerator)
    - [x] 色彩调整 `Fizeau` [From Here](https://www.tekqart.com/thread-222735-1-1.html)
    - [x] 系统补丁 `sys-patch` [From Here](https://github.com/impeeza/sys-patch/releases/latest)
    - [x] 超频插件 `sys-clk` [From Here](https://github.com/retronx-team/sys-clk/releases/latest)
    - [x] 调频插件 `OC Toolkit` [From Here](https://github.com/halop/OC_Toolkit/releases/latest)

- 文件操作：
    - [x] 移动 `fusee.bin` 至 `bootloader/payloads` 文件夹
    - [x] 将 `hekate_ctcaer_*.bin` 重命名为 `payload.bin`
    - [x] 在 `bootloader` 文件夹中创建 `hekate_ipl.ini`
    - [x] 在根目录中创建 `exosphere.ini`
    - [x] 在 `atmosphere/hosts` 文件夹中创建 `emummc.txt` 和 `sysmmc.txt`
    - [x] 在根目录中创建 `boot.ini`
    - [x] 在 `atmosphere/config` 文件夹中创建 `override_config.ini`
    - [x] 在 `atmosphere/config` 文件夹中创建 `system_settings.ini`
    - [x] 删除 `switch` 文件夹中 `haze.nro`
    - [x] 删除 `switch` 文件夹中 `daybreak.nro`
    - [x] 删除 `switch` 文件夹中 `reboot_to_payload.nro`

## 使用说明 (仅适用于 `Linux`):
  - 安装 `jq` 工具
  - 运行脚本 (switchScript.sh)

## 更新日志
- 2024-09-07 'Update module upstream to github release except some missing, remove sys-tune'
- 2024-09-01 'Add What Changed info'
- 2024-08-16 'First commit based on my own need'


# Special Thanks & Fork from
- [huangqian8](https://github.com/huangqian8/SwitchScript)
