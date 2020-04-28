# Codelabs Site

A site for hosting codelabs content.

## Prerequisites

The project requires the following major dependencies:

- [Go](https://golang.org/dl/) language
- [Node.js](https://nodejs.org/en/download/) v10+ and [npm](https://www.npmjs.com/get-npm)
- [gsutil](https://cloud.google.com/storage/docs/gsutil_install)
- [claat](https://github.com/googlecodelabs/tools/tree/master/claat#install)

With Node installed, run `npm install` in the root of the `site` (this folder):

```text
$ npm install
```

(Optional) npm installs binstubs at `./node_modules/.bin/`. When running tasks
like `gulp`, you may want to add `./node_modules/.bin/` to your `$PATH` for convenience:

```text
$ export PATH="./node_modules/.bin/:$PATH"
```

This does pose a mild security risk, so please do so at your own risk.


## Development

### Serve

To serve the site in dev mode, run `gulp serve`, passing a path to a directory
with the codelabs content as an argument. This will compile all the views and
codelabs into the `build/` directory and start a web server to serve that
content.

```text
$ gulp serve
```

The output will include the address where the server is running
(http://localhost:8000 by default).

You can also serve the completely compiled and minified (prod) version with the
`serve:dist` command. Always run this before publishing, as it will show you an
replica of what will appear on staging/production.

```text
$ gulp serve:dist
```

### Views

Views are themed/styled collections of codelabs, served from the same url.
Codelab tags are used for selecting codelabs into views. View definitions are
stored in `/app/views` directory. Views commonly correspond to events (e.g. Conference
2018) or abstract themes (e.g. Python), but they are referred to generically as
"views" internally.

#### Add a new view

To add a new view (e.g. to serve codelabs for a particular event):

1. Create a new folder in `app/views`, which will be the "view id". As the view
id will appear in the URL, the name should be sluggified, meaning all lowercase
with special characters replaced with dashes.

    ```text
    // General example
    My Codelab -> my-codelab

    // Always substitute file extensions, otherwise the browser will get confused
    Learn underscore.js -> learn-underscore-js

    // Keep other URL-friendly characters when the context warrants
    Tracking with utm_source -> tracking-with-utm_source
    ```

1. Add a new file named `view.json` inside this folder. Here is a template
`view.json`:

    ```javascript
    // app/views/my-event/view.json
    {
      // Required: page and view title.
      "title": "My Event",

      // Required: Text description of the event. This will appear in the view
      // landing page.
      "description": "",

      // Required: list of string tags by which to include codelabs. Tags are
      // specified in the codelab by the codelab author.
      "tags": [],

      // Optional: list of string categories by which to include codelabs.
      // Categories are specified in the codelab by the codelab author.
      "categories": [],

      // Optional: name of a custom stylesheet to include. See also: point below
      // about custom styles.
      "customStyle": "style.css",

      // Optional: list of regular expressions to exclude particular codelabs.
      "exclude": [],

      // Optional: URL to a custom logo for the codelab. If provided, this logo
      // must be placed in app/views/<view-id>/ and referenced as such. For
      // example, if the event was named "my-event", this logo would exist at
      // app/views/my-event/my-event-logo.svg.
      //
      // Where possible, please use SVG logos. When SVG logos are not available,
      // please size images to be 125px high at 72 DPI.
      //
      // Minify images before uploading using a tool like ImageOptim.
      "logoUrl": "/my-event/my-event-logo.svg",

      // Optional: category level to use for iconography
      "catLevel": 0,

      // Optional: Method for sorting codelabs.
      "sort": "mainCategory",

      // Optional: List of codelab IDs that should be "pinned" at the start.
      // This is useful for "getting started" codelabs or when users should
      // complete codelabs in a specific order.
      "pins": [],

      // Optional: custom google analytics tracking code. By default, all
      // codelab views are tracked on the main codelab analytics.
      "ga": "",

      // Optional: If true, do not include this view in the list of views on
      // the home page. It will still be accessible via the direct URL.
      "hidden": false,
    }
    ```

1. (Optional) Add a file named `style.css` inside the view folder. If provided,
this file will be included in the HTML, allowing for custom styles.

    This file is not included in the main assets bundle, so there will be a
    performance decrease as the browser needs to load additional styles.
    Furthermore, if the codelab schema were to change, your custom styles may be
    broken. Please check with the codelabs team to see if your style changes
    make more sense to upstream across all views.

1. (Optional) Add a file named `index.html` inside the view folder. This allows
you to fully customize the view, but comes at the expense of duplication. Please
use this sparingly and check with the core team before making drastic changes.

1. Execute the `serve` command as described above to see the view.

#### Build and serve a single view (deprecated)

The build is very fast, so you should not need to filter by a specific view.
Instead, build all views and then visit the appropriate URL. If you still wish
to build a single set of views, you can do so with the `--views-filter`
parameter:

```text
$ gulp serve --views-filer='^event-*'
```

Note this filter takes a regular expression. By default, all views are built.


## Deployment 

The instructions here detail the process for deployment to Github pages, but since static HTML/CSS/JS FILES are created, it can be deployed to a hosting service of your choice. 

Prerequisites for a Github pages deployment:

- a `gh-pages` branch of the repo you are deploying to
- `node` and `gulp` installed (see instructions in parent folder)

There are two files in which the `baseUrl` for the site is set (currently set to https://scott3142.uk). You will want to change these. The files are:

- `gulpfile.js`
- `app/scripts/app.js` 

It's unfortunate that it this also has to be done in the scripts file but a workaround is in the TODOs. If you think you have a fix for this, please submit a PR following [the usual guidelines](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests). 

I have edited some core codelabs files to make the landing page links redirect to `{{baseUrl}}/python-programming`. The file that has been changed is

- `app/elements/codelab-elements/codelabs-elements.js`

You have three options:

- Be happy that your landing page lives at `{{baseUrl}}/python-programming`
- Remove the references to `python-programming` in `app/elements/codelab-elements/codelabs-elements.js`
- Remove the find/replace lines in `claat_export.sh` which change the script links in each `index.html` from `https://storage.googleapis.com/codelab-elements/codelabs-elements.js` to `../../elements/codelab-elements/codelab-elements.js`

Finally:

- Fix the repo name in the last few lines of `gulpfile.js`
- Run `gulp deploy:prod`

You may see a cryptic error about the `.publish` directory. I think this is due to a bug in gulp-gh-pages. There is a clunky workaround:

- Checkout `gh-pages` locally 
- Copy `.git` folder outside repo
- Checkout `master`
- Move copied `gh-pages` git repo to `.publish` 

A better workaround is in the TODOs. If you think you have a fix for this, please submit a PR following [the usual guidelines](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests). 

*NB:* The command `gulp deploy:build` is broken at the moment. You should always use `gulp deploy:prod` until this is fixed. 

The codelabs can be deployed using the commands:

```bash
./claat_export.sh -o local # deploys codelabs only locally on http://localhost:9090
./claat_export.sh -o landing # deploys codelabs and landing page locally on http://localhost:8000
./claat_export.sh -o deploy # deploys to Github pages
```

**NB: Be sure to check out these files and understand what they do before running these commands.**

## Help

For help documentation/usage of the Gulp tasks, run:

```text
$ gulp -T
```

If gulp startup times are really slow, try removing `node_modules/` or running

```text
$ npm dedupe
```

The codelabs and landing page are adapted from Google's tools available [here](https://github.com/googlecodelabs/tools). 
