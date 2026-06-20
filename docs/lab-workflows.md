---
title: Lab Workflows
permalink: /lab-workflows/
---

# Lab Workflows

These workflows describe how to use the repository without turning shared examples into private scratch space.

## Running An Example

1. Read the local `README.md`.
2. Open the main script, notebook, or document.
3. Check for required software or packages.
4. Run the example unchanged.
5. Save notes about what happened.
6. Make one small change and run it again.

## Adapting An Example For Research

Copy the idea, not necessarily the whole folder. If you need to adapt code for a project:

- preserve the original teaching example
- create a clearly named project folder or branch when appropriate
- avoid absolute file paths tied to one computer
- document parameter choices and data sources
- keep generated outputs only when they support the lesson or analysis

## Writing And Figures

Use `Latex/` for document examples and `TikZ/` for figure examples. Good scientific writing workflows keep source files, generated figures, and notes connected. When possible, document how a figure was made so another student can reproduce it later.

## HPC Work

Use `HPC-Sciclone/` for William & Mary cluster workflows. Cluster examples are environment-specific, so preserve exact environment names, kernel names, paths, and commands when editing those docs.

## Research Notes

Good research notes are dated, searchable, and connected to files. They should answer:

- what question was I trying to answer?
- what did I run or read?
- what changed?
- what result or error did I get?
- what should I try next?

## Reference PDFs And Private Material

Do not add downloaded article PDFs, unpublished project notes, proposal material, private datasets, credentials, or student records to the public repository. If a reference is useful to the lab but should not be public, keep it in the private companion repository and link to an official public source from this site when possible.
