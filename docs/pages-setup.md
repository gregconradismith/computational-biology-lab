---
title: GitHub Pages Setup
permalink: /pages-setup/
---

# GitHub Pages Setup

This repository includes a `docs/` site and a GitHub Actions workflow that publishes it to GitHub Pages.

## Expected Public URL

After the workflow runs successfully, the site should be available at:

```text
https://gregconradismith.github.io/computational-biology-lab/
```

## Repository Settings

In GitHub, open:

```text
Settings -> Pages
```

Set the source to **GitHub Actions**. The workflow in `.github/workflows/pages.yml` builds this `docs/` folder with Jekyll and deploys the resulting static HTML.

## Local Editing

Most edits can be made directly in Markdown files under `docs/`. Keep the site focused on helping students use the repository, and link back to source files on GitHub when the canonical content already exists elsewhere.
