## Dynamic Images

To build the Docker image, use the following command:

```docker build -t neobility/osrm-backend-docker dynamic```

To run the Docker image, use the following command:

```docker run -e MAP_URL=https://download.geofabrik.de/europe/romania-latest.osm.pbf -v "./data:/data" neobility/osrm-backend-docker:latest```

## Prebuilt Images

To build a prebuilt image, use the following command:

```docker build --build-arg MAP_URL=https://download.geofabrik.de/europe/romania-latest.osm.pbf -t neobility/osrm-backend-docker:romania prebuilt```

To run the prebuilt image, use the following command:

```docker run neobility/osrm-backend-docker:romania```
