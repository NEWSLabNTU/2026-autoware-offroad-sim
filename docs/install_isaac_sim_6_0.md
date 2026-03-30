# Installing NVIDIA Isaac Sim 6.0 (Early Developer Release) on x86 Linux

This guide details the source-build installation for the [**NVIDIA Isaac Sim 6.0 Early Developer Release**](https://github.com/isaac-sim/IsaacSim/tree/develop).

## 1. System Requirements

*   **OS:** Ubuntu 22.04 (GCC/G++ 11, higher versions are not supported yet).
*   **GPU:** NVIDIA GeForce RTX 4080 or above.

## 2. Installation (Source Build)

```bash
just install
```

See [here](https://github.com/isaac-sim/IsaacSim/tree/develop?tab=readme-ov-file#advanced-build-options) for build options.

## 3. Launching Isaac Sim

Run the simulator using the built binary:

```bash
just run
```
