#! /usr/bin/awk -f

BEGIN {
    prefix = "";
}

{
    if (length($0) == 0) {
        next;
    }
    if ($1 == "Prefix" ) {
        prefix = $2;
        next;
    }
    if ($1 != "Plugin") next;
    printf("Plugin %s inputfile %s%s outputfile %s%s\n", $2, prefix, $4, prefix, $6);
}
