---
title: Student Guide
description: A student-facing guide to the Computational Biology Lab teaching repository.
---

<section class="hero">
  <div>
    <p class="eyebrow">William & Mary</p>
    <h1>Computational Biology Lab repository guide</h1>
    <p class="lead">
      This site helps new students find the right entry point, run examples carefully,
      keep useful research notes, and contribute improvements to the teaching repository.
    </p>
    <div class="button-row">
      <a class="button" href="{{ '/getting-started/' | relative_url }}">Start here</a>
      <a class="button secondary" href="{{ '/repository-map/' | relative_url }}">Browse the map</a>
    </div>
  </div>
</section>

<figure class="banner">
  <img src="{{ '/assets/lab-research-banner.png' | relative_url }}" alt="Computational biology desk with code, plots, equations, and research notes">
</figure>

## First Path

1. Read the lab expectations in the repository `README.md`.
2. Read the short student orientation in `STUDENT_START_HERE.md`.
3. Choose one technical area that matches your assignment.
4. Read the local `README.md` before running or editing files.
5. Record commands, parameters, plots, and open questions in your lab notebook.

<div class="grid">
  <div class="card">
    <h3>New to the lab</h3>
    <p>Start with expectations, notebook habits, and the short repository orientation.</p>
  </div>
  <div class="card">
    <h3>Learning a tool</h3>
    <p>Use the folder-level READMEs to find first examples and suggested next steps.</p>
  </div>
  <div class="card">
    <h3>Improving the repository</h3>
    <p>Make small teaching-focused changes that help the next student understand the path.</p>
  </div>
</div>

## Quick Entry Points

| Goal | Start with | What to record |
| --- | --- | --- |
| Run a first MATLAB model | `Matlab/README.md` | script name, parameters changed, plot or numerical output |
| Prepare mathematical writing | `Latex/README.md` | source file, compile command, packages used |
| Make a figure for a paper or poster | `TikZ/README.md` | source file, generated PDF, data source |
| Try notebook-based exploration | `Notebooks/README.md` | kernel, package versions, cells changed |
| Work on SciClone | `HPC-Sciclone/README.md` | login node, environment name, job or kernel settings |
| Find a small contribution | `REU-Onboarding/README.md` | assignment owner, next action, open question |

## Important Source Files

- [Main repository README]({{ site.repo_url }}/blob/main/README.md)
- [Start here for new students]({{ site.repo_url }}/blob/main/STUDENT_START_HERE.md)
- [Contributing guide]({{ site.repo_url }}/blob/main/CONTRIBUTING.md)
- [Git help]({{ site.repo_url }}/blob/main/GIT-HELP.md)
- [Student checklists]({{ '/student-checklists/' | relative_url }})

## What To Do When You Are Lost

Look for a `README.md` in the folder you are using. If there is not one, write down what confused you. A good first contribution is often a short README that explains what to run first, what software is required, and what output to expect.
