# Skills Style Convention

This file defines the standard structure and safety conventions for all custom Pi skills in this repository.

---

## 1) Required skill layout

Each skill must use:

```text
<skill-name>/
  SKILL.md
  templates/        (optional)
  references/       (optional)
```

`SKILL.md` is the required entrypoint.

---

## 2) Required `SKILL.md` frontmatter

Every `SKILL.md` must include:

```yaml
---
name: <kebab-case-name>
description: <specific when-to-use description>
---
```

### Naming rules
- lowercase letters, numbers, hyphens only
- no leading/trailing hyphen
- no consecutive hyphens
- keep names short and unique

---

## 3) Required section order in `SKILL.md`

Use this order for consistency:

1. `# <Skill Title>`
2. Purpose/when-to-use
3. Read also (templates/references)
4. Non-negotiable safety policy
5. Mandatory intake questions
6. `## Standard workflow`
   - Step 0 Preflight
   - Step 1+ task-specific steps
   - Final step: Main output assembly
7. `## Standard output contract (every run)`
8. Domain/style/mode-specific sections

---

## 4) Standard output contract (mandatory)

Every skill should output in this order:

1. Assumptions
2. Missing info
3. Risks
4. Main output(s)
5. Evidence/citation/integrity flags
6. Next actions for user

---

## 5) Integrity tag vocabulary (mandatory)

Use exact tags:

- `[EVIDENCE NEEDED: <claim>]`
- `[REFERENCE NEEDED: <claim>]`
- `[VERIFY DETAIL: <statement>]`

Do not invent alternate tag formats.

---

## 6) Safety rules (mandatory)

Across all skills:

1. Never fabricate citations.
2. Never fabricate numeric results, experiment outcomes, or hardware specs.
3. If key info is missing, ask targeted follow-up questions (up to 5), then proceed with explicit placeholders.
4. Keep claims proportional to available evidence.

---

## 7) Writing style conventions for skill instructions

- Be specific and operational.
- Prefer checklists and step-wise instructions.
- Keep tone concise, neutral, and non-hype.
- Separate policy (must) from guidance (should).

---

## 8) Template and reference conventions

- Put reusable forms under `templates/`.
- Put explanatory guides under `references/`.
- Use relative links from `SKILL.md`.
- Keep templates minimal and copy/paste-ready.

---

## 9) Change management

When editing a skill, verify:

- section order still matches this convention
- output contract unchanged
- integrity tags unchanged
- safety policy still present

If a deliberate deviation is needed, document it in the skill file under a short **Deviation note** section.
