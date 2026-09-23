#!/usr/bin/env bash
# Obscura Solutions — asic-bitcoin track
# Local setup for OpenLane2 (place & route, SKY130 PDK).
# This stage needs Docker and is NOT runnable inside the sandboxed
# research-lab container — run this on your own machine.
#
# Prerequisites: Docker installed and running, ~15GB free disk space.
# Tested against OpenLane2's documented install path as of 2026.

set -euo pipefail

echo "== Obscura Solutions: OpenLane2 local setup =="

# 1. Clone OpenLane2
if [ ! -d "openlane2" ]; then
    git clone https://github.com/efabless/openlane2.git
fi
cd openlane2

# 2. OpenLane2 ships a Nix-based installer that also handles the Docker
#    path. The simplest route for a first-time setup is their documented
#    one-liner, which pulls the correct OpenROAD/Yosys/Magic/KLayout/SKY130
#    versions as a pinned toolchain:
echo ""
echo "Next steps (run manually, this script stops here so you can review):"
echo "  1. Install Nix:      curl -L https://nixos.org/nix/install | sh"
echo "  2. Enter the shell:  nix-shell --pure"
echo "  3. Smoke-test:       openlane --smoke-test"
echo ""
echo "Once that smoke-test passes, you have a working RTL-to-GDSII flow on"
echo "SKY130. Bring the smoketest.v design from this repo"
echo "(tracks/asic-bitcoin/rtl/smoketest.v) through it next, before the"
echo "real SHA-256 core, to confirm P&R end to end on this specific design."
