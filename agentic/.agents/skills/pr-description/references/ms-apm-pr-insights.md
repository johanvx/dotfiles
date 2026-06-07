# Microsoft APM PR Description Skill — Key Insights

Source: [microsoft/apm](https://github.com/microsoft/apm/tree/fef942a2b0125c540b97d4b16fbe3d564fceef86/.agents/skills/pr-description-skill)

## Core Principles

1. **Self-sufficient body.** A reviewer must be able to read the PR body and form an opinion without opening any other doc, issue, or chat.

2. **Anchored claims.** Every WHY-claim cites a source inline. If you cannot anchor a claim, drop it or soften to a tradeoff statement.

3. **Cite-or-omit.** Never invent justification.

4. **Trade-offs explicit.** Address every non-obvious decision (option chosen vs option rejected).

5. **Single artifact, no fluff.** One markdown file. No marketing tone, no self-congratulation.

## Concision Targets

- **150-220 lines** for a typical PR body
- **300+ lines is a smell, not a virtue**
- If draft exceeds 250 lines, run a tightening pass

## Section Ceilings

| Section | Ceiling |
|---------|---------|
| TL;DR | 2-4 sentences |
| Problem (WHY) | max 6 bullets |
| Approach (WHAT) | table or 3-7 bullets |
| Implementation (HOW) | one short paragraph per file, or a table |
| Trade-offs | 3-5 bullets (1-2 if mechanical) |
| How to test | max 5 numbered steps |

## Anti-patterns to Avoid

- Pasting commit messages as the body (commit messages are inputs, not output)
- Marketing tone or self-congratulation
- Restating the diff line-by-line
- Quoting a doc out of context
- A doc-only PR still needs TL;DR, Problem, Validation, and How-to-test
- Long evidence should be in collapsible sections

## GFM Features to Use

- **Alerts** for high-signal callouts: `> [!NOTE]`, `> [!TIP]`, `> [!IMPORTANT]`, `> [!WARNING]`, `> [!CAUTION]`
- **Collapsible sections** for long diffs, full validation output:
  ```html
  <details><summary>Title</summary>
  ...content...
  </details>
  ```
- **Task lists** for "How to test" sections: `- [ ] step`
- **Tables** for structured comparisons
