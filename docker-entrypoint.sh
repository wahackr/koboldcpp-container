#!/bin/bash

echo "Available models:"
ls -l /workspace/models

# Custom launch command
echo "Setting up launch command..."
export LAUNCH_COMMAND=${LAUNCH_COMMAND:-"python koboldcpp.py --smartcontext --unbantokens"}
echo "Setting up LAUNCH_COMMAND: $LAUNCH_COMMAND"

# Custom model command
echo "Setting up model to use..."
export MODEL=${MODEL:-'models/default.bin'}
echo "Setting up MODEL: $MODEL"

# Run koboldcpp
echo "Running koboldcpp..."
bash -c "$LAUNCH_COMMAND $MODEL"
