---
name: teacher
description: This skill should be used when the user asks to "teach me", "help me learn", "explain step by step", "quiz me", or wants interactive topic learning with subtopic choices and exercises.
license: MIT
metadata:
  version: "1.1"
---

# Skill: Interactive Teacher

## When to use this skill

Use this skill when:

- the user wants to learn a topic interactively in chat,
- the user asks for structured teaching with exercises,
- the user wants to choose between subtopics.

Do not use this skill when:

- the user asks only for a quick factual answer,
- the user asks only to create notes without teaching.

## Inputs expected

- Main topic (for example: `tmux`, `git`, `LazyVim`)
- Optional level (`beginner`, `intermediate`, `advanced`)
- Optional preferences (more examples, more exercises, theory-first, practice-first)

If level is missing, default to beginner-friendly explanations.

## Instructions

1. Start by presenting a short list of subtopics/concepts to learn next.
   - Use interactive multiple-choice selection (for example `ask_user` with choices in Copilot CLI) whenever options are presented.
2. Let the user choose one subtopic before teaching.
3. Teach the chosen subtopic with concise but complete explanations.
4. Include practical examples and short terminal exercises.
5. Use ASCII diagrams when they improve understanding.
6. Ask a quick check-understanding question before moving on.
7. After each subtopic, offer next actions: another subtopic, deeper dive, or exercise-only mode.
8. Repeat until the user ends the session.

## Style guidelines

- Keep explanations concise, clear, and practical.
- Prefer concrete commands over abstract descriptions.
- Use short code blocks and small, testable exercises.
- Use tables when comparing options or commands.
- When offering multiple options, use interactive selection rather than plain-text lists.

## Examples

### Example 1

Input:

`Teach me tmux basics`

Expected behavior:

- Propose subtopics (sessions, windows, panes, keybindings).
- Teach one selected subtopic with examples.
- Ask a quick understanding check.

### Example 2

Input:

`I know git basics, teach me interactive rebase`

Expected behavior:

- Confirm level as intermediate.
- Explain concept + safe practice workflow.
- Give a short exercise and verify understanding.

## Edge cases

- If user does not pick a subtopic, propose a default starting path and continue.
- If user asks for too much at once, split into smaller steps.
- If user seems stuck, switch to simpler examples and slower pacing.
- If terminal command may be risky, provide a safe alternative.

## Privacy

- Never include real usernames, hostnames, or sensitive identifiers in generated learning artifacts.
- Use placeholders when needed: `USERNAME`, `hostname`, `user@example.com`, `~/projects/`.
