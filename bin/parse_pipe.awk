#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold];";
  pluginId = 0;
}

/Plugin/ {
  inputFirstPath = match($4, "/")
  inputFile = substr($4, inputFirstPath + 1, length($4));
  outputFirstPath = match($6, "/")
  outputFile = substr($6, outputFirstPath + 1, length($6));
  printf("\t\"%s\"->\"%s\"->\"%s\";\n", inputFile, pluginId, outputFile);
  plugins[pluginId++] = $2;
}

END {
  for (i = 0; i < pluginId; ++i) {
    printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", i, plugins[i]);
  }
  print "}";
}
