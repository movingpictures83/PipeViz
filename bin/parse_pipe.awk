#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold];";
  pluginId = 0;
}

/Plugin/ {
  gsub(/.*[0-9]{2}[_,A-Z,a-z]*\//, "", $4);
  gsub(/.*[0-9]{2}[_,A-Z,a-z]*\//, "", $6);
  printf("\t\"%s\"->\"%s\"->\"%s\";\n", $4, pluginId, $6);
  plugins[pluginId++] = $2;
}

END {
  for (i = 0; i < pluginId; ++i) {
    printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", i, plugins[i]);
  }
  print "}";
}
