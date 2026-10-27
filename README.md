[![Varbase](https://raw.githubusercontent.com/Vardot/varbase/11.0.x/images/varbase-logo.png)](https://www.drupal.org/project/varbase)

# Varbase AI Content Review Base
[![Varbase AI Content Review Base](https://img.shields.io/badge/Varbase%20AI%20Content%20Review%20Base-1.0.0--beta1-0d6efc?labelColor=001d38&style=flat-square)](https://www.drupal.org/project/varbase_ai_content_review_base)

An **opt-in** Drupal recipe that adds AI content review to a Varbase 11 site, with
[AI Content Review](https://www.drupal.org/project/ai_content_review). An editor opens the **Review** tab of any
content item and runs a review. Each criterion comes back with a 0 to 100 score, a pass, warning or fail verdict,
an explanation that quotes the content, and suggestions. Reviews are kept as history, with a queue and a records
report.

## Documentation

Read the [Varbase AI Content Review Base documentation](https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-content-review-base) on the Varbase docs site.

## Install and apply

```bash
# 1. Fetch the recipe.
ddev composer config --json extra.drupal-recipe-unpack.ignore '["drupal/varbase_ai_content_review_base"]'
ddev composer require drupal/varbase_ai_content_review_base:~1

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

## Automated testing

GitLab CI on [git.drupalcode.org](https://git.drupalcode.org/project/varbase_ai_content_review_base) (`.gitlab-ci.yml`) builds
a Varbase 11 site, applies this recipe twice and runs the Varbase functional testing suite in `tests/` on it. See
[tests/README.md](tests/README.md) to run it against a site of your own.

## License

GPL-2.0-or-later. See [LICENSE](LICENSE). Maintained by [Vardot](https://www.vardot.com).
