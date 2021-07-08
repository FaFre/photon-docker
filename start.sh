#!/bin/bash

if [ -d "/usr/share/photon_data/elasticsearch" ] 
then
    java -jar ./photon-*.jar -data-dir /usr/share/photon_data/ $PHOTON_RUN_PARAMS
else
    java -jar ./photon-*.jar -nominatim-import -data-dir /usr/share/photon_data/ $PHOTON_INIT_PARAMS
    java -jar ./photon-*.jar -data-dir /usr/share/photon_data/ $PHOTON_RUN_PARAMS
fi