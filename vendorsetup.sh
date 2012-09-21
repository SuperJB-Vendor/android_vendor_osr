# Get proprietary files
PATH=$PATH:$PWD/vendor/osr/tools ; export PATH
VENDOR=$PWD/vendor/osr
if [ ! -d  "$VENDOR/proprietary" ]
then
   vendor/osr/./get-prebuilts
else
   echo " Propetarios descargados anteriromente"
fi

# Devices supported
add_lunch_combo osr_galaxysmtd-userdebug
add_lunch_combo osr_i9100-userdebug
add_lunch_combo osr_i9300-userdebug
add_lunch_combo osr_n7000-userdebug
