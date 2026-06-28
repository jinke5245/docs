# AGENTS.md

This repository is a personal knowledge system. Treat `README.md` as the source
of truth for its positioning, structure, workflow, and OKF usage.

## Principles

- Preserve the original intent, context, and personal voice of notes.
- Read nearby context before editing.
- Make the smallest useful change; avoid unrelated cleanup or restructuring.
- Ask before deleting, moving, or reorganizing private or unpublished material.
- Never expose secrets, account details, contact information, or sensitive notes.
- Keep generated output, caches, temporary files, and local agent state out of
  version control.

## Writing

- Use Chinese for note content by default unless the user or context calls for
  another language.
- Prefer English file names for new files.
- Use clear Markdown: concise headings, short lists, useful links.
- Preserve existing frontmatter, tags, Obsidian links, embeds, and properties
  unless the request requires changing them.
- Prefer standard Markdown links when they are sufficient.
- Store attachments and embedded media under `assets/`.

## Knowledge Packages

For stable topics that become knowledge packages, follow Google's Open Knowledge
Format conventions:

- Treat the package as a directory tree of related concepts.
- Treat ordinary Markdown files as concept documents.
- Reserve `index.md` for package or directory indexes.
- Reserve `log.md` for update history.
- Give concept documents YAML frontmatter with a non-empty `type`.

Do not retrofit OKF structure onto unrelated notes unless asked.

## Knowledge Operations

Use these modes when the user asks an agent to maintain or inspect the PKS.

### Ingest

- Preserve source material; do not overwrite the original capture.
- Decide the target first: `inbox/`, `projects/`, `notes/`, `libraries/`, or an
  explicit knowledge package.
- Extract key ideas, terms, questions, and reusable conclusions.
- Update existing notes before creating duplicate concept pages.
- For OKF packages, update `index.md`, `log.md`, and concept `type` fields when
  relevant.
- Report changed files, source links, and remaining uncertainties.

### Query

- Treat query work as read-only unless the user asks to persist the result.
- Scope the search before answering: whole vault, directory, project, package, or
  specific files.
- Prefer indexes, MOCs, package `index.md`, related notes, and source material in
  that order.
- Distinguish recorded knowledge, agent inference, and gaps.
- Link to local files or external sources that support the answer.
- Ask before turning an answer into a new note or package update.

### Health Check

- Produce a report before editing unless the user asks for fixes directly.
- Check for orphan notes, duplicate concepts, stale conclusions, missing sources,
  broken links, attachment issues, and sensitive material.
- For OKF packages, check for `index.md`, `log.md`, concept boundaries, and
  non-empty concept `type` fields.
- Recommend small, reviewable fixes before broad migrations.
- Do not reorganize private or unpublished material without approval.

## Checks

- Use Node.js 22 and PNPM.
- Use `pnpm check` for broad validation.
- For small Markdown edits, prefer targeted checks such as
  `pnpm lint:markdown`, `pnpm lint:spelling`, `pnpm lint:secret`, or
  `pnpm format:check`.
- If a relevant check is skipped, say why.
