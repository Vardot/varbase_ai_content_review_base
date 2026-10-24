# AGENTS.md

Guidance for AI coding agents working on the Varbase AI Content Review Base recipe.

This is a drupal.org project: [drupal.org/project/varbase_ai_content_review_base](https://www.drupal.org/project/varbase_ai_content_review_base).
Issues live in its [issue queue](https://www.drupal.org/project/issues/varbase_ai_content_review_base) and merge requests on
[git.drupalcode.org](https://git.drupalcode.org/project/varbase_ai_content_review_base). Its default branch is `1.0.x`; the
GitHub repository is a mirror and takes no issues or pull requests.

## Before you start

- **`CHANGELOG.md`**: what changed in each release, newest first, and which site templates it was checked on.
- **Issues and merge requests** on [drupal.org](https://www.drupal.org/project/issues/varbase_ai_content_review_base).
- **`README.md`**: what the recipe adds, what it deliberately leaves out, and the known issues in AI Content Review.

## When you make a change

- One drupal.org issue and one issue-fork merge request per change, titled `<type>: #<issue> Summary`. The MR
  description ends with the Checkpoints list from `.gitlab/merge_request_templates/default.md`.
- CI must be green before merging: `.gitlab-ci.yml` on git.drupalcode.org validates `composer.json` and lints
  every YAML file.
- No PHP in the repository at all: no `.php`, `.module`, `.install` or `.inc` file.
- All configuration lives in `recipe.yml` and the recipe's own `config/`, never in `config/install` or `config/optional`.
- Add an entry under `## [Unreleased]` in `CHANGELOG.md`.
- Keep the rule on every content type (`bundles: []`). Naming bundles breaks it on one site template or another.
- Keep the agents free of any client's brand, terms or audience. The site's own style guide belongs in AI Context.
- Never bump the version or tag a release without explicit maintainer approval. Tags are three-segment (`1.0.0`)
  and are never moved once pushed.
