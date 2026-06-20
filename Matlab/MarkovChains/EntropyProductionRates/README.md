# Entropy Production Rates For Markov Chains

This folder contains examples for entropy, entropy rates, and entropy production in continuous-time Markov chains.

## Main Files

- `two_state_markov_chain_entropy_rates_ver01.m`
- `n_state_markov_chain_entropy_rates_numerical_ver01.m`
- `n_state_markov_chain_entropy_rates_symbolic_ver01.m`

## Required Software

- MATLAB
- Symbolic Math Toolbox for the symbolic example

The numerical `n`-state script calls `expmv`. If MATLAB cannot find that function, use the two-state script first or add the appropriate matrix-exponential helper to your MATLAB path.

## What To Run First

Start with the two-state example:

```matlab
two_state_markov_chain_entropy_rates_ver01
```

Then compare it with:

```matlab
n_state_markov_chain_entropy_rates_numerical_ver01
```

## Expected Output

The scripts plot time-dependent state probabilities, Shannon entropy, and entropy production rate terms. Some scripts also save PNG figure files using the script name as the filename prefix.

## What It Demonstrates

- computing state probabilities for a continuous-time Markov chain
- tracking Shannon entropy over time
- decomposing entropy production into exchange and internal terms
- comparing numerical derivative checks with analytic or direct formulas

## Best For

Students who are comfortable with linear algebra, probability, and continuous-time Markov chains.
