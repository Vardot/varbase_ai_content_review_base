---
name: varbase-ai-content-review
description: "Apply, repair and verify Varbase AI Content Review on a Varbase 11 site: the scored AI review of any content item from its Review tab (Varbase AI Content Review Base). Install and apply commands, inputs, config, post-apply steps, browser checks, traps and versions, read from the recipe code. Use when adding, fixing or checking Varbase AI Content Review."
---

# Varbase AI Content Review

Read from `recipe.yml`, `composer.json`, README, CHANGELOG and `git log` at the latest tag, 28 October 2026. Re-check versions on drupal.org before relying on them. For the full Varbase AI apply order, see the Varbase AI recipes docs page.

## Recipes

| Recipe | Latest | Stability | Require |
|---|---|---|---|
| `varbase_ai_content_review_base` | 1.0.0-beta1 | beta | `drupal/varbase_ai_content_review_base:~1` |

Docs (the code wins where they differ):
- https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-content-review-base

## What it does

- Installs `node`, `user`, `ai`, `ai_agents`, `ai_content_review`. Creates four agents (`varbase_ai_content_review_editorial_quality`, `_brand_voice_compliance`, `_prohibited_terminology`, `_audience_alignment`) and rule `ai_content_review.rule.varbase_editorial_review` on every content type; grants `content_editor`, `content_admin`, `site_admin`. Agents read the AI Context items when present.
- Composer: `ai ^1.4`, `ai_agents ^1.3`, `ai_content_review ^1.0@alpha` (1.0.0-alpha3), `entity ^1.6`. No inputs. Applied by Varbase AI Base.

## Apply

All commands in DDEV, from the project root; recipes are applied from the docroot path `../recipes/<name>`. Take a snapshot first: `ddev snapshot --name before-varbase-ai-content-review`. Add each recipe to `extra.drupal-recipe-unpack.ignore` in `composer.json` before requiring it (read the list first: `composer config --json` replaces it).

```bash
ddev composer require drupal/varbase_ai_content_review_base:~1
ddev drush cr
ddev drush recipe ../recipes/varbase_ai_content_review_base -y
ddev drush cr
```

## After the apply

- Canvas pages: `ai_content_review` 1.0.0-alpha3 gives the agents only the page's metadata, not its rendered text. Apply a patch that adds the rendered page text to the review context (none merged upstream as of 28 Oct 2026; the project has 11 open MRs).

## Verify

- As an editor, open a content item's Review tab, run a review: a 0 to 100 score per criterion, a verdict, an explanation and suggestions.
- A Canvas page review quotes text from the page body (proves the patch).

Test as a real editor or visitor, not user 1: a superuser bypasses permissions.

## Traps

- HTTP 409 when reviewing an unchanged item again.
- Needs a tools-capable default chat model.

## History

Started 22 Oct 2026, 1.0.0-alpha1 24 Oct, 1.0.0-beta1 27 Oct (functional tests #3633134).
