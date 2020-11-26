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

{
    if ($1 == "Prefix") {
        prefix = $2;
        lastChar = substr($2, length($2), 1);
        if (lastChar != "/") {
            prefix = prefix"/";
        }
    }
    if ($1 == "Kitty") {
        lastChar = substr($2, length($2), 1);
        if (lastChar != "/") {
            $2 = $2"/";
        }
        kittyStack[stackIndex] = $2;
        ++stackIndex;
        lastKitty = $2;
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
    if (substr($4, 1, 1) == "/") {
        printf("inputfile %s ", $4);
    } else {
        printf("inputfile %s%s%s ", prefix, kittyPath, $4);
    }
    if (substr($6, 1, 1) == "/") {
        printf("outputfile %s\n", $6);
    } else {
        printf("outputfile %s%s%s\n", prefix, kittyPath, $6);
    }
}
