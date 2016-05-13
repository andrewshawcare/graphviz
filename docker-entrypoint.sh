#!/bin/bash
graph_directory=graphs
output_directory=output
output_extension=png

while read line; do
  graph_filename=$(echo $line | cut -d' ' -f3)
  output_filename=${graph_filename%.*}.$output_extension
  dot \
    -T$output_extension \
    $graph_directory/$graph_filename \
    -o $output_directory/$output_filename
done < <(inotifywait --monitor --recursive --event modify $graph_directory)
