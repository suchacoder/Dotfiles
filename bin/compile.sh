#!/bin/bash

/opt/gtkradiant/q3map2 -fs_basepath "/home/curiousx/.q3a/q3ut4/" -fs_game "q3ut4" -game "urt" -meta -patchmeta -v "ut4_zombie.map" &&
/opt/gtkradiant/q3map2 -fs_basepath "/home/curiousx/.q3a/q3ut4/" -fs_game "q3ut4" -game "urt" -vis -hint -merge -v "ut4_zombie.bsp" &&
/opt/gtkradiant/q3map2 -fs_basepath "/home/curiousx/.q3a/q3ut4/" -fs_game "q3ut4" -game "urt" -light -patchshadows -shade -v -bounce 99 -samples 8 -radbump "ut4_zombie.bsp" ; exit
