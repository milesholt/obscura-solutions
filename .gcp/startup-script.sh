#!/usr/bin/env bash
# Obscura Solutions — GCE VM startup script.
# Runs automatically every time the VM boots (set as the instance's
# startup-script metadata). Installs Docker + Nix, clones this repo,
# and clones OpenLane2 — so the VM is ready to work in as soon as you SSH in.
set -euo pipefail

# 1. Docker
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com | sh
    usermod -aG docker "$(logname)"
fi

# 2. Nix (used by OpenLane2's installer)
if ! command -v nix-shell &> /dev/null; then
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
fi

# 3. This repo — replace REPLACE_WITH_REPO_URL with your actual GitHub
#    repo URL once it exists (e.g. https://github.com/<you>/obscura-solutions.git)
cd /opt
if [ ! -d "obscura-solutions" ]; then
    git clone REPLACE_WITH_REPO_URL obscura-solutions || \
      echo "Set REPLACE_WITH_REPO_URL in this script to your GitHub repo URL first."
fi

# 4. OpenLane2
if [ ! -d "openlane2" ]; then
    git clone https://github.com/efabless/openlane2.git
fi

echo "Setup complete. SSH in, then: cd /opt/openlane2 && nix-shell --pure && openlane --smoke-test"
