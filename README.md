# Representation Dynamics in Policy Optimization

## Overview

Add abstract.

## Getting Started

### Code and development environment

We support the following methods and platforms for installing the project dependencies and running the code.

- **Docker/OCI-container for AMD64 machines (+ NVIDIA GPUs)**:
  This option works for machines with AMD64 CPUs and NVIDIA GPUs.
  E.g. Linux machines (ANONYMOUS-INSTITUTION HaaS servers, VMs on cloud providers),
  Windows machines with WSL, and clusters running OCI-compliant containers,
  like the ANONYMOUS-INSTITUTION Run:ai (Kubernetes) clusters.

  Follow the instructions in `installation/docker-amd64-cuda/README.md` to install the environment
  then get back here for the rest of the instructions to run the experiments.

  We ran our experiments on an 80GB NVIDIA A100 GPU and an AMD EPYC 7543 CPU.
  The Atari experiments require around 3GB of GPU memory with only the training device set to CUDA
  and around 10GB of GPU memory with all devices set to CUDA.

- **Conda for osx-arm64**
  This option works for macOS machines with Apple Silicon and can leverage MPS acceleration.

  Follow the instructions in `installation/conda-osx-arm64-mps/README.md` to install the environment
  then get back here for the rest of the instructions to run the experiments.

  We ran some toy experiments with the CarPole environment on an M2 MacBook Air.
  You can run the Atari experiments with MPS acceleration setting `device.training=mps`.

### Logging and tracking experiments

We use [Weights & Biases](https://wandb.ai/site) to log and track our experiments.
If you're logged in, your default entity will be used (a fixed entity is not set in the config),
and you can set another entity with the `WANDB_ENTITY` environment variable.
Otherwise, the runs will be anonymous (you don't need to be logged in).

## Reproduction and Experimentation

### Reproducing our results

We provide scripts to reproduce our work in the `reproducibility-scripts/` directory.
It has a README at its root describing which scripts reproduce which experiments.

### Experiment with different configurations

The default configuration for each script is stored in the `configs/` directory.
They are managed by [Hydra](https://hydra.cc/docs/intro/).
You can experiment with different configurations by passing the relevant arguments.
You can get examples of how to do so in the `reproducibility-scripts/` directory.

### Using trained models and experimenting with results

We share our Weights and Biases runs in [this W&B project](https://wandb.ai/lawmen-05-shark/po-dynamics-rlc/).

We will make our trained models available after the submission as metadata contains non-anonymous information.

## Repository structure

Below, we give a description of the main files and directories in this repository.

```
└── src/                                # Source code.
    └── po_dynamics                     # Our package.
        ├── configs/                    # configuration files for environments, models, and algorithms.
        ├── modules/                    # Data processing scripts.
        ├── solve.py                    # Main script to train models.
        ├── capacity.py                 # Script to compute plasticity.
        └──  toy_problems.py            # Script to run the toy problem.

    └─── cleanrl/                       # Scripts to mimin our implementation in CleanRL (has very limited features)
          ├                             # Used to reproduce and verify that our implementation doesn't have a random bug.
          ├── ppo_atari_original.py     # CleanRL's PPO implementation.
          ├── ppo_atari.py              # Modified CleanRL's PPO to have the same setting as out codebase.
          ├── ppo_atari_2models.py      # Same but with separate actor and critic.
          └── template_experiment.py

```

## Contributing

We use [`pre-commit`](https://pre-commit.com) hooks to ensure high-quality code.
Make sure it's installed on the system where you're developing
(it is in the dependencies of the project, but you may be editing the code from outside the development environment.
If you have conda you can install it in your base environment, otherwise, you can install it with `brew`).
Install the pre-commit hooks with

```bash
# When in the PROJECT_ROOT.
pre-commit install --install-hooks
```

Then every time you commit, the pre-commit hooks will be triggered.
You can also trigger them manually with:

```bash
pre-commit run --all-files
```
