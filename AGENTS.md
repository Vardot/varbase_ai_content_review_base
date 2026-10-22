# AGENTS.md

Guidance for AI coding agents working on the Varbase AI Content Review Base recipe.

This is a **private** recipe on GitHub (`Vardot/varbase_ai_content_review_base`), not a drupal.org project. Issues,
pull requests and CI all live on GitHub.

## Before you start

- **`CHANGELOG.md`**: what changed in each release, newest first, and which site templates it was checked on.
- **Pull requests and issues** on [github.com/Vardot/varbase_ai_content_review_base](https://github.com/Vardot/varbase_ai_content_review_base).
- **`README.md`**: what the recipe adds, what it deliberately leaves out, and the known issues in AI Content Review.

## When you make a change

- One issue and one pull request per change. The PR says `Closes #<issue>` and ends with the Checkpoints list from
  `.github/pull_request_template.md`.
- Add an entry under `## [Unreleased]` in `CHANGELOG.md`.
- CI must be green before merging: `.github/workflows/ci.yml` applies the recipe twice on a real Varbase 11 site
  and runs the no-key recipe check, then the functional tests in `tests/features`.
- Keep the rule on every content type (`bundles: []`). Naming bundles breaks it on one site template or another.
- Keep the agents free of any client's brand, terms or audience. The site's own style guide belongs in AI Context.
- No PHP in the repository at all: no `.php`, `.module`, `.install` or `.inc` file. The no-key checks run inline in
  `.github/workflows/ci.yml` (`drush php:eval`), and the lint job fails on any PHP file.
- Never bump the version or tag a release without explicit maintainer approval. Tags are three-segment (`1.0.0`)
  and are never moved once pushed.
