# Varbase functional testing suite

Playwright and Cucumber through [`@vardot/varbase-e2e`](https://www.npmjs.com/package/@vardot/varbase-e2e), on a
Varbase 11 site with this recipe applied.

| Feature | Covers |
| --- | --- |
| `01-01-ai-content-review-base-review-tab.feature` | An editor saves a post, finds the four review criteria on its AI Review tab, runs the editorial quality review and gets the result |
| `01-02-ai-content-review-base-access.feature` | Who opens the AI Review tab, who manages the rules and the queue, and who gets Access denied |
| `01-03-ai-content-review-base-accessibility.feature` | The AI Review tab gives every field a label and every link a name |

## Run it

```bash
npm install
LAUNCH_URL=https://your-site.ddev.site npm test
```

The site needs the webmaster (`webmaster`) and one user per role, named after the role (`content_editor`,
`content_admin`, `seo_admin`, `site_admin`), all with the password in `LOGIN_PASS` (default `dD.123123ddd`).
`.gitlab-ci.yml` shows the whole setup.

## AI provider

CI applies Drupal CMS AI before the recipe. It sets up an amazee.ai trial as the default provider, so no key
is needed and reviews run on a real model. One review took about 12 seconds on a local site; the scenario
waits up to 10 seconds for the request and then checks for the result for up to 10 more.
