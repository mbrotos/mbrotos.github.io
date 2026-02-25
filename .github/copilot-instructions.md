# Project Guidelines

## Architecture

Jekyll static site deployed to GitHub Pages at `mbrotos.github.io`. Source is on the `master` branch — pushing to `master` triggers an automatic GitHub Pages build and deploy (no CI workflow file needed).

Key files:
- [`index.md`](../index.md) — main page (layout: `default`)
- [`cohere-explore.md`](../cohere-explore.md) — full-viewport iframe embed (layout: `embed`)
- [`_layouts/default.html`](../_layouts/default.html) — standard site chrome with GitHub Markdown CSS
- [`_layouts/embed.html`](../_layouts/embed.html) — bare layout for full-page iframes (no header/footer)
- [`_config.yml`](../_config.yml) — Jekyll config (`kramdown` markdown)

## Build and Test (Local)

**Ruby requirement:** system Ruby 2.6 (macOS default) does **not** work — native gem extensions fail to compile. Use rbenv Ruby **3.3.10**, which is pinned in `.ruby-version`.

### First-time setup
```bash
rbenv local 3.3.10          # already set via .ruby-version
gem install bundler
bundle install
```

### Serve locally
The shell must have rbenv shims active. Use this exact pattern:

```bash
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH" && eval "$(rbenv init -)" && bundle exec jekyll serve --livereload
```

Site is available at **http://127.0.0.1:4000**. A VS Code task `Jekyll Serve` in `.vscode/tasks.json` wraps this command.

### Port conflicts
If port 4000 or 35729 (livereload) is already in use:
```bash
lsof -ti :4000,:35729 | xargs kill -9
```

## Deployment

Push to `master` → GitHub Pages rebuilds automatically within ~60 seconds. No manual build step.

```bash
git add -A && git commit -m "..." && git push origin master
```

The `_site/` directory is the local build output — it is **not** committed; GitHub Pages builds from source.

## Project Conventions

- New pages are Markdown files at the repo root with `layout: default` (or `layout: embed` for full-viewport embeds).
- The `embed` layout renders only the page `{{ content }}` with no site chrome; the iframe is sized to `100vh` via CSS.
- Streamlit embeds use `?embed=true&embed_options=hide_footer` query params to suppress Streamlit UI chrome.
- `CNAME` contains the custom domain — do not delete it.
