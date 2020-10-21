#! /usr/bin/awk -f

BEGIN {
    prefix = "";
}

{
    if (length($0) == 0) {
        next;
    }
    if ($1 == "Prefix" ) {
        firstPrefix = match($2, "/")
        prefix = substr($2, firstPrefix + 1, length($2));
        if (length(prefix) > 0) {
            prefix = prefix"/"
        }
        next;
    }
    if ($1 != "Plugin") next;
    printf("Plugin %s inputfile %s%s outputfile %s%s\n", $2, prefix, $4, prefix, $6);
}
