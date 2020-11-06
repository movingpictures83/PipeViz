#! /usr/bin/awk -f

BEGIN {
    prefix = "";
    kitty = "";
}

{
    if (length($0) == 0) {
        next;
    }
    if ($1 == "Prefix") {
        prefix = $2;
        next;
    }
    if ($1 == "Kitty") {
        kitty = $2;
        next;
    }
    if ($1 != "Plugin") next;
    printf("Plugin %s inputfile %s%s%s outputfile %s%s%s\n", $2, prefix, kitty, $4, prefix, kitty, $6);
}
