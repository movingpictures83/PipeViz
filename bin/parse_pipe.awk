#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold]";
  prefix = "";
  pluginId = 0;
}

{
  if ($1 == "Prefix") {
    prefix = $2;
    next;
  }
  if (length($0) == 0 || $1 == "Kitty" || $1 == "Pipelines") {
    next;
  }
  printf("\t\"%s%s\"->\"%s\"->\"%s%s\";\n", prefix, $4, pluginId, prefix, $6);
  plugins[pluginId++] = $2;
}

END {
  for (i = 0; i < pluginId; ++i) {
    printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", i, plugins[i]);
  }
  print "}";
}
