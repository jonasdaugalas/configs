#! /bin/sh
mkdir -p out && \
cd out && \
mkdir -p left && \
cd left && \
cmake ../../controller -DScanModule=MDErgo1 \
    -DCHIP=mk20dx256vlh7 \
    '-DBaseMap=defaultMap leftHand slave1 rightHand' \
    -DMacroModule=PartialMap \
    -DOutputModule=pjrcUSB \
    -DDebugModule=full \
    '-DDefaultMap=../../mykeymap/ergo-jonas-0 lcdFuncMap' \
    '-DPartialMaps=../../mykeymap/ergo-jonas-1 lcdFuncMap;../../mykeymap/ergo-jonas-2 lcdFuncMap;../../mykeymap/ergo-jonas-3 lcdFuncMap;../../mykeymap/ergo-jonas-4 lcdFuncMap;../../mykeymap/ergo-jonas-5 lcdFuncMap' \
    -DCONFIGURATOR=1 && \
make -j && \
mkdir -p ../right && \
cd ../right && \
cmake ../../controller -DScanModule=MDErgo1 \
    -DCHIP=mk20dx256vlh7 \
    '-DBaseMap=defaultMap rightHand slave1 leftHand' \
    -DMacroModule=PartialMap \
    -DOutputModule=pjrcUSB \
    -DDebugModule=full \
    '-DDefaultMap=../../mykeymap/ergo-jonas-0 lcdFuncMap' \
    '-DPartialMaps=../../mykeymap/ergo-jonas-1 lcdFuncMap;../../mykeymap/ergo-jonas-2 lcdFuncMap;../../mykeymap/ergo-jonas-3 lcdFuncMap;../../mykeymap/ergo-jonas-4 lcdFuncMap;../../mykeymap/ergo-jonas-5 lcdFuncMap' \
    -DCONFIGURATOR=1 && \
make -j
