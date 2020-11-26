#! /usr/bin/awk -f
{
    if (length($0) == 0) {
        next;
    }
    if ($1 != "Plugin") next;
    while (sub(/[^\/][^\/]*\/\.\.\/|\.\//, "", $4) != 0);
    while (sub(/[^\/][^\/]*\/\.\.\/|\.\//, "", $6) != 0);
    printf("Plugin %s inputfile %s outputfile %s\n", $2, $4, $6);
}
