# Flory-Huggins Phase Diagram For A Binary Fluid

This example plots the Flory-Huggins free energy of mixing and uses common-tangent construction ideas to identify phase separation behavior.

## Main File

- `floryhuggins.m`

## Required Software

- MATLAB

The script uses standard MATLAB plotting tools and `convhull`.

## What To Run First

Open MATLAB in this folder and run:

```matlab
floryhuggins
```

## Expected Output

The script produces figures for:

- the free energy of mixing for several values of the interaction parameter `chi`
- a phase-diagram-style visualization over a range of `chi` and volume fraction values

When run, the script saves PNG files with the generated figures.

## What It Demonstrates

- evaluating the Flory-Huggins free energy of mixing
- sweeping a parameter to see qualitative changes in phase behavior
- using a convex hull calculation as a computational way to find common-tangent information
- producing publication-style figures from a MATLAB script

## Best For

Students with some background in thermodynamics, statistical mechanics, or phase separation models.
