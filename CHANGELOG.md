# Changelog

All notable changes to the Varbase AI Content Review Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2026-11-25
### Changed
- Use caret constraints and allow Drupal 11.4 and later and Drupal 12 in Varbase AI Content Review Base ([#3637929](https://git.drupalcode.org/project/varbase_ai_content_review_base/-/work_items/3637929)).
- Update the version badge to `1.0.1` in `README.md`.

## [1.0.0] - 2026-11-23
### Changed
- Change the default PHP version to PHP 8.5 in the GitLab CI ([#3637926](https://www.drupal.org/i/3637926)).
- Update the version badge to `1.0.0` in `README.md`.

## [1.0.0-rc1] - 2026-11-13
### Added
- A Claude Code agent and skill for applying and verifying Varbase AI Content Review ([#3633896](https://www.drupal.org/i/3633896)).

### Changed
- Update Node.js to `>= 24.0` in `package.json` and the GitLab CI ([#3635705](https://www.drupal.org/i/3635705)).
- Disable Drupal CMS telemetry in CI with `DRUPAL_CMS_TELEMETRY=0` ([#3633847](https://www.drupal.org/i/3633847)).
- Update the version badge to `1.0.0-rc1` in `README.md`.

## [1.0.0-beta1] - 2026-10-27
### Added
- Automated functional acceptance tests for AI content review and accessibility, run in CI on a fresh Varbase 11 site ([#3633134](https://www.drupal.org/i/3633134)).

### Changed
- Move the documentation to docs.varbase.vardot.com ([#3633030](https://www.drupal.org/i/3633030)).
- Install the Varbase Starter dev line in CI, which carries the search view fix for Drupal CMS Search 2.2.7.
- Update the version badge to `1.0.0-beta1` in `README.md`.

## [1.0.0-alpha1] - 2026-10-24
### Added
- Initialize Varbase AI Content Review Base recipe ([#3632427](https://www.drupal.org/i/3632427)).
### Removed
- The GitHub Actions workflows and the `.github` templates: CI runs on git.drupalcode.org.

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/compare/1.0.1...1.0.x
[1.0.1]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/compare/1.0.0...1.0.1
[1.0.0]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/compare/1.0.0-rc1...1.0.0
[1.0.0-rc1]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/compare/1.0.0-beta1...1.0.0-rc1
[1.0.0-beta1]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/compare/1.0.0-alpha1...1.0.0-beta1
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_content_review_base/-/tags/1.0.0-alpha1
