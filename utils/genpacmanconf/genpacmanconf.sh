#!//bin/bash

sed 's?DIR?'`pwd`'?' utils/genpacmanconf/pacman.conf > live/pacman.conf

sed 's?DIR?sabbath/?g' utils/genpacmanconf/pacman.conf > live/airootfs/etc/pacman.conf
