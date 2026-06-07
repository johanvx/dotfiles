---
name: commit-writer
description: Use when the user asks to create a git commit (including "/commit"). Analyze real repo changes, stage safely, generate a Conventional Commit message, and commit.
---

# Git Commit with Conventional Commits

Use when the user wants a commit created in the current repo.

## Read also

- `references/conventional-commit-cheatsheet.md`
- Conventional Commits: https://www.conventionalcommits.org/

## Non-negotiable safety policy

Must:

1. Never fabricate citations.
2. Never fabricate numeric results, experiment outcomes, or hardware specs.
3. If key info is missing, ask up to 5 targeted questions, then proceed with explicit placeholders.
4. Keep claims proportional to evidence.
5. Never commit secrets/sensitive files (`.env`, keys, tokens, credentials, private certs).
6. Never run destructive git operations unless explicitly requested.
7. Never bypass hooks (`--no-verify`) unless explicitly requested.
8. Never modify git config in this skill.

## Mandatory intake questions

Ask before committing (unless already answered):

1. Commit all relevant changes, or only specific files/hunks?
2. Use existing staging, or should I stage for you?
3. Any preferred type/scope/description, or auto-detect?
4. Is this a breaking change?
5. Add issue footer (e.g., `Closes #123`)?

## Standard workflow

### Step 0. Preflight

- Run:
  - `git rev-parse --is-inside-work-tree`
  - `git status --porcelain`
- If no staged/unstaged changes: stop and report no-op.
- Check candidate files for obvious secrets.

### Step 1. Inspect actual changes

- If staged exists: `git diff --staged`
- Else: `git diff`
- Identify change intent and affected scope.

### Step 2. Build staging plan

- Stage only the intended logical change.
- Use `git mv` to move/rename files already tracked by git.
- Commands:
  - `git add <file...>`
  - `git add -p`
  - `git mv <old> <new>`
- Verify staged set: `git diff --staged --name-only`

### Step 3. Generate conventional commit message

Format:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Rules:

- Type: `feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert`
- Scope: detect the project's convention by inspecting recent history:
  `git log --oneline -20` and `git log --stat -5`
  (some projects scope by subtree, others by content category —
  follow what the project already does; omit scope if unclear)
- Description: state what changed, not what the thing does —
  avoid re-explaining the tool/feature's own purpose
- **Title** (`<type>[scope]: <description>`): the **entire line** must stay under 50 chars — not just the description part
- Body: wrap at 72 chars; wrap prose at 72 chars
- Only add a body when explaining non-obvious trade-offs
  or design decisions — do not narrate the obvious
- Breaking change:
  - `type(scope)!: description`
  - `BREAKING CHANGE: ...`

### Step 4. Confirm commit payload

Present:

- staged file list
- commit header
- optional body/footer
- uncertainty tags when needed:
  - `[VERIFY DETAIL: <statement>]`
  - `[EVIDENCE NEEDED: <claim>]`
  - `[REFERENCE NEEDED: <claim>]`

Get confirmation unless user explicitly asked for direct execution.

### Step 5. Execute commit

- Single-line: `git commit -m "<type>[scope]: <description>"`
- Multi-line: commit with body/footer safely.
- If hooks fail: report, suggest fixes, do not bypass automatically.

### Step 6. Main output assembly

Return results using the output contract below.

## Standard output contract (every run)

Output in this exact order:

1. **Assumptions**
2. **Missing info**
3. **Risks**
4. **Main output(s)**
   - staging decisions
   - final commit message
   - executed git commands
   - resulting commit hash/status (if committed)
5. **Evidence/citation/integrity flags**
   - `[EVIDENCE NEEDED: <claim>]`
   - `[REFERENCE NEEDED: <claim>]`
   - `[VERIFY DETAIL: <statement>]`
6. **Next actions for user**

## Commit-message quality checklist

- One logical change per commit.
- Imperative present tense (`add`, `fix`, `refactor`).
- Specific header; avoid vague wording.
- Description states *what* was added/changed, not *what it does*.
- Scope matches the project's existing convention (subtree, content category, etc.).
- Body explains only non-obvious trade-offs or design decisions.
- Body prose wrapped at 72 chars.
- Include issue footer when provided.

## Deviation note

None.
