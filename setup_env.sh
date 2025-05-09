#!/usr/bin/env bash

set -e

YML_FILE="conda_env.yml"

# Check if conda is installed
if ! command -v conda &>/dev/null; then
  echo "Error: conda not found. Please install Conda first."
  exit 1
fi

# Detect architecture
ARCH=$(uname -m)
OS=$(uname)

# Check architecture and handle accordingly
if [[ "$ARCH" == "x86_64" ]]; then
  echo "Detected x86_64 architecture. Proceeding with environment creation..."
  conda env create -f "$YML_FILE"

elif [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
  echo "Detected macOS on Apple Silicon (arm64). Attempting to run as x86_64 using Rosetta..."

  # Run the script under Rosetta using arch
  CONDA_SUBDIR=osx-64 conda env create -f "$YML_FILE"

else
  echo "Error: Unsupported architecture: $ARCH"
  echo "This script only supports x86_64 environments."
  exit 1
fi

# Install the pip files
source activate vt
pip install --trusted-host pypi.python.org -r requirements.txt

# If on Linux, add libglu and install libxt6
if [[ "$OS" == "Linux" ]]; then
  echo "Detected Linux."
  
  echo "Attempting to add libglu"
  conda install libglu

  echo "Attempting to install libxt6..."
  if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y libxt6

  elif command -v dnf &>/dev/null; then
    sudo dnf install -y libXt

  elif command -v pacman &>/dev/null; then
    sudo pacman -Sy --noconfirm libxt

  else
    echo "Warning: Unknown package manager. Please install libxt6 manually."
  fi
fi
