# PipeViz
Visualize a pipeline using a network

# Environment Setup
To get started run the following command:

```cd bin ; . ./init_bin```

If using ocelot ensure that your current shell is bash with:

```echo $SHELL```

If not change it with:

```bash```

then

```cd bin ; source init_bin```

# Testing
To run tests run the following command within the root of the PipeViz directory:

```run_tests```

The PipeViz bin folder must be exported to the ```PATH``` environment variable.

# Writing Tests
To write a test, simply create a file with the name ```expected.gv``` within one of the testing folders. This file should contain the expected output of executing ```gen_dot```.