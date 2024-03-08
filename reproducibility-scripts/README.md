# Reproducibility Scripts

Contents of this directory:

```text
.
├── rlc   # All runs in in this project as wandb sweeps. Names are self-explanatory.
│         ├── atari-ppo
│         │         ├── baselines.yaml
│         │         ├── capacity-all.yaml
│         │         ├── control-algo.yaml
│         │         ├── control-all.yaml
│         │         ├── control-optimizer.yaml
│         │         ├── control-regularize-all-layers.yaml
│         │         ├── control-regularize.yaml
│         │         ├── control-shared-trunk.yaml
│         │         └── get-all-runs-for-capacity.sh
│         └── mujoco-ppo
│             ├── baselines.yaml
│             ├── capacity-all.yaml
│             ├── control-algo.yaml
│             ├── control-optimizer.yaml
│             └── get-all-runs-for-capacity.sh
└── dev
     └── cleanrl-ppo     # Scripts to compare our implementation with CleanRL's
        ├── cleanrl-vs-torchrl.sh
        └── torchrl-vs-cleanrl.sh

```
