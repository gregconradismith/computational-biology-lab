---
title: Contributing
permalink: /contributing/
---

# Contributing

Contributions should make examples easier for students to find, run, understand, adapt, or review.

## Good First Contributions

- fix typos or broken links
- add a missing folder-level `README.md`
- clarify what file to run first
- document software requirements
- add expected output for a teaching example
- improve comments that explain modeling or numerical choices

## Before Changing Shared Material

Many folders are shared teaching examples and may be referenced by students, course notes, or onboarding material. Avoid reorganizing, renaming, or deleting examples unless the change has been discussed.

## README Checklist For New Example Folders

Include:

1. what the example teaches
2. required software or packages
3. which file to open or run first
4. what output to expect
5. where to look next

## Public-Safe Contributions

Before adding files, check whether they are appropriate for a public, MIT-licensed teaching repository. Prefer links to official sources for papers, manuals, software documentation, and campus services. Keep private assignments, unpublished results, downloaded article PDFs, credentials, and student-specific material in the private companion repository.

## Git Basics

Check your changes before committing:

```bash
git status --short
git diff --check
```

Stage and commit focused changes:

```bash
git add FILENAME
git commit -m "Add short description of the change"
git push
```

For the full source guide, read [CONTRIBUTING.md]({{ site.repo_url }}/blob/main/CONTRIBUTING.md).
