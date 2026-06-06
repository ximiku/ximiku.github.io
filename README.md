# Jiaxi Liu Academic Homepage

This repository contains the source code for Jiaxi Liu's academic homepage:

```text
https://ximiku.github.io
```

The site is based on the Jekyll al-folio theme and has been simplified for a personal academic homepage.

## Local Preview

Install Ruby dependencies:

```bash
bundle install
```

Run the local server:

```bash
bundle exec jekyll serve
```

Then open:

```text
http://127.0.0.1:4000
```

## Maintenance Notes

Detailed editing instructions are kept outside the repository root so they do not dominate the GitHub project landing page:

```text
_maintenance/README.md
```

Common content entry points:

- Homepage content: `_pages/about.md`
- Publications: `_bibliography/papers.bib`
- Materials: `_data/materials.yml`
- Profile links: `_data/profile_links.yml`
- Site configuration: `_config.yml`
- Main custom styles: `_sass/_components.scss`, `_sass/_materials.scss`, `_sass/_publications.scss`

## Deploy

The site is built by GitHub Actions and deployed to GitHub Pages.
