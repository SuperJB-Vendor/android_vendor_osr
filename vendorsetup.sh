# Get proprietary files
PATH=$PATH:$PWD/vendor/osr/tools ; export PATH
VENDOR=$PWD/vendor/osr
if [ ! -d  "$VENDOR/proprietary" ]
then
   vendor/osr/./get-prebuilts
else
   echo " Propetarios descargados anteriromente"
fi

