#!/bin/bash

docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/planet-latest.osm.pbf

docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/planet-latest.osm

docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/planet-latest.osm