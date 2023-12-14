#!/bin/bash

osmium cat romania-latest.osm.pbf new-york-latest.osm.pbf pennsylvania-latest.osm.pbf -o merged.osm.pbf
rm romania-latest.osm.pbf new-york-latest.osm.pbf pennsylvania-latest.osm.pbf
