---
name: note-taker
description: This skill should be used when the user asks to "save notes", "create a summary file", "write session notes", or "document what we covered" after a learning session.
license: MIT
metadata:
  version: "1.1"
---

# Skill: Note Taker

## When to use this skill

Use this skill when:

- the user explicitly asks to save or create notes/summary file,
- a learning session has content that should be persisted.

Do not use this skill when:

- the user did not ask for file creation,
- the request is only about live teaching with no persistence.

## Inputs expected

- Topic folder (for example: `tmux`, `git`, `LazyVim`)
- File name (for example: `basics.md`, without numeric prefix)
- Session scope (what was covered)

If filename is missing, infer a short descriptive name in English without numeric prefix.

## Notes structure

Save notes under:

`~/Documents/Notes/<topic>/<name>.md`

Example:

`~/Documents/Notes/tmux/basics.md`

## Instructions

1. Confirm there is an explicit user request to create notes.
2. Determine topic and summary filename.
3. Ensure target topic directory exists under `~/Documents/Notes/`.
4. Write the summary file in English.
5. Follow the required output format exactly.
6. Keep notes concise, accurate, and practical.
7. Do not create note files proactively; create or update them only after an explicit user request.

## Output format

Use this structure in every note file:

~~~markdown
# <Topic>: <Subtopic or Session Title>

## What we covered
- ...

## Key commands
```bash
# command examples used during the session
```

## Examples practiced
- ...

## Common mistakes
- ...

## Next steps
- ...
~~~

## Examples

### Example 1

Input:

`Create a summary file for today's tmux basics session`

Expected output file:

`~/Documents/Notes/tmux/basics.md`

### Example 2

Input:

`Save notes from our git rebase lesson`

Expected behavior:

- Create file under `~/Documents/Notes/git/`
- Use an English filename without numeric prefix
- Apply the output template

## Edge cases

- Missing topic: infer from session context before writing.
- Existing file with same name: update intentionally or create a clearer non-numbered name.
- Partial session: include only covered material, avoid invented content.
- User asks for live teaching only: continue teaching and do not create files.

## Privacy

- Never include real filesystem paths, usernames, or hostnames in notes.
- Replace sensitive values with placeholders: `~/projects/`, `USERNAME`, `hostname`, `user@example.com`.
