FROM ghcr.io/project-osrm/osrm-backend

ARG MAP_URL

ADD ${MAP_URL} /data/map.osm.pbf

RUN osrm-extract -p /opt/car.lua /data/map.osm.pbf

RUN osrm-partition /data/map.osm

RUN osrm-customize /data/map.osm

RUN rm /data/map.osm.pbf

ENTRYPOINT [ "osrm-routed", "--algorithm", "mld", "/data/map.osm" ]
