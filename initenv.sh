#!/bin/bash

set -e

CMD_DIR=$(readlink -m "${BASH_SOURCE[0]}"/..)
TOP_DIR=$(readlink -m "${CMD_DIR}")

cd "$TOP_DIR"

if [[ ! -d venv.build ]]; then
    echo "Creating Python3 virtual environment in $(pwd)/venv.build"
    mkdir venv.build
    python3 -m venv venv.build
    source venv.build/bin/activate
    python3 -m pip install -r requirements.txt
else
    echo "Virtual environment $(pwd)/venv.build already exists."
    echo "Remove it and rerun this script if you want to recreate it."
fi
