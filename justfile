set dotenv-load := false

repo_url := "https://github.com/isaac-sim/IsaacSim.git"
branch := "develop"
dir := "$HOME/isaacsim"

# List available commands by default
default:
    @just --list

# Install recipe: clone, setup, and build
@install: clone lfs check-compiler build

# Clone the repository to the home directory
@clone:
    if [ ! -d "{{dir}}" ]; then \
        echo "Cloning repository to {{dir}}..."; \
        git clone --recursive --branch={{branch}} {{repo_url}} "{{dir}}"; \
    else \
        echo "Directory {{dir}} already exists. Skipping clone."; \
    fi

# Initialize and pull Git LFS assets
@lfs: clone
    echo "Initializing Git LFS in {{dir}}..."
    cd "{{dir}}" && git lfs install
    cd "{{dir}}" && git lfs pull

# Verify GCC/G++ 11 is being used
@check-compiler:
    gcc_version=$(gcc -dumpversion | cut -f1 -d.); \
    if [ "$gcc_version" != "11" ]; then \
        echo "Error: GCC 11 is required. Found version $gcc_version."; \
        exit 1; \
    fi
    echo "Compiler check passed."

# Build the project
@build:
    cd "{{dir}}" && ./build.sh

# Run the simulator with required environment variables
run:
    #!/usr/bin/env bash
    export ROS_DISTRO=humble
    export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/humble/lib
    cd "{{dir}}"
    ./_build/linux-x86_64/release/isaac-sim.sh

# Remove the downloaded repository
@clean:
    rm -rf "{{dir}}"