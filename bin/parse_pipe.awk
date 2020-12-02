#! /usr/bin/awk -f

BEGIN {
    print "digraph G {\n\tnode [style=bold];";
    pluginId = 0;
    currentPrefix = "";
}

function getFilePath(input) {
    match(input, "^(.+)\/");
    inputpath = substr(input, RSTART, RLENGTH);
    return inputpath;
}

function getFileName(input) {
    match(input, "([^/]+)$");
    inputfilename = substr(input, RSTART, RLENGTH);
    return inputfilename;
}

{
    inputpath = getFilePath($4);
    inputfile = getFileName($4);
    outputpath = getFilePath($6);
    outputfile = getFileName($6);
    thePrefix = "";
    if (currentPrefix != inputpath) {
        where = index(inputpath, currentPrefix);
        if (where == 0 || currentPrefix == "") {
            currentPrefix = inputpath;
            thePrefix = currentPrefix;
        } else {
            start = where + length(currentPrefix);
            thePrefix = substr(inputpath, start, length(inputfile)); 
        }
    }
    printf("\t\"%s\"->\"%s\"", $4, pluginId);
    if (thePrefix != "") {
        printf(" [label = \"\t%s\t\"];\n", thePrefix);
    } else {
        printf(";\n");
    }
    printf("\t\"%s\"->\"%s\";\n", pluginId, $6);
    printf("\t\"%s\" [label = \"%s\"];\n", $4, inputfile);
    printf("\t\"%s\" [label = \"%s\"];\n", $6, outputfile);
    plugins[pluginId++] = $2;
}

END {
    for (i = 0; i < pluginId; ++i) {
        printf("\t\"%s\" [label=\"%s\", shape=box, color=dodgerblue1, fontcolor=white, style=filled];\n", i, plugins[i]);
    }
    print "}";
}
