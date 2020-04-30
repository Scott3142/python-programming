# About this directory

The vast majority of folders in here are submodules which link back to the main exercise repos.

If you want to clone directories to your local machine, you can use the `get_exercises.sh` script to populate the `exercise-list.dat` with the exercises from the codelabs.

You can use `pull_exercises.sh` and `push_exercises.sh` to pull and push multiple exercise repos from remote. This is not recommended and is mostly set up for my own development environment. If you really want to use these scrips, you should probably adapt them yourself and figure out what they do.

**Be careful** with `delete_exercises.sh`. It is set up to automatically exit without running anything as it stands, but actually deletes remote repos on Github (if you have `hub` installed and have given it appropriate API scopes). You will almost never need this file, so make sure you understand it if you run it.

## Creating a new course

If you would like to create a new course with these exercises (for a new year or different school), you can run the `fork_repos.sh` script. This will run through the `working-exercise.dat` list (by default equal to `exercise-list.dat`) and fork the `den01-python-progrmaming` exercise repos to the organisation (course) specified in the bash prompt after running.

The organisation name needs to be entered as lowercase separated by hyphens. For example, if your organisation is called Den01 Python Programming and lives at https://github.com/den01-python-programming/ then you should enter

```plaintext
den01-python-programming
```

after the prompt

```console
user@host:~/python-progrmaming/exercise-files$ ./fork_repos.sh
Where would you like to fork the exercises? Please specify just the org name without repo name and without http://
```
