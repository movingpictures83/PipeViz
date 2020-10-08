#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold]";
  prefix = "";
  previousPlugin = "";
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
  isPreviousPlugin = $2 == previousPlugin;
  pluginLabel = isPreviousPlugin ? pluginId : $2;
  printf("\t\"%s%s\"->\"%s\"->\"%s%s\";\n", prefix, $4, pluginLabel, prefix, $6);
  plugins[isPreviousPlugin ? pluginId++ : $2] = $2;
  previousPlugin = $2;
}

END {
  for (plugin in plugins) {
    printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", plugin, plugins[plugin]);
  }
  print "}";
}
