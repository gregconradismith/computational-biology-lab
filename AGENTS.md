# Agent Instructions

This repository is a public teaching library for the Computational Biology Lab
at William & Mary. Treat it as student-facing material first: changes should
make examples easier to find, run, understand, adapt, or review.

Keep edits small and scoped to the requested folder or workflow. Do not
reorganize, delete, or rename shared examples unless the user explicitly asks.
Many paths may be referenced by students, course notes, or onboarding material.

Before editing a folder, read the nearest `README.md` and preserve its teaching
style. New example folders should include a short `README.md` that explains what
to run first, required software, expected output, and where to look next.

For `HPC-Sciclone/PY-PDE`, keep the instructions SciClone-first and preserve the
exact `pde` conda environment and Jupyter kernel naming. Include concrete paths,
commands, and kernel configuration details when changing setup docs.

This is a public repository. Do not add private student information, unpublished
research results, proposal material, transcripts, credentials, tokens, or other
sensitive files. When auditing sensitive material, check both the current tree
and Git history if the user asks for a public-repo cleanup.

Generated files and large attachments are allowed only when they support a
teaching goal. Avoid committing incidental local files such as `.DS_Store`,
temporary notebook checkpoints, build products, or generated outputs that are
not part of the lesson.

Useful lightweight checks:

```bash
git status --short --branch
git diff --check
```

For documentation-only edits, inspect the changed Markdown and Git state. Run
example code only when it is practical and relevant to the requested change.

## Codex Coordination

At the start of work, read `.codex/handoff.md` and any other Markdown files in
`.codex/` that are relevant to the task. Before ending a session that made
meaningful progress, update `.codex/handoff.md` with the current state, changes,
verification, remaining work, and blockers. Record durable decisions in
`.codex/decisions.md` and concise activity history in `.codex/task-log.md` when
those files are useful.
