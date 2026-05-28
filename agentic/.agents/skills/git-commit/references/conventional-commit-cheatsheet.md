# Conventional Commit Cheatsheet

## Format

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Common types

- `feat`: new feature
- `fix`: bug fix
- `docs`: documentation only
- `style`: formatting/style only (no logic change)
- `refactor`: internal code change without feature/fix
- `perf`: performance improvement
- `test`: tests added/updated
- `build`: build/dependency/tooling changes
- `ci`: CI pipeline/config changes
- `chore`: maintenance work
- `revert`: revert previous commit

## Scope guidance

- Use scope when it adds clarity (`api`, `auth`, `ui`, `deps`, `docs`).
- Omit scope if uncertain.

## Description guidance

- Imperative mood: `add`, `fix`, `refactor`.
- Keep concise; prefer under 72 chars.
- Be specific: avoid vague text like `update stuff`.

## Breaking changes

Use either (or both):

- `feat(api)!: remove v1 endpoint`
- Footer:

```text
BREAKING CHANGE: v1 endpoint removed; use /v2/... instead.
```

## Footer examples

- `Closes #123`
- `Refs #456`
- `Co-authored-by: Name <email@example.com>`
