# Installing NVIDIA Isaac Sim 6.0 (Early Developer Release) on x86 Linux

This guide details the source-build installation for the [**NVIDIA Isaac Sim 6.0 Early Developer Release**](https://github.com/isaac-sim/IsaacSim/tree/develop).

## 1. System Requirements

*   **OS:** Ubuntu 22.04 (GCC/G++ 11, higher versions are not supported yet).
*   **GPU:** NVIDIA GeForce RTX 4080 or above.

## 2. Installation Steps (Source Build)

1.  **Clone the Repository:**

    ```bash
    git clone --recursive --branch=develop https://github.com/isaac-sim/IsaacSim.git isaacsim
    cd isaacsim
    ```

2.  **Initialize Git LFS:**

    Ensure Large File Storage is active to pull the necessary assets.
    ```bash
    git lfs install
    git lfs pull
    ```

3.  **Build the Project:**

    Confirm that GCC/G++ 11 is being used before building using the following commands.
    ```bash
    gcc --version
    g++ --version
    ```

    Execute the build script to compile the simulator.
    ```bash
    ./build.sh
    ```

    See [here](https://github.com/isaac-sim/IsaacSim/tree/develop?tab=readme-ov-file#advanced-build-options) for build options.

4.  **Configure Environment Variables:**

    Set the path to the built binaries for easy access.
    ```bash
    export ISAACSIM_PATH="${PWD}/_build/linux-x86_64/release"
    export ISAACSIM_PYTHON_EXE="${ISAACSIM_PATH}/python.sh"
    ```

## 3. Launching Isaac Sim

Run the simulator using the built binary:

```bash
${ISAACSIM_PATH}/isaac-sim.sh
```
