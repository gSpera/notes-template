# Note Template
This is a template for creating beatiful html notes for you markdowns file.

## Get started
Clone the repository, the default location may be `~/.config/notes` but you can change in `Makefile`.
Then you can copy/link this Makefile in the folder of your markdown files. Run `make` and
in the `html`(configurable) folder you will have your HTML files.

## Configuration
You can change some configuration in the `Makefile`(experiment, you can do this).

You can surely change the output directory with `OUTDIR`(the first line), `DATADIR` changes the location of the downloaded repo,
`MD` is the list of markdown files, the default is `ls *.md`, ou can change to list a custom directory or a hardcoded list, whatever you want,
`STATIC_FILES` if you need some more file.

Then you can change the `Makefile` for anything.

## Dependencies
You need [mad](https://github.com/gSpera/mad), a Markdown preprocessor, [cmark](https://github.com/stedolan/jq) by default(don't ask me why), [jq](https://github.com/stedolan/jq), and binutils(echo, cat and something like this)
