# Changelog

All notable changes to the Varbase AI Content Review Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2026-10-12
### Changed
- Removed `tests/verify.php`: the repository now holds no PHP file. CI runs the same no-key checks inline
  (`drush php:eval` in `.github/workflows/ci.yml`), and the lint job fails on any `.php`, `.module`, `.install` or
  `.inc` file (#3).

### Checked
- CI on 1.0.x (https://github.com/Vardot/varbase_ai_content_review_base/actions/runs/38238506166): the lint job found no PHP file, the recipe applied twice, the inline
  check printed `RESULT: PASS` and the functional tests passed.

## [1.0.0] - 2026-10-11
### Added
- The recipe: AI Content Review set up for any Varbase site, generalised from a client demo.
  - Four review agents: Editorial Quality Reviewer, Brand Voice Compliance, Prohibited Terminology and Audience
    Alignment. Each must report through the `content_review_result` tool, may add suggestions, and reads the
    content item it reviews. None carries a client's brand, terms or audience: they use the site's AI Context
    guidance when it has some.
  - One review rule, "Editorial review", that runs the four agents on **every** content type (`bundles: []`), so it
    works on any site template without naming its bundles. It passes at 70 and warns at 50.
  - Permissions: content editors run reviews and see the records; content and site admins also configure the
    rules, run batch reviews and see the history and the queue.
- `tests/verify.php`: checks the modules, each agent and its tools, the rule and its criteria, that the rule reaches
  every content type on the site, and the role permissions, with no AI key. With `review <nid>` it also runs a
  real review of one item.
- GitHub Actions CI: lint, then a real Varbase 11 site (`drupal/varbase_project` `11.0.x-dev` with Varbase's
  curated patches, installed from Varbase Starter) on MariaDB 11.8. It applies the recipe twice, runs
  `tests/verify.php`, then serves the site and runs the functional tests in `tests/features` (Playwright and
  Cucumber through `@vardot/varbase-e2e`, in Chromium).
- README, `AGENTS.md`, `LICENSE`, `logo.png`, composer metadata, and the Vardot issue and pull request templates.

### Checked
- Applied twice, with `tests/verify.php` passing, on fresh builds of Varbase Starter, Educare, Horizon Aid and The
  Rightup (Drupal 11.4.9, AI Content Review 1.0.0-alpha3). See the README for the content types on each.

[Unreleased]: https://github.com/Vardot/varbase_ai_content_review_base/compare/1.0.1...1.0.x
[1.0.1]: https://github.com/Vardot/varbase_ai_content_review_base/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/Vardot/varbase_ai_content_review_base/releases/tag/1.0.0
