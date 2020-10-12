# PipeViz
Visualize a pipeline using a network.

# Usage
To create a ```.dot``` file, use the command ```viz_pipe configfilename```

To generate a ```.png``` use ```viz_pipe configfilename png```

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

Testing ```viz_pipe``` manually?

Protip: Use ```clean_output``` to remove all generated output.

# Writing Tests
To write a test, simply create a file with the name ```expected.dot``` within one of the testing folders. This file should contain the expected output of executing ```viz_pipe```.

Need to update an existing test?

While in one of the testing directories, run the command ```update_test```.

# Contributing
Once you are ready to commit your code, use the command:

```git checkout -b yourname/yourfeature```

Then add and commit your changes with:

```git add .```

```git commit -m 'Your commit message'```

Finally push your changes to your branch with:

```git push -u origin yourname/yourfeature```

If you make any additional changes to your branch, you only need to add, commit, and push your changes. Do not create another branch.

Then create a pull request and request a review from any of the contributors.
