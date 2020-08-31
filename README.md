# Pandoc + Eisvogel

This repo keeps the code to build Docker images for [Pandoc](https://pandoc.org) with the [Eisvogel template](https://github.com/Wandmalfarbe/pandoc-latex-template) included.

The image is based on Pandoc's official Ubuntu LaTeX image, and then adds (even) more packages to meet Eisvogel's dependencies.

On every build, the latest Eisvogel LaTeX template will be included in the image.

## Usage of the resulting image

```console
$ docker run --rm --volume "`pwd`:/data" docker.pkg.github.com/ttps-ruby/pandoc-eisvogel input.md -o output.pdf
```