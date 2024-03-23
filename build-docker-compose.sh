#!/bin/sh

git stash

. ./.env

# If enable 978 is set to anything, enable it
if [ -n "${ENABLE_978}" ]; then
	cp docker-compose-978.yml docker-compose.yml
	cp piaware-978.conf piaware.conf
fi

#Put uuid in a file and then we can mount it in docker-compose for use
if [ -n "${ULTRAFEEDER_UUID}" ]; then
	echo "$ULTRAFEEDER_UUID" >uuid
else
	cat /proc/sys/kernel/random/uuid >uuid
fi

# Now we use sed to find/replace the .env variables into the docker commands
sed -i "s/ADSB_SDR_GAIN/$ADSB_SDR_GAIN/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_SERIAL/$ADSB_SDR_SERIAL/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_PPM/$ADSB_SDR_PPM/g" "docker-compose.yml"
sed -i "s/ADSB_SDR_PPM/$ADSB_SDR_PPM/g" "docker-compose.yml"
sed -i "s/FEEDER_LAT/$FEEDER_LAT/g" "docker-compose.yml"
sed -i "s/FEEDER_LONG/$FEEDER_LONG/g" "docker-compose.yml"
sed -i "s/FEEDER_ALT_M/$FEEDER_ALT_M/g" "docker-compose.yml"
sed -i "s/ULTRAFEEDER_UUID/$ULTRAFEEDER_UUID/g" "docker-compose.yml"
sed -i "s/FEEDER_NAME/$FEEDER_NAME/g" "docker-compose.yml"

sed -i "s/PIAWARE_FEEDER_ID/$PIAWARE_FEEDER_ID/g" "piaware.conf"

git stash apply
