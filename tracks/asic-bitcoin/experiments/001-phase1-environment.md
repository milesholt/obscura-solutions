# Experiment 001 — Phase 1: toolchain environment smoke test

**Track:** asic-bitcoin
**Date opened:** 2026-09-23
**Status:** simulated (partial — see result)

## Claim

A trivial, known-good digital design can be pushed through the full
open-source RTL-to-GDSII flow (Yosys -> OpenROAD/OpenLane2 -> SKY130) with
no errors, proving the toolchain before any real RTL is written.

## Falsifiable prediction

If any stage of the flow fails or is unavailable, the flow is not yet proven
and no further design work should build on top of it.

## Method

`rtl/smoketest.v` — a 2-input AND gate feeding a D flip-flop with
synchronous reset. Run through Yosys synthesis, then intended to run through
OpenLane2 place & route targeting SKY130.

## Result

- **Yosys synthesis: PASS.** Design synthesized cleanly to 2 cells
  (1x $_AND_, 1x $_SDFF_PP0_), 0 problems reported by Yosys's CHECK pass.
  See `rtl/smoketest_synth.v` for the synthesized netlist.
- **OpenROAD / OpenLane2 (place & route): NOT RUN.** Not available in the
  sandboxed lab container (no Docker access, not in apt). Setup script for
  running this stage locally is at `setup_openlane2_local.sh`.

## Verdict

- [ ] Confirmed
- [ ] Falsified
- [x] Inconclusive — needs place & route run locally (via
      `setup_openlane2_local.sh`) to close out this experiment

## Next step

Run `setup_openlane2_local.sh` on a local machine with Docker/Nix, push
`smoketest.v` through OpenLane2 targeting SKY130, confirm a clean GDSII
output. Once that passes, close this experiment and open 002: SHA-256 core
architecture and verification plan.
