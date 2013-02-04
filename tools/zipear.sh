#!/bin/bash
# Copyright (C) 2013 The SuperTeam Development Group.
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
ROMPACKAGE=$OUT/$PRODUCT_ROM_FILE.zip
REPACK=$OUT/repack.d
REPACKOTA=$REPACK/ota

. mensajes.sh

# Se verifica que existe el directorio de trabajo.
if [ ! -d "$REPACKOTA" ]; then
	msgErr "$REPACKOTA no existe!"
	exit 1
fi

cd $REPACKOTA

if which 7za &>/dev/null
then
	msgStatus "Comprimiendo ROM usando 7za"
	7za a -tzip -mx9 -mmt $REPACK/update.zip .
else
	msgStatus "Comprimiendo ROM usando zip"
	zip -rqy -9 $REPACK/update.zip . 
fi

firmar.sh $REPACK/update.zip $ROMPACKAGE
if [ "$?" -ne 0 ]; then
	msgErr "Error al obtener el fichero firmado $ROMPACKAGE"
	exit 1
fi

exit 0
