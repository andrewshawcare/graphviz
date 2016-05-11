#!/bin/bash
brew install fswatch
fswatch -0 ./graph.gv | xargs -0 -n 1 -I {} docker-compose up
