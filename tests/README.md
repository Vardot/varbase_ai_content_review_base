# Varbase functional testing suite

Playwright and Cucumber through [`@vardot/varbase-e2e`](https://www.npmjs.com/package/@vardot/varbase-e2e), on a
Varbase 11 site with this recipe applied.

| Feature | Covers |
| --- | --- |
| `01-01-ai-content-review-base-rule.feature` | The editorial review rule for every content type, enabled, and its four review agents |
| `01-02-ai-content-review-base-review-tab.feature` | An editor writes a blog post, opens AI Review and runs a review |
| `01-03-ai-content-review-base-access.feature` | Editors run reviews; content and site admins also manage rules and the queue; SEO admins and visitors have no access |

## Run it

```bash
npm install
LAUNCH_URL=https://your-site.ddev.site npm test
```

The site needs the webmaster (`webmaster`) and one user per role, named after the role (`content_editor`,
`content_admin`, `seo_admin`, `site_admin`), all with the password in `LOGIN_PASS` (default `dD.123123ddd`).
`.gitlab-ci.yml` shows the whole setup.

## AI provider

The suite needs no AI provider and no key. The `@no-provider` scenario expects a review run on a site without
one to be recorded as Failed. Scenarios tagged `@ai-provider` need a real provider with a chat model that supports
tools (`npm run test:ai-provider`); in CI they run in their own job, only when the project has an
`OPENAI_API_KEY` variable. The access scenarios open the Varbase demo blog post at `/node/2`.
