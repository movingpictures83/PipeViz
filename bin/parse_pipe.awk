#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold, shape=box];";
  prefix = "";
}

{
  if ($1 == "Plugin") {
    printf("\t\"%s%s\"->\"%s\"->\"%s%s\";\n", prefix, $4, $2, prefix, $6);
  } else if ($1 == "Prefix") {
    prefix = $2
  }
}

END {
  print "}";
}
