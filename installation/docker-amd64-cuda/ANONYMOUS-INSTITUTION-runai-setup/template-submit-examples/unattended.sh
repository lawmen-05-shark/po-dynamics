# What the team uses:
# Atari
runai submit \
  --name po-dynamics-atari-ppo \
  --image registry.rcp.anonymous-institution.xyz/anonymous/anonymous/po-dynamics:run-latest-anonymous \
  --pvc runai-anonymous-anonymous-scratch:/anonymous-rcp-scratch \
  -e PROJECT_ROOT_AT=/anonymous-rcp-scratch/home/anonymous/po-dynamics/run \
  -e WANDB_API_KEY_FILE_AT=/anonymous-rcp-scratch/home/anonymous/.wandb-api-key-anonymous \
  -e WANDB_CONSOLE=off \
  -e WANDB_DISABLE_GIT=1 \
  -e OMP_NUM_THREADS=1 \
  -g 0.5 --cpu 10 --large-shm \
  -- wandb agent ...

# For MuJoCo rendering use -e DISPLAY=:99
# MuJoCo
runai submit \
  --name po-dynamics-mujoco-ppo-cpu \
  --image registry.rcp.anonymous-institution.xyz/anonymous/anonymous/po-dynamics:run-latest-anonymous \
  --pvc runai-anonymous-anonymous-scratch:/anonymous-rcp-scratch \
  -e PROJECT_ROOT_AT=/anonymous-rcp-scratch/home/anonymous/po-dynamics/run \
  -e WANDB_API_KEY_FILE_AT=/anonymous-rcp-scratch/home/anonymous/.wandb-api-key-anonymous \
  -e WANDB_CONSOLE=off \
  -e WANDB_DISABLE_GIT=1 \
  -e OMP_NUM_THREADS=4 \
  --cpu 54 --node-type S8 --large-shm \
  -- zsh reproducibility-scripts/utils/run-in-parallel.sh 8 wandb agent ...


# Simple examples.
runai submit \
  --name example-unattended \
  --image registry.rcp.anonymous-institution.xyz/anonymous/anonymous/po-dynamics:run-latest-anonymous \
  --pvc runai-anonymous-anonymous-scratch:/anonymous-rcp-scratch \
  -e PROJECT_ROOT_AT=/anonymous-rcp-scratch/home/anonymous/po-dynamics/run \
  -- python -m po_dynamics.template_experiment some_arg=2

# template_experiment is an actual script that you can run.
# or -- zsh po_dynamics/reproducibility-scripts/template-experiment.sh

# To separate the dev state of the project from frozen checkouts to be used in unattended jobs you can observe that
# we're pointing to the .../run instance of the repository on the PVC.
# That would be a copy of the po-dynamics repo frozen in a commit at a working state to be used in unattended jobs.
# Otherwise while developing we would change the code that would be picked by newly scheduled jobs.

# Useful commands.
# runai describe job example-unattended
# runai logs example-unattended
