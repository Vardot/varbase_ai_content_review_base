[![Varbase](https://raw.githubusercontent.com/Vardot/varbase/11.0.x/images/varbase-logo.png)](https://www.drupal.org/project/varbase)

# Varbase AI Content Review Base
[![Varbase AI Content Review Base](https://img.shields.io/badge/Varbase%20AI%20Content%20Review%20Base-1.0.x--dev-0d6efc?labelColor=001d38&style=flat-square)](https://www.drupal.org/project/varbase_ai_content_review_base)

An **opt-in** Drupal recipe that adds AI content review to a Varbase 11 site, with
[AI Content Review](https://www.drupal.org/project/ai_content_review). An editor opens the **Review** tab of any
content item and runs a review. Each criterion comes back with a 0 to 100 score, a pass, warning or fail verdict,
an explanation that quotes the content, and suggestions. Reviews are kept as history, with a queue and a records
report.

It works the same on **Varbase Starter, Educare, Horizon Aid and The Rightup**: the review rule covers every
content type, so it never names a site template's bundles.

**Experimental.** AI Content Review has no stable release (1.0.0-alpha3 when this was written), so it is not covered by the Drupal
security advisory policy. There is **no custom PHP and no custom shell code** in the recipe. Its no-key checks run inline in CI,
so the repository holds no PHP file at all.

## What it adds

| Part | What it does |
|---|---|
| Modules | Installs `ai`, `ai_agents` and `ai_content_review`. |
| Four review agents | Editorial Quality, Brand Voice Compliance, Prohibited Terminology and Audience Alignment. Each reads the content item with the AI Agents entity tool and must report through AI Content Review's result tool, which the module requires. |
| Rule `varbase_editorial_review` | "Editorial review": the four agents as criteria, passing at 70 and warning at 50, on every content type (`bundles: []`). |
| Permissions | Content editor: run reviews, view records. Content admin and Site admin: also configure reviews, run batch reviews, view history and the queue. |

### Your style guide, through AI Context

The agents read the site's own guidance from [AI Context](https://www.drupal.org/project/ai_context) when it
exists: **Brand Voice & Tone** (the Do and Don't rules), **Approved Terminology & Vocabulary** and **Audience
Personas**, the context items Varbase AI Context ships. Without them the agents fall back to sensible general
rules: a clear, professional voice, flagging only clearly inappropriate terms, and a general non-specialist
visitor. Change the style guide in AI Context, not in the agents.

## Requirements

- Drupal core `^11.4`, Varbase 11, with Varbase's editorial roles (`content_editor`, `content_admin`, `site_admin`)
- [`drupal/ai`](https://www.drupal.org/project/ai) `^1.4` and [`drupal/ai_agents`](https://www.drupal.org/project/ai_agents) `^1.3`
- [`drupal/ai_content_review`](https://www.drupal.org/project/ai_content_review) `^1.0@alpha`
- [`drupal/entity`](https://www.drupal.org/project/entity) `^1.6`
- A default chat model that supports tools (Configuration > AI > AI settings), as Varbase AI Base sets up

## Install and apply

```bash
# 1. Fetch the recipe.
ddev composer config --json extra.drupal-recipe-unpack.ignore '["drupal/varbase_ai_content_review_base"]'
ddev composer require drupal/varbase_ai_content_review_base:1.0.x-dev

# 2. Apply it.
ddev drush recipe ../recipes/varbase_ai_content_review_base
ddev drush cr

# 3. Check it. Without arguments no AI key is needed. "review <nid>" runs one real review (one model call per
#    criterion).
```

Re-applying the recipe is safe. The ignore line keeps the recipe a locked package: without it core's
recipe-unpack plugin moves its requirements into the project's `composer.json` and drops the recipe itself.

Then open any content item and its **Review** tab, or the rules at
Administration > AI > Tools & Automation > AI Content Review.

## What it does not include

The client demo this recipe was generalised from also had a custom module, which a recipe cannot
ship:

- three non-AI criteria: structural, accessibility and SEO validation;
- an ECA action that reviews a content item automatically when it is sent to review.

Without them, reviews run on demand from the Review tab, or in batch from the queue. Automatic review on a workflow
transition needs an ECA action that AI Content Review does not provide yet.

## Automated testing

GitLab CI on [git.drupalcode.org](https://git.drupalcode.org/project/varbase_ai_content_review_base) (`.gitlab-ci.yml`) runs on every merge
request and every push to `1.0.x`, like the other Varbase AI recipes: `composer validate` and a lint of every YAML
file.

The functional tests in `tests/features` (Playwright and Cucumber through
[`@vardot/varbase-e2e`](https://www.npmjs.com/package/@vardot/varbase-e2e)) run against a site of your own:
`yarn install`, then `LAUNCH_URL=https://your-site.ddev.site yarn test`.

## Checked

Applied by hand on 11 October 2026 to a fresh build of each Vardot site template in the workspace, on Drupal 11.4.9,
AI 1.5.0, AI Agents 1.3.5 and AI Content Review 1.0.0-alpha3. On every one the recipe applied, applied again cleanly,
and the recipe check passed, including that the rule reaches every content type:

| Site template | Theme | Content types the rule reaches |
|---|---|---|
| Varbase Starter 1.0.5 | Vartheme BS5 | blog, page |
| Educare | Vartheme BS5 Educare 1.0.2 | event, news, page, program |
| Horizon Aid | Vartheme BS5 Horizon Aid 1.0.5 | blog, country, event, page, program |
| The Rightup | Vartheme BS5 Rightup 1.0.4 | news, page, podcast, podcast_episode |

On Varbase Starter the **Review** tab of a content item lists the four criteria of the Editorial review rule, and the
rules and queue pages load. No review was run against a live model: that needs the site's own AI provider key.

## Known issues

- **AI Content Review 1.0.0-alpha1** (not re-checked on alpha3) saves a stale "changed" timestamp after **Apply suggestion**, so the next save
  of the edit form can fail with "The content has either been modified by another user". A client project
  carries a local patch for it; it is not in `vardot/varbase-patches`.
- Re-running a review of an unchanged item can answer **HTTP 409**: AI Content Review skips input it has already
  reviewed (it hashes the input). The meaning is to be confirmed with the module maintainers.
- Every review is one model call per criterion, four per content item.

## Related recipes

| Recipe | What it does |
|---|---|
| [Varbase AI Search Base](https://www.drupal.org/project/varbase_ai_search_base) | A vector index of the site's content. |
| [Varbase AI Answers Base](https://www.drupal.org/project/varbase_ai_answers_base) | Ask AI: cited answers over that index. |
| [Varbase AI Chatbot Base](https://www.drupal.org/project/varbase_ai_chatbot_base) | A visitor chatbot over that index. |

## License

GPL-2.0-or-later. See [LICENSE](LICENSE). Maintained by [Vardot](https://www.vardot.com).
