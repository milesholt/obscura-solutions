# Obscura Solutions

An AI-assisted research laboratory for ambitious, unconventional electrical
engineering, energy, and computing projects — designed and prototyped with AI
assistance from hypothesis through hardware.

## Mission

To build a reusable, open-source workflow environment for researching,
simulating, and prototyping ideas that are difficult, novel, or widely
considered impractical — while staying rigorously grounded in physics and
engineering reality. Ambition lives in the *scope* of the ideas explored, not
in suspending the rules that decide whether they work.

## The research loop

Every experiment in every track follows the same loop:

1. **Hypothesis** — state the claim precisely and make it falsifiable
2. **Simulation** — model it before building it; try to kill it cheaply
3. **Falsifiable prediction** — what result would prove this wrong?
4. **Prototype** — build the smallest thing that tests the prediction
5. **Benchmark** — measure it against the prediction, honestly
6. **Revise** — update the hypothesis, or the track, based on the result

No track proceeds to a hardware spend until a simulation or a first-principles
physics check has genuinely tried to kill the idea. Negative results are
logged with the same care as positive ones — a well-documented failure is a
real lab output, not a wasted one.

## Repo layout

```
obscura-solutions/
├── core/
│   ├── templates/       # shared document templates (experiment log, etc.)
│   ├── sim/             # shared simulation helpers (unit conversions,
│   │                     component models, plotting)
│   └── benchmarks/      # shared benchmark schema + results format
└── tracks/
    ├── asic-bitcoin/     # custom Bitcoin ASIC — RTL to GDSII to silicon
    ├── energy-harvesting/# energy generation, harvesting & storage research
    └── ai-accelerator/   # custom AI accelerator chip
```

New ideas become new folders under `tracks/`, using `core/` as-is. Nothing
about the shared structure should need to change to add a track.

## Tracks

| Track | Objective | Status |
|---|---|---|
| [`asic-bitcoin`](tracks/asic-bitcoin/) | Design, verify, and tape out a custom SHA-256 ASIC on an open PDK (SKY130), starting via Tiny Tapeout | Scaffolding |
| [`energy-harvesting`](tracks/energy-harvesting/) | Explore energy generation, harvesting, and storage efficiency at the edge of what physics allows — no free-energy claims, real headroom only | Not started |
| [`ai-accelerator`](tracks/ai-accelerator/) | Prototype a small AI accelerator core (FPGA first, then silicon) toward eventually training a custom model on Obscura-designed hardware | Not started |

## Ground rules

- Every experiment gets a log entry using `core/templates/experiment.md`.
- Every claim that could be checked against a conservation law gets checked
  against a conservation law, first.
- "Ambitious" and "ungrounded" are different things. This lab aims for the
  first and actively guards against the second.
