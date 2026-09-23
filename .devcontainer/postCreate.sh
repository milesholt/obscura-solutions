#!/usr/bin/env bash
# Runs automatically when the Codespace is created.
set -euo pipefail

echo "== Obscura Solutions: preparing OpenLane2 in this Codespace =="

if [ ! -d "openlane2" ]; then
    git clone https://github.com/efabless/openlane2.git
fi

echo ""
echo "Setup complete. Next, from the Codespace terminal, run:"
echo "  cd openlane2"
echo "  nix-shell --pure"
echo "  openlane --smoke-test"
echo ""
echo "Once that passes, run the lab's own smoke-test design:"
echo "  openlane ../tracks/asic-bitcoin/rtl/smoketest.v --to Placement (or full flow)"
echo ""
echo "Note: first run downloads the SKY130 PDK (a few GB) — this counts"
echo "against the Codespace's 15GB free storage, so this is a good"
echo "environment to build in but not to leave idle for long periods."
