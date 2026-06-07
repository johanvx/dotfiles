---
name: skill-creator
description: Creates new Pi skills from scratch, or reviews and polishes existing skills for conformance, completeness, and clarity. Use when building a new skill, auditing a skill, or improving a skill's structure and writing.
---

# Skill Creator & Reviewer

Use this skill when the user wants to **create**, **review**, or **polish** a Pi skill.

## Read also

- [Skills style convention](references/skills-style-convention.md) — authoritative structural and safety rules
- [Blank SKILL.md template](templates/skill-template.md) — starting point for new skills
- Pi skill docs: https://github.com/earendil-works/pi-coding-agent (see `docs/skills.md`)

---

## Non-negotiable safety policy

Must:

1. Never fabricate citations, references, or links.
2. Never fabricate numeric results, experiment outcomes, or hardware specs.
3. If key info is missing, ask up to 5 targeted questions, then proceed with explicit placeholders.
4. Keep claims proportional to evidence.
5. Never overwrite or delete an existing skill without explicit user confirmation.

---

## Mandatory intake questions

Ask before starting (unless already answered by context):

1. **Mode**: Create new skill, review existing, or polish/rewrite existing?
2. **Skill name** (kebab-case) — or let me suggest one?
3. **Purpose**: What should the skill do? When should the agent load it?
4. **Domain**: Any specific domain knowledge, references, or templates to include?
5. **Existing assets**: Any scripts, templates, or reference files already drafted?

For **review/polish** mode, additionally ask:

6. What specific concerns? (structure, clarity, completeness, convention conformance, all of the above?)

---

## Standard workflow — CREATE mode

### Step 0. Preflight

- Confirm skill name is valid kebab-case (lowercase, no leading/trailing hyphens, no consecutive hyphens, ≤ 64 chars).
- Confirm target directory (`~/.agents/skills/<name>/` or user-specified).
- Confirm no name collision with existing skills.
- Check: does a directory already exist? If yes, warn and ask before proceeding.

### Step 1. Gather requirements

- Collect purpose, domain, and any domain-specific sections the user needs.
- Identify if templates or references are needed.
- Draft a one-sentence description (≤ 1024 chars) that is specific enough for the agent to load the skill correctly.

### Step 2. Scaffold structure

Create directory and populate files:

```
<skill-name>/
  SKILL.md              ← from template, filled in
  templates/            ← if needed
  references/           ← if needed
```

### Step 3. Draft SKILL.md

Follow section order from the convention:

1. `# <Skill Title>` — clear, descriptive
2. Purpose/when-to-use — one paragraph
3. Read also — link templates and references
4. Non-negotiable safety policy — use the standard four rules, add domain-specific ones
5. Mandatory intake questions — 3–7 questions relevant to the skill's domain
6. `## Standard workflow`
   - Step 0: Preflight (validation, context gathering)
   - Step 1+: Domain-specific steps
   - Final step: Main output assembly
7. `## Standard output contract (every run)` — use the standard six-item contract
8. Domain/style/mode-specific sections — as needed

### Step 4. Write domain sections

- Add any domain-specific knowledge, style constraints, mode-specific behaviour, checklists, or reference material.
- Keep instructions operational: prefer checklists and step-wise instructions over prose.
- Separate policy (must) from guidance (should).

### Step 5. Validate

Run through the review checklist (see below) on the newly created skill.

### Step 6. Main output assembly

Present the completed skill to the user per the output contract.

---

## Standard workflow — REVIEW mode

### Step 0. Preflight

- Read the target `SKILL.md` in full.
- Identify the skill's name, purpose, and domain.
- Load the [skills style convention](references/skills-style-convention.md).

### Step 1. Structural audit

Check against the convention:

- [ ] Valid frontmatter (`name`, `description` present; name is valid kebab-case; description ≤ 1024 chars)
- [ ] Section order matches convention (title → purpose → read also → safety → intake → workflow → output contract → domain sections)
- [ ] `## Standard workflow` present with Step 0 Preflight and final Main output assembly step
- [ ] `## Standard output contract (every run)` present with the six standard items
- [ ] Integrity tag vocabulary is correct (`[EVIDENCE NEEDED]`, `[REFERENCE NEEDED]`, `[VERIFY DETAIL]`)
- [ ] Non-negotiable safety policy present with the four standard rules
- [ ] Templates and references use relative links from SKILL.md

### Step 2. Completeness audit

- [ ] Description is specific enough for correct agent loading (not vague)
- [ ] Intake questions cover the key unknowns for the domain
- [ ] Workflow steps are actionable (not vague prose)
- [ ] Domain-specific sections are present if the skill has specialised knowledge
- [ ] Deviation note present (or "None")

### Step 3. Clarity audit

- [ ] Instructions are operational (checklists, step-wise, not essay-style)
- [ ] Tone is concise, neutral, non-hype
- [ ] Policy (must) is separated from guidance (should)
- [ ] No ambiguous pronouns or vague references
- [ ] No dangling references to missing files

### Step 4. Produce review report

Output a structured report:

**Passes** — items that meet convention.
**Issues** — items that violate convention or are missing, each with:
  - What is wrong
  - Where (section/line)
  - Suggested fix

**Recommendations** — optional improvements for clarity, completeness, or usability.

---

## Standard workflow — POLISH mode

### Step 0. Preflight

- Read the target `SKILL.md` in full.
- Run the REVIEW workflow to produce a report.
- Present the report to the user and confirm which issues to fix.

### Step 1. Apply fixes

For each confirmed issue:

- Fix structural violations (section order, missing sections, frontmatter).
- Fix content issues (vague instructions, missing intake questions, incomplete workflow).
- Fix clarity issues (prose → checklists, ambiguous wording).
- Fix style issues (tone, policy vs guidance separation).

### Step 2. Rewrite pass

- Tighten prose: remove filler, redundancy, and hedge words.
- Convert narrative paragraphs to checklists or numbered steps where appropriate.
- Ensure every workflow step is actionable.
- Ensure integrity tags are used correctly and consistently.

### Step 3. Validate

Run the full review checklist (Step 1–3 of REVIEW mode) on the polished skill.

### Step 4. Diff summary

Present a before/after summary of changes made, grouped by:
- Structural fixes
- Content additions
- Clarity improvements
- Style adjustments

---

## Standard output contract (every run)

1. **Assumptions**
2. **Missing info**
3. **Risks**
4. **Main output(s)**
   - For CREATE: the complete skill directory contents
   - For REVIEW: the structured review report
   - For POLISH: the diff summary + updated skill
5. **Evidence/citation/integrity flags**
   - `[EVIDENCE NEEDED: <claim>]`
   - `[REFERENCE NEEDED: <claim>]`
   - `[VERIFY DETAIL: <statement>]`
6. **Next actions for user**

---

## Writing style constraints

- Be specific and operational.
- Prefer checklists and step-wise instructions.
- Keep tone concise, neutral, and non-hype.
- Separate policy (must) from guidance (should).
- Use concrete examples when they clarify an instruction.
- One paragraph, one logical role.

## Deviation note

None.
