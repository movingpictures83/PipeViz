#! /usr/bin/awk -f

BEGIN {
    prefix = "";
    kitty = "";
}

{
    if ($1 == "Prefix") prefix = $2;
    if ($1 == "Kitty") kitty = $2;
    if ($1 != "Plugin") next;
    printf("Plugin %s inputfile %s%s%s outputfile %s%s%s\n", $2, prefix, kitty, $4, prefix, kitty, $6);
}
