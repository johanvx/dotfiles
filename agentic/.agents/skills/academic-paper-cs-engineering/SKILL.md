---
name: academic-paper-cs-engineering
description: Drafts and revises computational science/engineering papers (IMRaD) for method/benchmark/system work, with conservative claims, claim-evidence mapping, and strict no-fabricated-citation policy. Best for nuclear engineering/reactor physics and simulation-heavy manuscripts.
---

# Academic Paper Writing (CS + Engineering)

Use this skill when the user needs help planning, drafting, or revising academic paper content.

Priority venue assumptions (unless user overrides):
1. Journal of Computational Physics (JCP)
2. Annals of Nuclear Energy (ANE)
3. Nuclear Science and Engineering (NSE)

Default style assumptions:
- IMRaD structure
- Conservative claim style
- Rewrite user-provided claims by default (draft new claims rarely)

Read also:
- [Skill conventions](../SKILLS-STYLE-CONVENTION.md)
- [Style guide](references/style-guide.md)
- [Intake template](templates/intake.md)
- [IMRaD template](templates/imrad-outline.md)

---

## Non-negotiable safety policy

1. NEVER fabricate citations.
2. NEVER fabricate numerical results, hardware specs, datasets, or outcomes.
3. If references are missing, mark clearly and provide search keywords:
   - `[REFERENCE NEEDED: <claim>]`
   - `Keywords: ...`
4. If evidence is missing, mark:
   - `[EVIDENCE NEEDED: <claim>]`
5. Before drafting, always output:
   - Assumptions
   - Missing information
   - Risks

---

## Mandatory intake questions (ask before drafting)

Collect these first (or mark unknown):

1. Target venue
2. Paper type (method / benchmark / system / other)
3. Output mode (outline / section draft / near-submission prose)
4. Target section(s)
5. Word/page budget
6. Problem statement (1–3 sentences)
7. User-provided claims
8. Novelty vs prior work
9. Scope boundaries (what is out of scope)
10. Theory evidence status
11. Numerical experiment status
12. Profiling/performance evidence status
13. Validation/verification protocol
14. Reproducibility details (hardware/software/config)
15. Known limitations / threats to validity
16. Bibliography availability

If critical items are missing, ask up to 5 focused follow-up questions, then continue with explicit placeholders.

---

## Standard workflow

### Step 0 — Preflight
Return:
1. Assumptions
2. Missing info
3. Risks
4. Drafting plan

### Step 1 — Normalize context
Build a claim-evidence matrix:

| Claim | Evidence present | Evidence missing | Citation status | Overclaim risk |
|---|---|---|---|---|

### Step 2 — Plan structure
Create IMRaD section goals and paragraph plans before prose.

### Step 3 — Draft/rewrite
- Prefer rewriting user claims.
- If creating a claim, mark: `[DRAFT CLAIM — VERIFY]`.
- Keep claims bounded to tested conditions.

### Step 4 — Calibration pass
Reduce overclaiming:
- “proves” -> “indicates/suggests under tested conditions”
- “best” -> “competitive in evaluated settings”

### Step 5 — Evidence/citation pass
Mark all unsupported statements with tags:
- `[EVIDENCE NEEDED: <claim>]`
- `[REFERENCE NEEDED: <claim>]`
- `[VERIFY DETAIL: <statement>]` (for uncertain specifics)

### Step 6 — Main output assembly
Prepare requested deliverables (outline / section draft / near-submission prose).

---

## Standard output contract (every run)

1. Assumptions
2. Missing info
3. Risks
4. Main output(s)
5. Evidence/citation/integrity flags
   - `[EVIDENCE NEEDED: <claim>]`
   - `[REFERENCE NEEDED: <claim>]`
   - `[VERIFY DETAIL: <statement>]`
6. Next actions for user

---

## IMRaD defaults for CS/Engineering

## Introduction
- Problem and significance
- Gap in prior work
- Why the gap matters
- Contributions (3–4 bullets max)
- Scope and limitation preview

## Methods
- Formulation/governing model
- Algorithm/system design
- Complexity and implementation choices
- Stability/accuracy assumptions

## Results
- Setup (cases, hardware/software)
- Baselines and fairness protocol
- Main metrics and results
- Ablation/sensitivity (if available)
- Profiling and bottleneck analysis

## Discussion
- Interpretation
- Practical implications
- Limitations and threats to validity

## Conclusion
- One-sentence answer to research question
- Key findings (evidence-backed)
- Bounded future work

---

## Paper-type requirements

### Method paper
- Novelty statement vs closest prior methods
- Method assumptions
- Accuracy/robustness evidence
- Cost-performance discussion

### Benchmark paper
- Benchmark design rationale
- Representativeness
- Reproducibility protocol
- Fairness controls

### System paper
- Architecture and design goals
- Bottleneck analysis
- Reproducibility-relevant implementation details
- End-to-end + component-level performance

---

## Writing style constraints (Tufte/Feynman compatible)

- Clarity over ornament.
- Evidence/mechanism over adjectives.
- One paragraph, one logical role.
- Prefer concrete terms and measured claims.
- Use explicit transitions where logic jumps.
- Summarize decision-relevant content, not all content.

If notes are too large, apply:
1. One takeaway sentence first.
2. Relevance filter by user constraints.
3. Claim/evidence/implication cards.
4. Compress for signal-to-noise.

(See [references/style-guide.md](references/style-guide.md))

---

## Ready-to-use response patterns

### Pattern A: Outline mode
- IMRaD outline
- Claim-evidence mapping
- Missing info and references list

### Pattern B: Section draft mode
- Section objective
- Paragraph plan
- Draft text
- Inline `[EVIDENCE NEEDED: <claim>]` and `[REFERENCE NEEDED: <claim>]`

### Pattern C: Near-submission mode
- Full section prose
- Conservative calibration pass
- Unresolved items block at end
