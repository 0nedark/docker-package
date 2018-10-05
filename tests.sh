#!/usr/bin/env bash

input=$1
arr=(${input//:/ })
URI=$2
CLASS=$3
LINE=$4

if [ ${arr[1]} = "unit" ]; then
	if [ "" != "${URI}" ]; then
		vendor/bin/phpspec run spec/${URI} -f pretty -v
	elif [ "" != "${CLASS}" ] && [ "" != "${LINE}" ]; then
		vendor/bin/phpspec run spec/${CLASS}Spec.php:${LINE} -f pretty -v
	elif [ "" != "${CLASS}" ]; then
		vendor/bin/phpspec run spec/${CLASS}Spec.php -f pretty -v
	else
		vendor/bin/phpspec run -f pretty -v
	fi
elif [ ${arr[1]} = "create" ]; then
	if [ ${arr[2]} = "unit" ]; then
		vendor/bin/phpspec desc MVF/$(/app/scripts/helpers/namespace.php)/${CLASS}
	fi
elif [ ${arr[1]} = "destroy" ]; then
	if [ ${arr[2]} = "unit" ]; then
		rm spec/${CLASS}Spec.php
		rm src/${CLASS}.php
	fi
fi
