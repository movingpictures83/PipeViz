#! /usr/bin/awk -f

BEGIN {
    prefix = "";
    lastKitty = "";
}

function fixPrefix(currPrefix) {
    lastChar = substr(currPrefix, length(currPrefix), 1);
    if (lastChar != "/") {
        currPrefix = currPrefix"/";
    }
    return currPrefix;
}

function printFormattedField(field, input, last) {
    if (substr(input, 1, 1) == "/") {
        printf("%s %s%s", field, input, last);
    } else {
        printf("%s %s%s%s%s", field, prefix, lastKitty, input, last);
    }
}

{
    if ($1 == "Prefix") {
        prefix = fixPrefix($2);
    }
    if ($1 == "Kitty") {
        lastKitty = fixPrefix($2);
    }
    if ($1 != "Plugin") next;
    printf("Plugin %s ", $2);
    printFormattedField("inputfile", $4, " ");
    printFormattedField("outputfile", $6, "\n");
}
