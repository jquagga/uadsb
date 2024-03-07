#!/bin/sh

. ./.env

# First lets copy the templates into the config files
cp docker-compose.tmpl docker-compose.yml
cp piaware.tmpl piaware.conf

# Now we use sed to find/replace the .env variables into the docker commands
sed -i "s/ADSB_SDR_GAIN/$ADSB_SDR_GAIN/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_SERIAL/$ADSB_SDR_SERIAL/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_PPM/$ADSB_SDR_PPM/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_PPM/$ADSB_SDR_PPM/g" "docker-compose.yml"
sed -i "s/FEEDER_LAT/$FEEDER_LAT/g" "docker-compose.yml"
sed -i "s/FEEDER_LONG/$FEEDER_LONG/g" "docker-compose.yml"
sed -i "s/FEEDER_ALT_M/$FEEDER_ALT_M/g" "docker-compose.yml"

sed -i "s/PIAWARE_FEEDER_ID/$PIAWARE_FEEDER_ID/g" "piaware.conf"
