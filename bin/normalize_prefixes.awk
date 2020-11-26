#! /usr/bin/awk -f

BEGIN {
    prefix = "";
    lastKitty = "";
    stackIndex = 0;
    pipelinesCount = 0;
}

function buildKittyPath(stack, stackSize) {
    path = "";
    for (i = 0; i < stackSize; ++i) {
        path = path""stack[i];
    }
    return path;
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
        printf("%s %s%s%s%s", field, prefix, kittyPath, input, last);
    }
}

{
    if ($1 == "Prefix") {
        prefix = fixPrefix($2);
    }
    if ($1 == "Kitty") {
        lastKitty = fixPrefix($2);
        kittyStack[stackIndex] = lastKitty;
        ++stackIndex;
    }
    if ($1 == "#") {
        if ($2 == "StartOfPipeline") {
            ++pipelinesCount;
        } else if($2 == "EndOfPipeline") {
            --pipelinesCount;
            --stackIndex;
        }
    }
    if ($1 != "Plugin") next;
    kittyPath = (pipelinesCount > 0) ? buildKittyPath(kittyStack, stackIndex) : (lastKitty);
    printf("Plugin %s ", $2);
    printFormattedField("inputfile", $4, " ");
    printFormattedField("outputfile", $6, "\n");
}
