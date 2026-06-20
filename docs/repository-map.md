---
title: Repository Map
permalink: /repository-map/
---

# Repository Map

Use this page to choose a folder before diving into files. Most top-level folders are independent teaching areas.

## Core Student Materials

| Folder or file | Purpose |
| --- | --- |
| `README.md` | lab expectations, joining process, authorship notes, repository map |
| `STUDENT_START_HERE.md` | short orientation path for new students |
| `CONTRIBUTING.md` | expectations for student contributors |
| `GIT-HELP.md` | compact reminder of common Git commands |
| `REU-Onboarding/` | arranged notes, assignments, project ideas, tools, and references |
| `docs/` | GitHub Pages source for this student-facing guide |

## Technical Areas

| Folder | What it is for |
| --- | --- |
| `Matlab/` | introductory MATLAB examples, worksheets, modeling scripts, numerical methods, fitting, Markov chains, plotting, and specialized research examples |
| `Latex/` | examples for manuscripts, mathematical writing, and document preparation |
| `TikZ/` | figure and diagram examples for LaTeX workflows |
| `Sagemath/` | SageMath and SageTeX examples |
| `Notebooks/` | notebook-style notes and exploratory research examples |
| `HPC-Sciclone/` | William & Mary SciClone cluster examples and setup notes |
| `JupyterHub/` | JupyterHub-oriented notes |
| `Posters/` | poster examples and historical materials |

## How To Read A Folder

1. Start with the folder-level `README.md`.
2. Look for a file name that signals the main example, such as `example_*.m`.
3. Run the example before editing it.
4. Write down what output you expected and what output you saw.
5. If the folder lacks first-step instructions, consider adding them.

## Links To Source

- [Browse the repository on GitHub]({{ site.repo_url }})
- [Open the MATLAB folder]({{ site.repo_url }}/tree/main/Matlab)
- [Open REU onboarding]({{ site.repo_url }}/tree/main/REU-Onboarding)
- [Open HPC-Sciclone]({{ site.repo_url }}/tree/main/HPC-Sciclone)

## Public/Private Boundary

This public repository should contain runnable examples, public notes, source files, and generated teaching outputs. Keep downloaded third-party PDFs, unpublished research notes, private assignments, and student-specific material in the private companion repository.
