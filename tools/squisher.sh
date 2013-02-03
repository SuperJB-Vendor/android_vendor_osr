#!/bin/bash
#
# Squish a otapackage for distribution
# Superatmel y Blerfont (Base Cyanogen)
#

#Inicializamos las variables
export VENDOR=vendor/osr
MODS=$VENDOR/mods
OTAPACKAGE=$OUT/$PRODUCT_ROM_FILE-ota.zip
ROMPACKAGE=$OUT/$PRODUCT_ROM_FILE.zip

OPTICHARGER=$ANDROID_BUILD_TOP/$VENDOR/tools/preopticharger.sh
OPTICHARGER_FRAMEWORK=$ANDROID_BUILD_TOP/$VENDOR/tools/opticharger_framework
QUIET=-q
DELETE_BINS="applypatch applypatch_static check_prereq recovery updater"
squash_opts="-force-uid 1000 -force-gid 1000 -no-progress -noappend -no-exports -no-recovery"
REPACK=$OUT/repack.d
REPACKOTA=$REPACK/ota

CORES=$( cat /proc/cpuinfo | grep -c processor )
TOPDIR=`pwd`
VENDOR=vendor/osr
SECURITYDIR=$ANDROID_BUILD_TOP/build/target/product/security

. mensajes.sh

# Verificación de entorno de desarrollo operativo
if [ -z "$OUT" -o ! -d "$OUT" ]; then
	msgErr "$0 solo funciona con un entorno completo de desarrollo. $OUT debe existir."
	exit 1
fi

# Se verifica que existe el fichero inicial.
if [ ! -f "$OTAPACKAGE" ]; then
	msgErr "$OTAPACKAGE no existe!"
	exit 1
fi

# Elimina cualquier directorio de un trabajo antiguo
clear
msgInfo "Limpiando el entorno..."
rm -rf $REPACK
mkdir -p $REPACKOTA
(
cd $REPACKOTA
msgInfo "Copiando ficheros"
cp -rf $OUT/system $REPACKOTA
unzip -nq $OTAPACKAGE -d $REPACKOTA
echo
)

# Copiado de archivos comunes
[ -d $ANDROID_BUILD_TOP/$MODS/common/ ] && cp -rf $ANDROID_BUILD_TOP/$MODS/common/* $REPACKOTA/

#Ejecuta opticharger sobre el resto de apks de la rom
cd $REPACKOTA/system/app
find ./ -name \*.apk | xargs --max-args=1 --max-procs=${CORES} $OPTICHARGER
cd $REPACKOTA/system/framework
$OPTICHARGER framework-res.apk

# Corregir build.prop
sed -i \
  -e '/ro\.kernel\.android\.checkjni/d' \
  -e '/ro\.build\.type/s/eng/user/' \
  -e '/ro\.build\.date\.utc/s/.*/ro.build.date.utc=0/' \
  $REPACKOTA/system/build.prop

# Eliminar binarios innecesarios
cd $REPACKOTA/system/bin
$ECHO $DELETE_BINS | xargs rm -f

# No se necesita recovery (en caso de existir)
rm -rf $REPACKOTA/recovery

# Strip modulos
[ -d $REPACKOTA/system/lib/modules ] && \
	find $REPACKOTA/system/lib/modules -name "*.ko" -print0 | xargs -0 arm-eabi-strip --strip-unneeded

cd $REPACKOTA

if which 7za &>/dev/null
then
	msgStatus "Comprimiendo ROM usando 7za"
	7za a -tzip -mx9 -mmt $REPACK/update.zip .
else
	msgStatus "Comprimiendo ROM usando zip"
	zip $QUIET -ry -9 $REPACK/update.zip . 
fi

firmar.sh $REPACK/update.zip $ROMPACKAGE
if [ "$?" -ne 0 ]; then
	msgErr "Error al obtener el fichero firmado $ROMPACKAGE"
	exit 1
fi

exit 0
