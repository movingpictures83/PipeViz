#! /usr/bin/awk -f

BEGIN {
  print "digraph G {\n\tnode [style=bold, shape=box];\n";
}

{
  printf("\t%s\n", $0);
}

END {
  print "}\n";
}
