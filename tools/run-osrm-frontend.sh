#!/bin/bash

docker run -p 9966:9966 -e OSRM_BACKEND='http://127.0.0.1:5000' osrm/osrm-frontend
