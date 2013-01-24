#!/bin/bash

# Copyright (C) 2012 SuperTeam Development Group.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#Inicializamos las variables
SCRIPTDIR=`dirname $0`
TOPDIR=`pwd`
BASEDIR=$1
OSR_VERSION=$2
TARGET_DEVICE=$3
CONFIG_FILE=$BASEDIR/META-INF/com/google/android/aroma-config

. $SCRIPTDIR/mensajes.sh

if [ $# -lt 3 ]
then
	msgErr "Usage: $0 <directory> <version> <device>"
	exit 1
fi

rm $CONFIG_FILE

echo "﻿### LICENSE:" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "# Copyright (C) 2011 Ahmad Amarullah ( http://amarullz.com/ )" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "# Licensed under the Apache License, Version 2.0 (the \"License\");" >> $CONFIG_FILE
echo "# you may not use this file except in compliance with the License." >> $CONFIG_FILE
echo "# You may obtain a copy of the License at" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "#      http://www.apache.org/licenses/LICENSE-2.0" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "# Unless required by applicable law or agreed to in writing, software" >> $CONFIG_FILE
echo "# distributed under the License is distributed on an \"AS IS\" BASIS," >> $CONFIG_FILE
echo "# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied." >> $CONFIG_FILE
echo "# See the License for the specific language governing permissions and" >> $CONFIG_FILE
echo "# limitations under the License." >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "### FILE INFO:" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "# AROMA Installer 2.51 - AROMA Installer Test Script Configuration" >> $CONFIG_FILE
echo "#       (c) 2011-2012 by Ahmad Amarullah" >> $CONFIG_FILE
echo "#           amarullz - xda-developers" >> $CONFIG_FILE
echo "#           http://www.amarullz.com/" >> $CONFIG_FILE
echo "#" >> $CONFIG_FILE
echo "#       Binary Version  : 2.56" >> $CONFIG_FILE
echo "#       Binary Codename : Edelweis" >> $CONFIG_FILE
echo "##" >> $CONFIG_FILE
echo "# Initializing Rom Information" >> $CONFIG_FILE
echo "ini_set(\"rom_name\",             \"SuperOSR\");" >> $CONFIG_FILE
echo "ini_set(\"rom_version\",          \""$OSR_VERSION"\");" >> $CONFIG_FILE
echo "ini_set(\"rom_author\",           \"SuperTe@m\");" >> $CONFIG_FILE
echo "ini_set(\"rom_device\",           \""$TARGET_DEVICE"\");" >> $CONFIG_FILE
echo "ini_set(\"rom_date\",             \"01 Nov, 2012\");" >> $CONFIG_FILE
echo "## Show Simple Splash" >> $CONFIG_FILE
echo "splash(2000, \"superosr\");" >> $CONFIG_FILE
echo "fontresload( \"0\", \"ttf/Roboto-Regular.ttf;ttf/DroidSansArabic.ttf;ttf/DroidSansFallback.ttf;\", \"12\" );" >> $CONFIG_FILE
echo "## SHOW LANGUAGE SELECTION" >> $CONFIG_FILE
echo "selectbox(\"Select Language\", \"Please select installer language.\", \"@default\", \"lang.prop\"," >> $CONFIG_FILE
echo "    \"English\",            \"Welcome to Installer\",                                        1,      #-- selected.0 = 1" >> $CONFIG_FILE
echo "    \"Indonesian\",         \"Selamat datang di Installer\",                                 0,      #-- selected.0 = 2" >> $CONFIG_FILE
echo "    \"Espanol\",            \"Bienvenido al Instalador\",                                    0,      #-- selected.0 = 3" >> $CONFIG_FILE
echo "    \"Simplified Chinesse\",\"欢迎到安装\",                                                    0,      #-- selected.0 = 4" >> $CONFIG_FILE
echo "    \"Arabic\",             \"مرحبا بكم في المثبت\",                                               0,      #-- selected.0 = 5        " >> $CONFIG_FILE
echo "    \"French\",             \"Bienvenue dans l'installateur\",                               0,      #-- selected.0 = 6" >> $CONFIG_FILE
echo "    \"Russian\",            \"Добро пожаловать в установщик\",                               0,      #-- selected.0 = 7" >> $CONFIG_FILE
echo "	\"Italian\",            \"Benvenuti Installer\",                                         0,      #-- selected.0 = 8" >> $CONFIG_FILE
echo "	\"Hebrew\",             \"ברוכים הבאים להתקנה\",										     0,		 #-- selected.0 = 9" >> $CONFIG_FILE
echo "	\"Germany\",            \"Willkommen bei Installer\",									 0 		 #-- selected.0 = 10" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"1\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/en.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" ); #-- \"0\" = Small Font ( Look at Fonts & UNICODE Demo Below )" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" ); #-- \"1\" = Big Font" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"2\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/id.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"3\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/es.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"4\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/cn.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/DroidSansFallback.ttf;ttf/Roboto-Regular.ttf\", \"12\" ); #-- Use sets of font (Font Family)" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/DroidSansFallback.ttf;ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"5\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/ar.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/DroidSansArabic.ttf;ttf/Roboto-Regular.ttf\", \"12\" ); #-- Use sets of font (Font Family)" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/DroidSansArabic.ttf;ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"6\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/fr.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"7\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/ru.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"8\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/it.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"9\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/he.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "if prop(\"lang.prop\",\"selected.0\")==\"10\" then" >> $CONFIG_FILE
echo "  loadlang(\"langs/de.lang\");" >> $CONFIG_FILE
echo "  fontresload( \"0\", \"ttf/Roboto-Regular.ttf\", \"12\" );" >> $CONFIG_FILE
echo "  fontresload( \"1\", \"ttf/Roboto-Regular.ttf\", \"18\" );" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
echo "##SHOW ROM INFORMATION" >> $CONFIG_FILE
echo "viewbox(" >> $CONFIG_FILE
echo "    \"<~welcome.title>\"," >> $CONFIG_FILE
echo "    \"<~welcome.text1> <b>\"+" >> $CONFIG_FILE
echo "	  ini_get(\"rom_name\")+" >> $CONFIG_FILE
echo "	\"</b> <~common.for> <b>\"+ini_get(\"rom_device\")+\"</b>.\n\n\"+" >> $CONFIG_FILE
echo "    \"<~welcome.text2>\n\n\"+" >> $CONFIG_FILE
echo "      \"  <~welcome.version>\t: <b><#selectbg_g>\"+ini_get(\"rom_version\")+\"</#></b>\n\"+" >> $CONFIG_FILE
echo "      \"  <~welcome.codename>\t: <b><#selectbg_g>JellyBean</#></b>\n\"+" >> $CONFIG_FILE
echo "      \"  <~welcome.updated>\t: <b><#selectbg_g>\"+ini_get(\"rom_date\")+\"</#></b>\n\n\n\"+" >> $CONFIG_FILE
echo "    \"<~welcome.next>\"," >> $CONFIG_FILE
echo "    \"@welcome\"" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "##LICENSE" >> $CONFIG_FILE
echo "agreebox(" >> $CONFIG_FILE
echo "    \"<~terms.title>\"," >> $CONFIG_FILE
echo "    \"<~terms.desc>\"," >> $CONFIG_FILE
echo "    \"@license\"," >> $CONFIG_FILE
echo "    resread(\"license.txt\")," >> $CONFIG_FILE
echo "    \"<~terms.check>\"," >> $CONFIG_FILE
echo "    \"<~terms.confirm>\"" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "##MAKE SURE USER KNOW THAT NEXT STEP WAS INSTALLATION PROCESS" >> $CONFIG_FILE
echo "viewbox(" >> $CONFIG_FILE
echo "    \"Ready to Install\"," >> $CONFIG_FILE
echo "    \"The wizard is ready to begin installation.\n\n\"+" >> $CONFIG_FILE
echo "	\"Press <b>Install Now</b> to begin the installation.\n\n\"+" >> $CONFIG_FILE
echo "	\"If you want to review or change any of your installation settings, press <b>Back</b>. Press Menu Key -> Quit Installation to exit the wizard.\"," >> $CONFIG_FILE
echo "    \"@install\"" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "ini_set(\"text_next\", \"Next >\");" >> $CONFIG_FILE
echo "restotmp(\"exec_demo/sleep\",\"sleep\");" >> $CONFIG_FILE
echo "##INSTALLATION PROCESS" >> $CONFIG_FILE
echo "setvar(\"retstatus\"," >> $CONFIG_FILE
echo "  install(" >> $CONFIG_FILE
echo "      \"Installing\"," >> $CONFIG_FILE
echo "	  \"<b>\"+ini_get(\"rom_name\")+\"</b> are being installed.\n\n\"+" >> $CONFIG_FILE
echo "      \"Please wait while installation wizard installs <b>\"+ini_get(\"rom_name\")+" >> $CONFIG_FILE
echo "	  \"</b>. This may take several minutes.\"," >> $CONFIG_FILE
echo "      \"@install\"," >> $CONFIG_FILE
echo "      \"The installation wizard has successfully installed <b>\"+ini_get(\"rom_name\")+" >> $CONFIG_FILE
echo "	  \"</b>. Press Next to continue.\"" >> $CONFIG_FILE
echo "  )" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "" >> $CONFIG_FILE
echo "ini_set(\"text_next\", \"Finish\");" >> $CONFIG_FILE
echo "" >> $CONFIG_FILE
echo "##FINISH MESSAGE, Add Checkbox to Reboot or No. Save in \"reboot_it\" variable" >> $CONFIG_FILE
echo "checkviewbox(" >> $CONFIG_FILE
echo "    \"Installation Completed\"," >> $CONFIG_FILE
echo "    \"<#selectbg_g><b>Congratulation...</b></#>\n\n\"+" >> $CONFIG_FILE
echo "    \"<b>\"+ini_get(\"rom_name\")+\"</b> has been installed into your device.\n\n\"+" >> $CONFIG_FILE
echo "    \"Installer Status: \"+getvar(\"retstatus\")+\"\n\n\"," >> $CONFIG_FILE
echo "    \"@welcome\"," >> $CONFIG_FILE
echo "    \"Reboot your device now.\"," >> $CONFIG_FILE
echo "    \"1\"," >> $CONFIG_FILE
echo "    \"reboot_it\"" >> $CONFIG_FILE
echo ");" >> $CONFIG_FILE
echo "if" >> $CONFIG_FILE
echo "  getvar(\"reboot_it\")==\"1\"" >> $CONFIG_FILE
echo "then" >> $CONFIG_FILE
echo "  reboot(\"onfinish\");" >> $CONFIG_FILE
echo "endif;" >> $CONFIG_FILE
