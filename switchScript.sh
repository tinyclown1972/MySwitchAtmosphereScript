#!/bin/sh
set -e

# Credit to the Authors at https://rentry.org/CFWGuides
# Script created by Fraxalotl
# Edited by leonard

###################################################################################
#                             Some define area                                    #
###################################################################################
SIDPATCH_URL="https://sigmapatches.su/"

###################################################################################
#                    Create a few new folders for storing files                   #
###################################################################################
if [ -d SwitchSD ]; then
  rm -rf SwitchSD
fi

if [ -e description.txt ]; then
  rm -rf description.txt
fi

mkdir -p ./SwitchSD/atmosphere/config
mkdir -p ./SwitchSD/atmosphere/hosts
mkdir -p ./SwitchSD/atmosphere/contents/420000000007E51Anx-ovlloader
mkdir -p ./SwitchSD/atmosphere/contents/0000000000534C56ReverseNX-RT
mkdir -p ./SwitchSD/atmosphere/contents/4200000000000010ldn_mitm
mkdir -p ./SwitchSD/atmosphere/contents/0100000000000352emuiibo
mkdir -p ./SwitchSD/atmosphere/contents/0100000000000F12Fizeau
mkdir -p ./SwitchSD/atmosphere/contents/4200000000000000sys-tune
mkdir -p ./SwitchSD/atmosphere/contents/00FF0000636C6BFFsys-clk
mkdir -p ./SwitchSD/atmosphere/kips
mkdir -p ./SwitchSD/bootloader/payloads
mkdir -p ./SwitchSD/config/ultrahand/lang
mkdir -p ./SwitchSD/switch/Switch_90DNS_tester
mkdir -p ./SwitchSD/switch/DBI
mkdir -p ./SwitchSD/switch/HB-App-Store
mkdir -p ./SwitchSD/switch/HekateToolbox
mkdir -p ./SwitchSD/switch/JKSV
mkdir -p ./SwitchSD/switch/Moonlight
mkdir -p ./SwitchSD/switch/NXThemesInstaller
mkdir -p ./SwitchSD/switch/SimpleModDownloader
mkdir -p ./SwitchSD/switch/wiliwili
mkdir -p ./SwitchSD/switch/AmiiboGenerator
mkdir -p ./SwitchSD/switch/NXShell
mkdir -p ./SwitchSD/switch/.overlays
mkdir -p ./SwitchSD/switch/.packages

cd SwitchSD

###################################################################################
#                         Latest module released in github                        #
###################################################################################
# Fetch latest atmosphere and fusee from https://github.com/Atmosphere-NX/Atmosphere/releases/latest
# Fetch atmosphere first
curl -sL https://api.github.com/repos/Atmosphere-NX/Atmosphere/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*atmosphere[^"]*.zip' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o atmosphere.zip
if [ $? -ne 0 ]; then
  echo "atmosphere download\033[31m failed\033[0m."
else
  echo "atmosphere download\033[32m success\033[0m."
  unzip -oq atmosphere.zip
  rm atmosphere.zip
  # Then Fetch Fusee
  cat resp.tmp \
    | grep -oP '"browser_download_url": "\Khttps://[^"]*fusee.bin"' \
    | sed 's/"//g' \
    | xargs -I {} curl -sL {} -o fusee.bin
  if [ $? -ne 0 ]; then
    echo "fusee download\033[31m failed\033[0m."
  else
    echo "fusee download\033[32m success\033[0m."
    mv fusee.bin ./bootloader/payloads
  fi
fi

# Fetch Hekate + Nyx CHS from https://api.github.com/repos/easyworld/hekate/releases/latest
curl -sL https://api.github.com/repos/easyworld/hekate/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*hekate_ctcaer[^"]*_sc.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o hekate.zip
if [ $? -ne 0 ]; then
    echo "Hekate + Nyx CHS download\033[31m failed\033[0m."
else
    echo "Hekate + Nyx CHS download\033[32m success\033[0m."
    unzip -oq hekate.zip
    rm hekate.zip
fi

# Fetch latest Lockpick_RCM.bin from https://github.com/Kofysh/Lockpick_RCM/releases
curl -sL https://api.github.com/repos/Kofysh/Lockpick_RCM/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo Lockpick_RCM {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*Lockpick_RCM.bin"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o Lockpick_RCM.bin
if [ $? -ne 0 ]; then
    echo "Lockpick_RCM download\033[31m failed\033[0m."
else
    echo "Lockpick_RCM download\033[32m success\033[0m."
    mv Lockpick_RCM.bin ./bootloader/payloads
fi

# Fetch lastest SaltyNX from https://github.com/masagrator/SaltyNX/releases
curl -sL https://api.github.com/repos/masagrator/SaltyNX/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "SaltyNX" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*SaltyNX[^"]*.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o SaltyNX.zip
if [ $? -ne 0 ]; then
    echo "SaltyNX download\033[31m failed\033[0m."
else
    echo "SaltyNX download\033[32m success\033[0m."
    unzip -oq SaltyNX.zip
    rm SaltyNX.zip
fi

# Fetch latest CommonProblemResolver.bin form https://github.com/zdm65477730/CommonProblemResolver/releases/latest
curl -sL https://api.github.com/repos/zdm65477730/CommonProblemResolver/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo CommonProblemResolver {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*CommonProblemResolver.bin"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o CommonProblemResolver.bin
if [ $? -ne 0 ]; then
    echo "CommonProblemResolver download\033[31m failed\033[0m."
else
    echo "CommonProblemResolver download\033[32m success\033[0m."
    mv CommonProblemResolver.bin ./bootloader/payloads
fi

# Fetch lastest Switch_90DNS_tester
curl -sL https://api.github.com/repos/meganukebmp/Switch_90DNS_tester/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo Switch_90DNS_tester {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*Switch_90DNS_tester.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o Switch_90DNS_tester.nro
if [ $? -ne 0 ]; then
    echo "Switch_90DNS_tester download\033[31m failed\033[0m."
else
    echo "Switch_90DNS_tester download\033[32m success\033[0m."
    mv Switch_90DNS_tester.nro ./switch/Switch_90DNS_tester
fi

# # Fetch lastest DBI from https://github.com/rashevskyv/dbi/releases/latest
# curl -sL https://api.github.com/repos/rashevskyv/dbi/releases/latest > resp.tmp
# cat resp.tmp \
#   | jq '.name' \
#   | xargs -I {} echo {} >> ../description.txt
# cat resp.tmp \
#   | grep -oP '"browser_download_url": "\Khttps://[^"]*DBI.nro"' \
#   | sed 's/"//g' \
#   | xargs -I {} curl -sL {} -o DBI.nro
# if [ $? -ne 0 ]; then
#     echo "DBI download\033[31m failed\033[0m."
# else
#     echo "DBI download\033[32m success\033[0m."
#     mv DBI.nro ./switch/DBI
# fi

# Fetch lastest Awoo Installer from https://github.com/dragonflylee/Awoo-Installer/releases/latest
curl -sL https://api.github.com/repos/dragonflylee/Awoo-Installer/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*Awoo-Installer.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o Awoo-Installer.zip
if [ $? -ne 0 ]; then
    echo "Awoo Installer download\033[31m failed\033[0m."
else
    echo "Awoo Installer download\033[32m success\033[0m."
    unzip -oq Awoo-Installer.zip
    rm Awoo-Installer.zip
fi

# Fetch lastest Hekate-toolbox from https://github.com/WerWolv/Hekate-Toolbox/releases/latest
curl -sL https://api.github.com/repos/WerWolv/Hekate-Toolbox/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo HekateToolbox {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*HekateToolbox.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o HekateToolbox.nro
if [ $? -ne 0 ]; then
    echo "HekateToolbox download\033[31m failed\033[0m."
else
    echo "HekateToolbox download\033[32m success\033[0m."
    mv HekateToolbox.nro ./switch/HekateToolbox
fi

# Fetch lastest NXThemesInstaller from https://github.com/exelix11/SwitchThemeInjector/releases/latest
curl -sL https://api.github.com/repos/exelix11/SwitchThemeInjector/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo NXThemesInstaller {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*NXThemesInstaller.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o NXThemesInstaller.nro
if [ $? -ne 0 ]; then
    echo "NXThemesInstaller download\033[31m failed\033[0m."
else
    echo "NXThemesInstaller download\033[32m success\033[0m."
    mv NXThemesInstaller.nro ./switch/NXThemesInstaller
fi

# Fetch lastest JKSV from https://github.com/J-D-K/JKSV/releases/latest
curl -sL https://api.github.com/repos/J-D-K/JKSV/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo JKSV {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*JKSV.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o JKSV.nro
if [ $? -ne 0 ]; then
    echo "JKSV download\033[31m failed\033[0m."
else
    echo "JKSV download\033[32m success\033[0m."
    mv JKSV.nro ./switch/JKSV
fi

# Fetch lastest aio-switch-updater from https://kkgithub.com/HamletDuFromage/aio-switch-updater/releases/latest
curl -sL https://api.github.com/repos/HamletDuFromage/aio-switch-updater/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo aio-switch-updater {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*aio-switch-updater.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o aio-switch-updater.zip
if [ $? -ne 0 ]; then
    echo "aio-switch-updater download\033[31m failed\033[0m."
else
    echo "aio-switch-updater download\033[32m success\033[0m."
    unzip -oq aio-switch-updater.zip
    rm aio-switch-updater.zip
fi

# Fetch lastest wiliwili from https://github.com/xfangfang/wiliwili/releases/latest
curl -sL https://api.github.com/repos/xfangfang/wiliwili/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo wiliwili {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*wiliwili-NintendoSwitch.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o wiliwili-NintendoSwitch.zip
if [ $? -ne 0 ]; then
    echo "wiliwili download\033[31m failed\033[0m."
else
    echo "wiliwili download\033[32m success\033[0m."
    unzip -oq wiliwili-NintendoSwitch.zip
    mv wiliwili/wiliwili.nro ./switch/wiliwili
    rm -rf wiliwili
    rm wiliwili-NintendoSwitch.zip
fi

# Fetch lastest SimpleModDownloader from https://github.com/PoloNX/SimpleModDownloader/releases/latest
curl -sL https://api.github.com/repos/PoloNX/SimpleModDownloader/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo SimpleModDownloader {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*SimpleModDownloader.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o SimpleModDownloader.nro
if [ $? -ne 0 ]; then
    echo "SimpleModDownloader download\033[31m failed\033[0m."
else
    echo "SimpleModDownloader download\033[32m success\033[0m."
    mv SimpleModDownloader.nro ./switch/SimpleModDownloader
fi

# Fetch lastest Moonlight from https://api.github.com/repos/rock88/moonlight-nx/releases/latest
curl -sL https://api.github.com/repos/rock88/moonlight-nx/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo Moonlight-nx {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*moonlight.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o moonlight.zip
if [ $? -ne 0 ]; then
    echo "Moonlight-nx download\033[31m failed\033[0m."
else
    echo "Moonlight-nx download\033[32m success\033[0m."
    unzip -oq moonlight.zip
    mv moonlight.nro ./switch/Moonlight
    rm moonlight.zip
fi

# Fetch lastest hb-appstore from https://github.com/fortheusers/hb-appstore/releases/latest
curl -sL https://api.github.com/repos/fortheusers/hb-appstore/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*appstore.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o appstore.nro
if [ $? -ne 0 ]; then
    echo "hb-appstore download\033[31m failed\033[0m."
else
    echo "hb-appstore download\033[32m success\033[0m."
    mv appstore.nro ./switch/HB-App-Store
fi

# Fetch lastest theme-patches from https://github.com/exelix11/theme-patches
git clone https://github.com/exelix11/theme-patches
if [ $? -ne 0 ]; then
    echo "theme-patches download\033[31m failed\033[0m."
else
    echo "theme-patches download\033[32m success\033[0m."
    mkdir themes
    mv -f theme-patches/systemPatches ./themes/
    rm -rf theme-patches
fi

# Fetch lastest Ultrahand-Overlay from https://github.com/ppkantorski/Ultrahand-Overlay/releases/latest
curl -sL https://api.github.com/repos/ppkantorski/Ultrahand-Overlay/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*lang.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o lang.zip
if [ $? -ne 0 ]; then
  echo "Ultrahand-Overlay language download\033[31m failed\033[0m."
else
  echo "Ultrahand-Overlay language download\033[32m success\033[0m."
  cat resp.tmp \
    | grep -oP '"browser_download_url": "\Khttps://[^"]*ovlmenu.ovl"' \
    | sed 's/"//g' \
    | xargs -I {} curl -sL {} -o ovlmenu.ovl
  if [ $? -ne 0 ]; then
    echo "Ultrahand-Overlay ovlmenu download\033[31m failed\033[0m."
  else
    echo "Ultrahand-Overlay ovlmenu download\033[32m success\033[0m."
    unzip -oq lang.zip -d ./config/ultrahand/lang/
    mv ovlmenu.ovl ./switch/.overlays
    rm lang.zip
  fi
fi

# Fetch AmiiboGenerator
curl -sL https://api.github.com/repos/Slluxx/AmiiboGenerator/releases > resp.tmp
cat resp.tmp \
  | jq '.[0].tag_name' \
  | xargs -I {} echo AmiiboGenerator {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*AmiiboGenerator.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o AmiiboGenerator.nro
if [ $? -ne 0 ]; then
  echo "AmiiboGenerator download\033[31m failed\033[0m."
else
  echo "AmiiboGenerator download\033[32m success\033[0m."
  mv AmiiboGenerator.nro ./switch/AmiiboGenerator
fi

# Fetch sys-patch from https://github.com/impeeza/sys-patch/releases/latest
curl -sL https://api.github.com/repos/impeeza/sys-patch/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo sys-patch {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*sys-patch[^"]*.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o sys-patch.zip
if [ $? -ne 0 ]; then
  echo "sys-patch download\033[31m failed\033[0m."
else
  echo "sys-patch download\033[32m success\033[0m."
  unzip -oq sys-patch.zip
  rm sys-patch.zip
fi

# Fetch sys-clk from https://github.com/retronx-team/sys-clk/releases/latest
curl -sL https://api.github.com/repos/retronx-team/sys-clk/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo sys-clk {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*sys-clk[^"]*.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o sys-clk.zip
if [ $? -ne 0 ]; then
  echo "sys-clk download\033[31m failed\033[0m."
else
  echo "sys-clk download\033[32m success\033[0m."
  unzip -oq sys-clk.zip
  rm sys-clk.zip
  rm README.md
fi

# Fetch lastest OC_Toolkit from https://github.com/halop/OC_Toolkit/releases/latest
curl -sL https://api.github.com/repos/halop/OC_Toolkit_SC_EOS/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*kip.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o kip.zip
if [ $? -ne 0 ]; then
  echo "OC_Toolkit kip download\033[31m failed\033[0m."
else
  echo "OC_Toolkit kip download\033[31m success\033[0m."
  cat resp.tmp \
    | grep -oP '"browser_download_url": "\Khttps://[^"]*OC.Toolkit.u.zip"' \
    | sed 's/"//g' \
    | xargs -I {} curl -sL {} -o OC.Toolkit.u.zip
  if [ $? -ne 0 ]; then
    echo "OC_Toolkit OC.Toolkit.u download\033[31m failed\033[0m."
  else
    echo "OC_Toolkit OC.Toolkit.u download\033[32m success\033[0m."
    unzip -oq kip.zip -d ./atmosphere/kips/
    unzip -oq OC.Toolkit.u.zip -d ./switch/.packages/
    rm kip.zip
    rm OC.Toolkit.u.zip
  fi
fi

# Fetch ovl-sysmodules
curl -sL https://api.github.com/repos/WerWolv/ovl-sysmodules/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "ovl-sysmodules" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*ovlSysmodules.ovl"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o ovlSysmodules.ovl
if [ $? -ne 0 ]; then
  echo "ovlSysmodules download\033[31m failed\033[0m."
else
  echo "ovlSysmodules download\033[32m success\033[0m."
  mv ovlSysmodules.ovl switch/.overlays/ovlSysmodules.ovl
fi

# Fetch nx-ovlloader
curl -sL https://api.github.com/repos/WerWolv/nx-ovlloader/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "nx-ovlloader" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*nx-ovlloader.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o nx-ovlloader.zip
if [ $? -ne 0 ]; then
  echo "nx-ovlloader download\033[31m failed\033[0m."
else
  echo "nx-ovlloader download\033[32m success\033[0m."
  unzip -oq nx-ovlloader.zip
  rm nx-ovlloader.zip
fi

# Fetch Fizeau
curl -sL https://api.github.com/repos/averne/Fizeau/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "Fizeau" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*Fizeau[^"]*.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o Fizeau.zip
if [ $? -ne 0 ]; then
  echo "Fizeau download\033[31m failed\033[0m."
else
  echo "Fizeau download\033[32m success\033[0m."
  unzip -oq Fizeau.zip
  rm Fizeau.zip
fi

# Fetch emuiibo
curl -sL https://api.github.com/repos/XorTroll/emuiibo/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "emuiibo" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*emuiibo.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o emuiibo.zip
if [ $? -ne 0 ]; then
    echo "emuiibo download\033[31m failed\033[0m."
else
    echo "emuiibo download\033[32m success\033[0m."
    unzip -oq emuiibo.zip
    cp -r SdOut/* ./
    rm -rf SdOut
    rm emuiibo.zip
fi

# Fetch StatusMonitor
curl -sL https://api.github.com/repos/masagrator/Status-Monitor-Overlay/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "StatusMonitor" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*Status-Monitor-Overlay.zip"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o StatusMonitor.zip
if [ $? -ne 0 ]; then
    echo "StatusMonitor download\033[31m failed\033[0m."
else
    echo "StatusMonitor download\033[32m success\033[0m."
    unzip -oq StatusMonitor.zip
    rm StatusMonitor.zip
fi

# Fetch ReverseNX-RT
curl -sL https://api.github.com/repos/masagrator/ReverseNX-RT/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "ReverseNX-RT" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*ReverseNX-RT-ovl.ovl"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o ReverseNX-RT.ovl
if [ $? -ne 0 ]; then
  echo "ReverseNX-RT download\033[31m failed\033[0m."
else
  echo "ReverseNX-RT download\033[32m success\033[0m."
  mv ReverseNX-RT.ovl switch/.overlays/ReverseNX-RT.ovl
fi

# Fetch NX-Shell
curl -sL https://api.github.com/repos/joel16/NX-Shell/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "NX-Shell" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*NX-Shell.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o NX-Shell.nro
if [ $? -ne 0 ]; then
  echo "NX-Shell download\033[31m failed\033[0m."
else
  echo "NX-Shell download\033[32m success\033[0m."
  mv NX-Shell.nro switch/NXShell/NX-Shell.nro
fi

# Fetch lastest NX-Activity-Log
curl -sL https://api.github.com/repos/zdm65477730/NX-Activity-Log/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "NX-Activity-Log" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*NX-Activity-Log.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o NX-Activity-Log.nro
if [ $? -ne 0 ]; then
    echo "NX-Activity-Log download\033[31m failed\033[0m."
else
    echo "NX-Activity-Log download\033[32m success\033[0m."
    mv NX-Activity-Log.nro switch/NX-Activity-Log.nro
fi

# Fetch FPSLocker
curl -sL https://api.github.com/repos/masagrator/FPSLocker/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "FPSLocker" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*FPSLocker.ovl"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o FPSLocker.ovl
if [ $? -ne 0 ]; then
  echo "FPSLocker download\033[31m failed\033[0m."
else
  echo "FPSLocker download\033[32m success\033[0m."
  mv FPSLocker.ovl switch/.overlays/FPSLocker.ovl
fi

# Fetch EdiZon
curl -sL https://api.github.com/repos/WerWolv/EdiZon/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "Edizon" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*EdiZon.nro"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o Edizon.nro
if [ $? -ne 0 ]; then
  echo "Edizon download\033[31m failed\033[0m."
else
  echo "Edizon download\033[32m success\033[0m."
  mv Edizon.nro switch/Edizon.nro
fi

# Fetch EdiZon overlay
curl -sL https://api.github.com/repos/proferabg/EdiZon-Overlay/releases/latest > resp.tmp
cat resp.tmp \
  | jq '.tag_name' \
  | xargs -I {} echo "Edizon overlay" {} >> ../description.txt
cat resp.tmp \
  | grep -oP '"browser_download_url": "\Khttps://[^"]*ovlEdiZon.ovl"' \
  | sed 's/"//g' \
  | xargs -I {} curl -sL {} -o ovlEdiZon.ovl
if [ $? -ne 0 ]; then
  echo "ovlEdiZon.ovl download\033[31m failed\033[0m."
else
  echo "ovlEdiZon.ovl download\033[32m success\033[0m."
  mv ovlEdiZon.ovl switch/.overlays/ovlEdiZon.ovl
fi

###################################################################################
#                         modules not release in github                           #
###################################################################################
### Fetch Sigpatches from https://hackintendo.com/download/sigpatches
curl -sL $SIDPATCH_URL -o tmp.html
if [ $? -ne 0 ]; then
  echo "sigpatches url invalid."
else
  link=$(grep -oP 'href="\K[^"]+' tmp.html | grep -oP 'sigpatches\.zip\?[0-9.]+')
  description=$(echo $link | sed 's/\?/ /g')
  link="$SIDPATCH_URL$link"
  curl -sL $link -o sigpatches.zip
  if [ $? -ne 0 ]; then
      echo "sigpatches download\033[31m failed\033[0m."
  else
      echo "sigpatches download\033[32m success\033[0m."
      echo $description >> ../description.txt
      unzip -oq sigpatches.zip
      rm sigpatches.zip
      rm tmp.html
  fi
fi

# Fetch logo
curl -sL https://raw.githubusercontent.com/huangqian8/SwitchPlugins/main/theme/logo.zip -o logo.zip
if [ $? -ne 0 ]; then
    echo "logo download\033[31m failed\033[0m."
else
    echo "logo download\033[32m success\033[0m."
    unzip -oq logo.zip
    rm logo.zip
fi

# Fetch bootlogo
curl -sL https://raw.githubusercontent.com/tinyclown1972/MySwitchAtmosphereScript/refs/heads/master/resource/bootlogo.bmp -o bootlogo.bmp
if [ $? -ne 0 ]; then
    echo "bootlogo download\033[31m failed\033[0m."
else
    echo "bootlogo download\033[32m success\033[0m."
    mv bootlogo.bmp ./bootloader/bootlogo.bmp
fi

# Fetch DBI English Ver
curl -sL https://raw.githubusercontent.com/tinyclown1972/MySwitchAtmosphereScript/refs/heads/master/resource/DBI.nro -o DBI.nro
if [ $? -ne 0 ]; then
    echo "DBI download\033[31m failed\033[0m."
else
    echo "DBI download\033[32m success\033[0m."
    echo "DBI 658" >> ../description.txt
    mv DBI.nro ./switch/DBI/DBI.nro
fi

# Fetch daybreak_x
curl -sL https://raw.githubusercontent.com/huangqian8/SwitchPlugins/main/plugins/daybreak_x.zip -o daybreak_x.zip
if [ $? -ne 0 ]; then
    echo "daybreak download\033[31m failed\033[0m."
else
    echo "daybreak download\033[32m success\033[0m."
    echo "daybreak_x" >> ../description.txt
    unzip -oq daybreak_x.zip
    rm daybreak_x.zip
fi

###################################################################################
#                         Compare what changed since last build                   #
###################################################################################
# get latest description
curl https://api.github.com/repos/tinyclown1972/MySwitchAtmosphereScript/releases \
  | jq ".[0].body" \
  | xargs -I {} echo -e {} > ../pre_desc.txt
# find latest what changed info and remove them
START=$(sed -n '/Here is What Changed:/=' ../pre_desc.txt)
END=$(sed -n '/What Changed Over/=' ../pre_desc.txt)
# remove pre what changed info
if [ -n "$START" ] && [ -n "$END" ]; then
  echo "Start: ${START}, End: ${END}"
  sed -i "${START},${END}d" ../pre_desc.txt
else
  echo "Can not find latest what changed info"
fi
# Compare with description this time
set +e
diff ../pre_desc.txt ../description.txt -Z -b -w -B > ../what_changed.txt
set -e

echo " " >> ../description.txt
echo "Here is What Changed:" >> ../description.txt
echo "~~~" >> ../description.txt
cat ../what_changed.txt >> ../description.txt
echo "~~~" >> ../description.txt
echo "What Changed Over" >> ../description.txt

###################################################################################
#                         Rename/Write/Clean Action                               #
###################################################################################
# Rename hekate_ctcaer_*.bin to payload.bin
find . -name "*hekate_ctcaer*" -exec mv {} payload.bin \;
if [ $? -ne 0 ]; then
    echo "Rename hekate_ctcaer_*.bin to payload.bin\033[31m failed\033[0m."
else
    echo "Rename hekate_ctcaer_*.bin to payload.bin\033[32m success\033[0m."
fi

# Write hekate_ipl.ini in /bootloader/
cat > ./bootloader/hekate_ipl.ini << ENDOFFILE
[config]
autoboot=2
autoboot_list=0
bootwait=1
backlight=100
noticker=1
autohosoff=1
autonogc=1
updater2p=0
bootprotect=0

[Fusee]
icon=bootloader/res/icon_ams.bmp
payload=bootloader/payloads/fusee.bin

[CFW (emuMMC)]
emummcforce=1
fss0=atmosphere/package3
kip1patch=nosigchk
kip1=atmosphere/kips/loader.kip
atmosphere=1
icon=bootloader/res/icon_Atmosphere_emunand.bmp
id=cfw-emu

[CFW (sysMMC)]
emummc_force_disable=1
fss0=atmosphere/package3
kip1patch=nosigchk
atmosphere=1
icon=bootloader/res/icon_Atmosphere_sysnand.bmp
id=cfw-sys

[Stock SysNAND]
emummc_force_disable=1
fss0=atmosphere/package3
icon=bootloader/res/icon_stock.bmp
stock=1
id=ofw-sys
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing hekate_ipl.ini in ./bootloader/ directory\033[31m failed\033[0m."
else
    echo "Writing hekate_ipl.ini in ./bootloader/ directory\033[32m success\033[0m."
fi

# write exosphere.ini in root of SD Card
cat > ./exosphere.ini << ENDOFFILE
[exosphere]
debugmode=1
debugmode_user=0
disable_user_exception_handlers=0
enable_user_pmu_access=0
; 控制真实系统启用隐身模式。
blank_prodinfo_sysmmc=1
; 控制虚拟系统启用隐身模式。
blank_prodinfo_emummc=1
allow_writing_to_cal_sysmmc=0
log_port=0
log_baud_rate=115200
log_inverted=0
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing exosphere.ini in root of SD card\033[31m failed\033[0m."
else
    echo "Writing exosphere.ini in root of SD card\033[32m success\033[0m."
fi

# Write emummc.txt & sysmmc.txt in /atmosphere/hosts
cat > ./atmosphere/hosts/emummc.txt << ENDOFFILE
# 屏蔽任天堂服务器
127.0.0.1 *nintendo.*
127.0.0.1 *nintendo-europe.com
127.0.0.1 *nintendoswitch.*
127.0.0.1 ads.doubleclick.net
127.0.0.1 s.ytimg.com
127.0.0.1 ad.youtube.com
127.0.0.1 ads.youtube.com
127.0.0.1 clients1.google.com
207.246.121.77 *conntest.nintendowifi.net
207.246.121.77 *ctest.cdn.nintendo.net
69.25.139.140 *ctest.cdn.n.nintendoswitch.cn
95.216.149.205 *conntest.nintendowifi.net
95.216.149.205 *ctest.cdn.nintendo.net
95.216.149.205 *90dns.test
ENDOFFILE
cp ./atmosphere/hosts/emummc.txt ./atmosphere/hosts/sysmmc.txt
if [ $? -ne 0 ]; then
    echo "Writing emummc.txt and sysmmc.txt in ./atmosphere/hosts\033[31m failed\033[0m."
else
    echo "Writing emummc.txt and sysmmc.txt in ./atmosphere/hosts\033[32m success\033[0m."
fi

# Write boot.ini in root of SD Card
cat > ./boot.ini << ENDOFFILE
[payload]
file=payload.bin
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing boot.ini in root of SD card\033[31m failed\033[0m."
else
    echo "Writing boot.ini in root of SD card\033[32m success\033[0m."
fi

# Write override_config.ini in /atmosphere/config
cat > ./atmosphere/config/override_config.ini << ENDOFFILE
[hbl_config]
program_id_0=010000000000100D
override_address_space=39_bit
; 按住R键点击相册进入HBL自制软件界面。
override_key_0=R
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing override_config.ini in ./atmosphere/config\033[31m failed\033[0m."
else
    echo "Writing override_config.ini in ./atmosphere/config\033[32m success\033[0m."
fi

# Write system_settings.ini in /atmosphere/config
cat > ./atmosphere/config/system_settings.ini << ENDOFFILE
[eupld]
; 禁用将错误报告上传到任天堂
upload_enabled = u8!0x0

[ro]
; 控制 RO 是否应简化其对 NRO 的验证。
; （注意：这通常不是必需的，可以使用 IPS 补丁。
ease_nro_restriction = u8!0x1

[atmosphere]
; 是否自动开启所有金手指。0=关。1=开。
dmnt_cheats_enabled_by_default = u8!0x0

; 如果你希望大气记住你上次金手指状态，请删除下方；号
; dmnt_always_save_cheat_toggles = u8!0x1

; 如果大气崩溃，10秒后自动重启
; 1秒=1000毫秒，转换16进制
fatal_auto_reboot_interval = u64!0x2710

; 使电源菜单的“重新启动”按钮重新启动到payload
; 设置"normal"正常重启l 设置"rcm"重启RCM，
; power_menu_reboot_function = str!payload

; 启动90DNS与任天堂服务器屏蔽
enable_dns_mitm = u8!0x1
add_defaults_to_dns_hosts = u8!0x1

; 是否将蓝牙配对数据库用与虚拟系统
enable_external_bluetooth_db = u8!0x1

[usb]
; 开启USB3.0，尾数改为0是关闭
usb30_force_enabled = u8!0x1

[tc]
sleep_enabled = u8!0x0
holdable_tskin = u32!0xEA60
tskin_rate_table_console = str!”[[-1000000, 28000, 0, 0], [28000, 42000, 0, 51], [42000, 48000, 51, 102], [48000, 55000, 102, 153], [55000, 60000, 153, 255], [60000, 68000, 255, 255]]”
tskin_rate_table_handheld = str!”[[-1000000, 28000, 0, 0], [28000, 42000, 0, 51], [42000, 48000, 51, 102], [48000, 55000, 102, 153], [55000, 60000, 153, 255], [60000, 68000, 255, 255]]”
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing system_settings.ini in ./atmosphere/config\033[31m failed\033[0m."
else
    echo "Writing system_settings.ini in ./atmosphere/config\033[32m success\033[0m."
fi

# Delete unneeded files
rm -f switch/haze.nro
rm -f switch/reboot_to_payload.nro
rm -f switch/daybreak.nro
rm -f resp.tmp

# -------------------------------------------

echo ""
echo "\033[32mYour Switch SD card is prepared!\033[0m"
