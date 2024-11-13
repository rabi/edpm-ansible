#!/usr/bin/env bash

# Wait for few seconds for network to be ready
echo waiting for networks to be ready
sleep 10

# Adding edpm ansible-runner specific scripts here
# Expand the variables
eval "echo \"$(cat /runner/env/settings)\"" > /runner/env/settings

if [ -n "$RUNNER_INVENTORY" ]; then
    echo "---" > /runner/inventory/inventory.yaml
    echo "$RUNNER_INVENTORY" >> /runner/inventory/inventory.yaml
fi

if [ -n "$RUNNER_PLAYBOOK" ]; then
    echo "---" > /runner/project/playbook.yaml
    echo "$RUNNER_PLAYBOOK" >> /runner/project/playbook.yaml
fi

if [ -n "$RUNNER_CMDLINE" ]; then
    echo "$RUNNER_CMDLINE" >> /runner/env/cmdline
fi

if [ -n "$RUNNER_EXTRA_VARS" ]; then
    echo "---" > /runner/env/extravars
    echo "$RUNNER_EXTRA_VARS" >> /runner/env/extravars
fi

# Contents from ansible-runner entrypoint
