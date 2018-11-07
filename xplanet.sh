#!/bin/bash

# Fichero de salida
OUTPUT="/tmp/xplanet.png"

# Tamaño de la imagen
GEOMETRY=3840x2160

# Lugar desde donde se observa la imagen. Actualmente se ve europa en
# primer plano
LONGITUDE=-3
LATITUDE=20
CENTER='+1920+2160'

# if test -e "$PREFIX$OUTPUT"; then
#    rm "$PREFIX$OUTPUT"
#    OUTPUT="_$OUTPUT"
# else
#    rm "$PREFIX""_$OUTPUT"
# fi

# Comando que genera la imagen
xplanet -num_times 1 -output "$OUTPUT" -geometry $GEOMETRY -longitude $LONGITUDE -latitude $LATITUDE -radius 90 -center $CENTER -fontsize 18

# Cambiar el fondo
gsettings set org.gnome.desktop.background picture-uri file://"$OUTPUT"
# OLD # gconftool-2 -t str -s /desktop/gnome/background/picture_filename "$PREFIX$OUTPUT"
