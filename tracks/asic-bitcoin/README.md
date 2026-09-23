# Track: Custom Bitcoin ASIC

## Objective

Design, verify, and tape out a custom SHA-256d hashing ASIC entirely with
AI-assisted, open-source tooling — proving the full RTL-to-silicon flow on
real hardware. This is a proof of the *flow*, not an attempt to compete with
commercial mining ASICs (those run on process nodes far beyond what
open-source PDKs currently support).

## Target flow

RTL (Verilog) → Yosys (synthesis) → OpenROAD/OpenLane2 (place & route) →
SKY130 (open PDK) → Tiny Tapeout (first silicon) → Efabless/ChipIgnite
(full-die follow-up)

## Phases

1. **Environment** — get Yosys / OpenROAD / OpenLane2 running; push a known
   trivial design through the full flow to prove the pipeline works end to
   end before touching real RTL.
2. **SHA-256 core** — design and thoroughly verify a SHA-256d pipeline in
   Verilog, sized to fit a Tiny Tapeout tile.
3. **Tapeout #1** — submit via Tiny Tapeout, get real silicon back,
   characterize it on a bench.
4. **Scale up** — full custom-die design (multiple hash engines, on-chip
   control logic) via Efabless/ChipIgnite.
5. **System** — board design, power delivery, firmware.

## Structure

```
asic-bitcoin/
├── rtl/            # Verilog source
├── experiments/     # one log per core/entry.md, using core/templates/experiment.md
└── README.md
```

## Status

Scaffolding only — no RTL written yet. Next step: Phase 1 environment setup
(Yosys/OpenROAD/OpenLane2), then experiment 001: SHA-256 core architecture
and verification plan.
