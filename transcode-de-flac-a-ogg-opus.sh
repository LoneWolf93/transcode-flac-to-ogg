#!/bin/bash

# Cambiamos al directorio donde se guardan las canciones

cd "1997 - Come To Daddy"

# Iteramos el directorio para mostrar cada fichero

for file in *;

do

# La condicion es mientras sea un fichero y no se llame cover.* sera TRUE

if [ -f "$file" ] && [ "$file" != "cover."* ];

then

# Sacamos el nombre de la cancion sin la extension

cancion_output=$(echo "$file" | cut -d "." -f 1)

# Ejecutamos el comando ffmpeg y transcodeamos a opus quitando el video para dejar solo el audio y le añadimos la extension .ogg

ffmpeg -i "$file" -c:a libopus -map 0:a "$cancion_output.ogg"

fi

done