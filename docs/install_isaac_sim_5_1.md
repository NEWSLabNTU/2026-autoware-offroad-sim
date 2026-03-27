# Installing NVIDIA Isaac Sim 5.1 on x86 Linux (Ubuntu 22.04/24.04)

This guide details the standard workstation installation for the stable release of **NVIDIA Isaac Sim 5.1**.

## 1. System Requirements

Ensure your system meets the following specifications for optimal performance:

*   **OS:** Ubuntu 22.04/24.04 (Linux x86_64).
*   **CPU:** Intel Core i7 (7th Generation) / AMD Ryzen 5 or above.
*   **GPU:** NVIDIA GeForce RTX 4080 or above.
*   **VRAM:** 16 GB or more.
*   **RAM:** 32 GB or more.
*   **NVIDIA Driver:** version **580.65.06** or later.

## 2. Installation Steps (Workstation Method)

1.  **Download the Binary:**
    Visit the [NVIDIA Isaac Sim Download page](https://docs.isaacsim.omniverse.nvidia.com/5.1.0/installation/download.html) and download the Linux (x86_64) standalone ZIP file.

2.  **Extract the Package:**
    ```sh
    mkdir ~/isaacsim
    # Replace with the actual filename of your download
    unzip "isaac-sim-standalone-5.1.0-linux-x86_64.zip" -d ~/isaacsim
    cd ~/isaacsim
    ```

3.  **Run Post-Installation Script:**
    This script configures necessary dependencies and system settings.
    ```sh
    ./post_install.sh
    ```

4.  **Verify Compatibility:**
    Check if your hardware and drivers are correctly configured.
    ```sh
    ./isaac-sim.compatibility_check.sh
    ```

## 3. Launching Isaac Sim

1.  Launch the **App Selector**:
    ```sh
    ./isaac-sim.selector.sh
    ```
2.  In the selector window, click **Start** to launch the simulator.
3.  A command window will open and run scripts. This process can take longer than expected. During the process, it might look like the installation has failed because you see a blank window. Continue to wait.

## 4. Optional: If Isaac Sim Failed to Launch
If Isaac Sim Failed to Launch, try the following:

1.  Make sure you have not sourced your system's ROS 2 setup script (`source /opt/ros/humble/setup.bash`) in your `~/.bashrc`. Or just use the basic `sh`.
2.  Remove cache
    Use `clear_caches.sh` or
    ```sh
    rm -rf ~/.cache/ov
    rm -rf ~/.nv/ComputeCache
    rm -rf ~/.cache/nvidia/GLCache
    rm -rf ~/.local/share/ov/data/Kit/Isaac-Sim\ Full/5.1/Cache
    ```
3.  Try reset the user configuration to its default state (`--reset-user`).
4.  ```sh
    export ROS_DISTRO=humble
    export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/b10902076/isaac-sim/exts/isaacsim.ros2.bridge/humble/lib
    export CUDA_MPS_PIPE_DIRECTORY=/tmp/nvidia-mps-ignore-me

    ./isaac-sim.sh  --no-window --/exts/omni.kit.renderer.core/renderer=none
    ```