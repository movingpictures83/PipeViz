#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold]";
  prefix = "";
  previousPlugin = "";
  pluginId = 0;
}

{
  if ($1 == "Plugin") {
    pluginLabel = ($2 == previousPlugin) ? (pluginId) : ($2);
    printf("\t\"%s%s\"->\"%s\"->\"%s%s\";\n", prefix, $4, pluginLabel, prefix, $6);
    if ($2 == previousPlugin) {
      plugins[pluginId++] = $2;
    } else {
      plugins[$2] = $2;
    }
    previousPlugin = $2;
  } else if ($1 == "Prefix") {
    prefix = $2;
  }
}

END {
  for (plugin in plugins) {
    printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", plugin, plugins[plugin]);
  }
  print "}";
}
