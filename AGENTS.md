# AI Agent Guidelines

## Project Overview

A Bash utility (`download_content.sh`) that downloads test media files
onto a USB stick for TV/media player testing. The repository is a single
shell script with extensive CI/CD and linting infrastructure.

## Build / Lint / Test Commands

There is no build system or test framework. Quality is enforced via
linters. Run these locally before committing:

```bash
# Shell script linting (primary code quality check)
shellcheck --exclude=SC2317 download_content.sh

# Shell script formatting (check mode)
shfmt --case-indent --indent 2 --space-redirects -d download_content.sh

# Shell script formatting (apply fixes)
shfmt --case-indent --indent 2 --space-redirects -w download_content.sh

# Markdown linting
rumdl .

# Link checking
lychee --cache .

# JSON validation (supports comments)
jsonlint --comments file.json

# GitHub Actions workflow validation
actionlint

# Full CI suite (requires Docker)
npx mega-linter-runner --flavor documentation
```

## Shell Script Style

All shell scripts must follow these conventions:

- **Shebang**: `#!/usr/bin/env bash`
- **Strict mode**: Always use `set -euo pipefail`
- **Indentation**: 2 spaces, no tabs
- **Variables**: UPPERCASE with underscores (`${MY_VARIABLE}`)
- **Quoting**: Always double-quote variables (`"$VAR"` or `"${VAR}"`)
- **Functions**: Use `function_name()` syntax with `local` for locals
- **Redirections**: Space before operators (`> file` not `>file`)
- **Case statements**: Indent case bodies
- **Error handling**: Rely on `set -euo pipefail`; no explicit per-command
  error handling needed unless catching expected failures
- **Parameter expansion**: Prefer `${VAR}` for clarity in concatenation
- **Comments**: Use `#` inline; use `######` separator lines for sections

### Shell Example

```bash
#!/usr/bin/env bash

set -euo pipefail

my_function() {
  local MY_INPUT=$1
  shift
  local OUTPUT_DIR=$1
  shift

  test -d "${OUTPUT_DIR}" || mkdir "${OUTPUT_DIR}"
  echo "Processing ${MY_INPUT}"
}

MY_VALUE="example"
my_function "${MY_VALUE}" "/tmp/output"
```

## Markdown Style

- Pass `rumdl` checks (config: `.rumdl.toml`)
- Wrap lines at 72 characters
- Use proper heading hierarchy (no skipping levels)
- Include language identifiers in code fences (e.g., `bash`, `json`)
- Prefer code fences over inline code for multi-line examples
- Shell code blocks (`bash`/`shell`/`sh`) are extracted and validated
  by `shellcheck` and `shfmt` during CI

## YAML Style (GitHub Actions)

- Start files with `---` document separator
- Begin with a descriptive comment block explaining the workflow
- Use `# keep-sorted start` / `# keep-sorted end` for sorted sections
- Pin actions to full SHA with version comment:
  `uses: owner/repo@<full-sha> # v1.2.3`
- Set `permissions: read-all` as default; override per-job as needed
- Set `timeout-minutes` on every job
- Validate changes with `actionlint`

## JSON / JSON5 Style

- Must pass `jsonlint --comments` validation
- JSON5 files (e.g., `renovate.json5`) may use trailing commas and
  `//` comments
- Excluded: `.devcontainer/devcontainer.json`

## Security Scanning

CI runs multiple security scanners. Be aware of these when modifying
infrastructure files:

- **Checkov**: IaC scanner (skips `CKV_GHA_7`)
- **DevSkim**: Pattern scanner (ignores DS162092, DS137138)
- **KICS**: Fails on HIGH severity
- **Trivy**: HIGH/CRITICAL only, ignores unfixed vulnerabilities

## Version Control

### Commit Messages

Use conventional commits with these rules:

- **Format**: `<type>: <description>` (max 72 characters)
- **Types**: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`,
  `style`, `perf`, `ci`, `build`, `revert`
- **Mood**: Imperative ("add" not "added" or "adds")
- **Case**: Lowercase (except proper nouns and abbreviations)
- **No period** at end of subject line
- **Body**: Optional; wrap at 72 characters; explain what and why
- **Issues**: Reference with `Fixes`, `Closes`, or `Resolves`

```text
feat: add automated dependency updates

- Implement Dependabot configuration
- Configure weekly security updates

Resolves: #123
```

### Branching

Follow [Conventional Branch](https://conventional-branch.github.io/):

- Format: `<type>/<description>`
- Types: `feature/`, `feat/`, `bugfix/`, `fix/`, `hotfix/`,
  `release/`, `chore/`
- Use lowercase, hyphens, no consecutive/leading/trailing hyphens
- Include issue numbers: `feature/issue-123-add-login-page`

### Pull Requests

- Always create as **draft** initially
- Title must follow conventional commit format
- Include clear description and link related issues

## Quality Checklist

- [ ] Shell scripts pass `shellcheck --exclude=SC2317`
- [ ] Shell scripts formatted with `shfmt` (2-space indent)
- [ ] Markdown passes `rumdl` checks
- [ ] Links validated with `lychee`
- [ ] GitHub Actions pinned to full SHA commits
- [ ] Commit message follows conventional format
- [ ] Lines wrapped at 72 characters in Markdown
- [ ] Two spaces for indentation everywhere (no tabs)
