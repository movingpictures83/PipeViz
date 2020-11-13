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
    if ($1 == "Prefix") prefix = $2;
    if ($1 == "Kitty") {
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
    printf("Plugin %s inputfile %s%s%s outputfile %s%s%s\n", $2, prefix, kittyPath, $4, prefix, kittyPath, $6);
}
