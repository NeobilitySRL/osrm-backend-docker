#!/bin/bash

# Check if map URL environment variable is set
if [ -z "${MAP_URL}" ]; then
    echo "MAP_URL environment variable is not set."
    exit 1
fi

# Extract filename from URL
MAP_FILE=$(basename ${MAP_URL})

# Define the base name for the OSRM files
OSRM_BASENAME="/data/${MAP_FILE%.osm.pbf}"

# Download the map file if it doesn't exist
# Run extract, partition, and customize
if [ ! -f "/data/${MAP_FILE}" ]; then
    echo "Downloading map data from ${MAP_URL} to /data/${MAP_FILE} ..."

    mkdir -p /data
    curl -o "/data/${MAP_FILE}" "${MAP_URL}"

    echo "Extracting and preparing the map data ${OSRM_BASENAME}.osrm ..."

    # Extract the map file
    osrm-extract -p /opt/car.lua "/data/${MAP_FILE}"

    # Prepare the routing data
    osrm-partition "${OSRM_BASENAME}.osrm"
    osrm-customize "${OSRM_BASENAME}.osrm"
fi

# Start the OSRM backend
echo "Starting OSRM backend..."
osrm-routed --algorithm mld "${OSRM_BASENAME}.osrm"
