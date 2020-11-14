#! /usr/bin/awk -f
{
    if (length($0) == 0) {
        next;
    }
    if ($1 != "Plugin") next;
    gsub(/[^\/][^\/]*\/\.\.\/|\.\//, "", $4);
    gsub(/[^\/][^\/]*\/\.\.\/|\.\//, "", $6);
    printf("Plugin %s inputfile %s outputfile %s\n", $2, $4, $6);
}
