# Material template

This repository contains both the source code of this course's webpage and the source for the content of the course. The codelabs are located in the `site/codelabs` folder and everything else is for the website. The exercise files link via submodules in the `exercise_files` directory.

## Contributing to the content

If you spot a mistake, feel free to open an issue in this repo.

If you'd help us making the correction, you can open a pull request with your proposed changes. You may find these resources helpful for doing this:

* [About pull requests](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests)
* [Markdown tutorial](https://commonmark.org/help/tutorial/)
* [Markdown specification](https://spec.commonmark.org/current/)

## Development environment

The instructions for serving the landing page and the codelabs themselves are in the `README.md` file in the `site` directory. 

Prerequisites:
- `node` and `npm`
- `gulp`

The best way to install `node` is via `nvm`. Detailed instructions are [here](https://itnext.io/nvm-the-easiest-way-to-switch-node-js-environments-on-your-machine-in-a-flash-17babb7d5f1b) but if you know what you're doing, it boils down to running 

```bash
curl -o- 
https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

and updating the PATH. Once you have `node` (and hence `npm`) installed, you can run the following commands to install `gulp`:

```bash
npm install
npm install --global gulp-cli
npm install --save-dev gulp
```

The codelabs can be deployed from the `site` directory using the commands:

```bash
./claat_export.sh -o local # deploys codelabs only locally on http://localhost:9090
./claat_export.sh -o landing # deploys codelabs and landing page locally on http://localhost:8000
./claat_export.sh -o deploy # deploys to Github pages
```

**NB: Be sure to read the deployment instructions in the `site` directory before running these commands.** 

## Authors

Material template created by [Henrik Nygren](https://github.com/nygrenh) and [Antti Leinonen](https://github.com/Redande). 
Python adaptations by [Scott Morgan](https://github.com/Scott3142).
