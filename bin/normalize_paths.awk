#! /usr/bin/awk -f
{
    if (length($0) == 0) {
        next;
    }
    if ($1 != "Plugin") next;
    normalizedInputPath = gsub(/[^\/][^\/]*\/\.\.\//, "", $4);
    normalizedOutputPath = gsub(/[^\/][^\/]*\/\.\.\//, "", $6);
    relativeNormalizedInput = gsub(/\.\//, "", $4);
    relativeNormalizedOutput = gsub(/\.\//, "", $6);
    printf("Plugin %s inputfile %s outputfile %s\n", $2, $4, $6);
}
