# Jiaxi Liu Academic Homepage

This repository hosts Jiaxi Liu's academic personal homepage, built with the
[al-folio](https://github.com/alshedivat/al-folio) Jekyll theme and deployed via
GitHub Pages at:

```text
https://ximiku.github.io
```

## Local Preview

```bash
bundle install
bundle exec jekyll serve
```

Then open:

```text
http://127.0.0.1:4000
```

## Main Content Files

- Homepage: `_pages/about.md`
- Site identity: `_config.yml`
- Social links and CV PDF: `_data/socials.yml`
- Web CV data: `_data/cv.yml`
- Publications: `_bibliography/papers.bib`
- News: `_news/`
- Talks and slides: `_data/talks.yml`
- Homepage custom layout: `_layouts/about.liquid`
- Homepage custom styles: `_sass/_jiaxi.scss`

## Add Publications

Edit `_bibliography/papers.bib`. al-folio supports fields such as:

```bibtex
@article{key,
  abbr={NAR},
  title={Paper Title},
  author={Liu, Jiaxi and Collaborators},
  journal={Journal Name},
  year={2026},
  selected={true},
  preview={preview.svg},
  pdf={paper.pdf},
  slides={slides/talk.pdf},
  code={https://github.com/example/project},
  doi={10.0000/example}
}
```

Put publication previews in `assets/img/publication_preview/` and PDFs in
`assets/pdf/`.

## Add Talks

Edit `_data/talks.yml`. Put talk preview images in `assets/img/talks/` and slide
PDFs in `assets/pdf/slides/`.

## Deployment

Push changes to `main`. The `Deploy site` GitHub Action builds the site and
publishes the generated HTML to `gh-pages`.

Repository settings:

- `Settings -> Actions -> General -> Workflow permissions`: `Read and write permissions`
- `Settings -> Pages -> Build and deployment`: `Deploy from a branch`
- Branch: `gh-pages`
- Folder: `/ (root)`
