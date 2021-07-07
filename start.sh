#!/bin/bash

if [ -d "./photon_data" ] 
then
    java -jar ./photon-*.jar $PHOTON_RUN_PARAMS
else
    java -jar ./photon-*.jar $PHOTON_INIT_PARAMS
    echo "Photon initialized!"
fi