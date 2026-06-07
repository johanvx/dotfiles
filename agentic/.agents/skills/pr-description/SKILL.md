---
name: pr-description
description: Writes pull request descriptions (GitHub, GitLab, Bitbucket, etc.). Use when the user asks to "write a PR description", "draft a PR body", "open a PR", "fill in the PR template", or any equivalent.
---

# PR Description

Use this skill when the user wants to write a pull request description. Works with GitHub, GitLab, Bitbucket, and other platforms.

## Read also

- [Template](templates/pr-description.md) — skeleton to fill in
- [Linux Kernel: Describe Your Changes](references/linux-kernel-describe-changes.md) — problem-first, quantify trade-offs, imperative mood
- [Microsoft APM PR Insights](references/ms-apm-pr-insights.md) — concision targets, GFM features, anti-patterns

---

## Non-negotiable safety policy

Must:

1. Never fabricate citations, references, or links.
2. Never fabricate numeric results, experiment outcomes, or hardware specs.
3. If key info is missing, ask up to 5 targeted questions, then proceed with explicit placeholders.
4. Keep claims proportional to evidence.
5. Never add footers (`Cc:`, `Acked-by:`, `Signed-off-by:`, etc.) unless the user explicitly requests them.
6. Never overwrite an existing PR description without explicit user confirmation.

---

## Mandatory intake questions

Ask before drafting (unless already answered by context):

1. **Base branch**: What is the target branch? (usually `main` or `master`)
2. **Linked issue**: Does this PR close or reference an issue?
3. **Testing**: How was this change tested? Any commands to reproduce?
4. **Trade-offs**: Any rejected alternatives or non-obvious decisions?
5. **Special notes**: Anything the reviewer should know first?

---

## Standard workflow

### Step 0. Preflight

- Confirm we are in a git repository.
- Identify the base branch (ask if unclear).
- Gather raw inputs:
  - `git rev-parse --abbrev-ref HEAD` (feature branch)
  - `git log --oneline <base>..HEAD` (commit history)
  - `git diff --stat <base>..HEAD` (files changed)
  - `git diff <base>..HEAD` (full diff)
- Check for linked issues in commit messages or ask the user.

### Step 1. Analyse the diff

- Identify the single logical change (or group of related changes).
- For each changed file, note: what changed and why.
- Identify new files, deleted files, behaviour changes at boundaries.
- **Large PR check**: If the diff touches many unrelated concerns or is unusually large:
  - Warn the user and propose splitting:
    > This PR is large and covers multiple concerns. Consider
    > splitting into separate PRs for clearer review.
  - Suggest concrete steps:
    1. Rearrange commits into logical groups
    2. Create branches from the PR base for each group
    3. Identify PR dependencies (which PR must merge first)
    4. Create PRs sequentially in dependency order
  - **Still write the PR description** even if splitting is suggested.
    Some projects prefer large PRs to keep related changes in one
    reviewable context. Be clear and concise, but don't miss
    necessary information.

### Step 2. Draft the PR description

Use the [template](templates/pr-description.md) as a skeleton. Fill in:

1. **Title**: imperative summary, max 72 chars (e.g. "fix: correct off-by-one in pagination")
2. **TL;DR**: 2-4 sentences. State what changed and why.
3. **Problem**: Describe the problem this PR solves.
   - User-visible impact (crashes, regressions, UX issues)
   - Quantify if possible (latency, memory, error rate)
   - Max 6 bullets
4. **Approach**: High-level solution in plain English.
   - Key design decisions
   - Why this approach over alternatives
5. **Implementation**: One short paragraph per file, or a table.
   - Focus on intent and risk — do not restate the diff line-by-line
6. **Trade-offs**: Explicitly state non-obvious decisions.
   - Rejected alternatives and why
   - Expected downsides
   - 3-5 bullets (1-2 if mechanical)
7. **Validation**: How was this tested?
   - Paste real command output, not narration
   - Use `<details>` for long output
8. **How to test**: Max 5 numbered steps for the reviewer.
9. **Linked issues**: Reference with `Closes #123` or `Refs #456`.

### Step 3. Concision pass

- Target 150-220 lines. 300+ is a smell.
- Cut any sentence that does not change the reviewer's understanding.
- Move long evidence into `<details>` collapsible sections.
- Ensure prose is wrapped at ~72 chars where practical.

### Step 4. Assisted-by check

- If AI tools (including this agent) contributed to the code changes, ask the user:
  > AI tools were used in this change. Should I add an `Assisted-by`
  > tag to the PR description?
- Format per [Linux Kernel: Coding Assistants](https://docs.kernel.org/process/coding-assistants.html):
  ```
  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
  ```
  - `AGENT_NAME:MODEL_VERSION` — e.g. `MiMo:mimo-v2.5-pro`
  - `[TOOL1] [TOOL2]` — optional specialized tools (e.g. coccinelle, clang-tidy)
  - Do not list basic dev tools (git, gcc, make, editors)
- Show the user what the tag would look like before adding.
- Only add the tag if the user confirms.

### Step 5. Main output assembly

Present the completed PR description per the output contract below.

---

## Standard output contract (every run)

1. **Assumptions**
2. **Missing info**
3. **Risks**
   - If the PR covers multiple unrelated changes, flag it
   - If the diff is too large for a single PR, suggest splitting (but still write the description)
4. **Main output(s)**
   - Write the PR description to a file in `tmp/` (e.g. `tmp/pr-description.md`)
   - The file is ready to paste into any PR platform or use with CLI tools:
     - GitHub: `gh pr create --body-file tmp/pr-description.md`
     - GitLab: `glab mr create --description < tmp/pr-description.md`
     - Bitbucket: copy-paste from file
5. **Evidence/citation/integrity flags**
   - `[EVIDENCE NEEDED: <claim>]`
   - `[REFERENCE NEEDED: <claim>]`
   - `[VERIFY DETAIL: <statement>]`
6. **Next actions for user**

---

## Writing style constraints

- **Imperative mood**: "fix the race condition" not "this PR fixes the race condition"
- **Problem-first**: Describe the problem before the solution
- **Quantify trade-offs**: Numbers beat adjectives ("reduces latency by 40%" not "significantly faster")
- **Self-contained**: A reviewer should form an opinion without opening other docs
- **No marketing tone**: Avoid "significantly enhances", "best-in-class", "great improvement"
- **No self-congratulation**: The work speaks for itself
- **Prose wrapping**: Wrap body text at ~72 chars where practical

## Diagram format guidance

If images (mermaid, flowcharts, architecture diagrams) are necessary:

- **Use BOTH ASCII art AND placeholder**, not either/or:
  - ASCII art gives the reviewer an immediate inline reference
  - Placeholder with alt-text signals where the user should add a proper image (screenshot, rendered diagram, etc.)
- Some content (screenshots, UI mockups, complex architecture) cannot be adequately described with ASCII art alone — always include a placeholder for the user to add the real image.

Example:

  ```markdown
  ### Service architecture

  ```
  ┌─────────┐     ┌─────────┐     ┌─────────┐
  │ Client  │────▶│ Gateway │────▶│  DB     │
  └─────────┘     └─────────┘     └─────────┘
  ```

  ![Architecture diagram: client sends request to gateway, gateway queries DB and returns response]()
  ```

- Do not use mermaid or other diagram languages unless the project already uses them.

## Anti-patterns (refuse these)

- Pasting commit messages as the body (commit messages are inputs, not output)
- Restating the diff line-by-line
- Marketing tone or self-congratulation
- Adding footers without explicit user request
- Quoting docs out of context
- Skipping Problem or Validation sections because "the PR is small"

## Deviation note

None.
