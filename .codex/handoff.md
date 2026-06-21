# Codex Handoff

Date: 2026-06-21

Repo: `computational-biology-lab`

Branch: `main`

Current Git status after the 2026-06-21 migration readiness fetch and before this handoff edit:

```bash
## main...origin/main
```

## Repository Role

This is a public teaching and onboarding repository for the Computational
Biology Lab at William & Mary. It contains MATLAB, LaTeX, TikZ, notebook,
SciClone/HPC, REU onboarding, and other student-facing examples.

The main rule is to preserve usefulness for students. Prefer focused
improvements, concrete commands, and folder-level explanations over broad
reorganization.

## Recent Context

- 2026-06-20 review/cleanup pass:
  - Public Pages site was improved with `docs/assets/lab-research-banner.png`,
    `docs/student-checklists.md`, clearer quick entry points, and public/private
    contribution guidance.
  - Clearly third-party/reference PDFs were removed from the public current tree
    and copied to the private companion repo under
    `public-reference-archive/` with original relative paths preserved.
  - A follow-up moved remaining standalone/article-like PDFs and LeVeque
    finite-difference book PDFs to the organized private reference library.
  - Incidental artifacts `.DS_Store` and `qasexamples14.synctex(busy)` were
    removed from the public current tree; `.gitignore` now covers the Synctex
    busy variant.
  - This pass checked the current tree, not Git history. A history scrub would
    be a separate, destructive/public-coordination decision.
- `HPC-Sciclone/PY-PDE/README.md` documents `py-pde` setup for SciClone and a
  macOS/Homebrew contrast path.
- The intended conda environment and Jupyter kernel name for that workflow is
  `pde`.
- The SciClone instructions intentionally include exact kernel path and
  `kernel.json` configuration details.
- Prior public-repo cleanup work treated current-tree checks and Git-history
  checks as separate steps when sensitive material was in scope.

## Useful Commands

Check status:

```bash
git status --short --branch
```

Check whitespace in a scoped diff:

```bash
git diff --check
```

Review the `py-pde` setup notes:

```bash
sed -n '1,240p' HPC-Sciclone/PY-PDE/README.md
```

## Migration Readiness Snapshot

- Checked on 2026-06-21 before moving computers.
- Non-interactive `git fetch --all --prune` completed successfully.
- Root `README.md` points to `.codex/handoff.md` when a root README exists.

Pre-edit Git state after fetch:

```bash
## main...origin/main
```

## Notes For The Next Codex

- Read `AGENTS.md` before making changes here.
- Keep this repository public-safe. Do not introduce private student records,
  unpublished research material, proposals, credentials, or other sensitive
  content.
- For `HPC-Sciclone/PY-PDE`, preserve the exact `pde` environment/kernel naming
  unless Greg explicitly changes the convention.
- For student-facing examples, prefer clear README updates and small runnable
  examples over clever abstractions.
- If the user asks for a public-sensitivity audit, check the current tree first
  and Git history as needed.
