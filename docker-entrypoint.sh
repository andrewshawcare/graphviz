#!/bin/sh
graph_directory="$(realpath ./graphs)"
output_directory="$(realpath ./output)"
output_extension='png'

list_available_fonts() {
  fc-list | \
  cut -d':' -f1 | \
  xargs -I'{font_path}' basename '{font_path}' | \
  cut -d'.' -f1 | \
  sort
}

cat <<HEREDOC

Graphviz - Graph Visualization Software
Envisioning connections

Any graph files present in $graph_directory will be rendered on modification to
$output_directory in the '$output_extension' format.

Available fonts:

$(list_available_fonts)

HEREDOC

while line=$(inotifywait --recursive --event modify $graph_directory); do
  echo $line

  graph_filename=$(echo $line | cut -d' ' -f3)
  graph_path="$graph_directory/$graph_filename"
  output_filename=${graph_filename%.*}.$output_extension
  output_path="$output_directory/$output_filename"

  dot -T$output_extension -o$output_path $graph_path
done
