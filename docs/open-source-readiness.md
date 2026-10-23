# Open-source readiness and GitHub settings

Prepared against repository revision `0c22940a5c4b4472b42de1e5c50a39bb39a3c787` on 2026-10-23. Repository files can be reviewed locally; remote settings and hosted CI require access to the GitHub repository's settings. The reviewed documentation/configuration is intended for the `chore/open-source-readiness` branch. No visibility change, deployment, tag or release is part of this work.

## Files prepared

- Root README: project explanation, existing dashboard screenshots, component map, local-first setup and documentation links. Website integration remains explicitly reserved.
- CONTRIBUTING.md: contribution scope, checks, safe local environments and review expectations.
- SECURITY.md and CODE_OF_CONDUCT.md: private vulnerability/conduct reporting guidance without invented contact addresses or service guarantees.
- THIRD_PARTY_NOTICES.md: preserved font notices and explicit outstanding asset provenance review.
- GitHub issue forms, PR template, CODEOWNERS and weekly Dependabot updates for Composer, both Pub packages, Actions, Python tooling, backend Docker images, Compose images and Android Gradle dependencies.
- docs/README.md: documentation navigation and evidence caveats.
- Root ignore patterns expanded for credentials, database files/backups and signing material; runtime behavior, API contract and coding-agent instructions unchanged.

The existing MIT license and copyright holder are preserved. This preparation does not relicense third-party material or certify asset provenance.

## Maintainer GitHub setup

Review these settings in the repository UI. Availability and names can vary by account; unsupported controls should be recorded rather than claimed enabled.

| Area | Recommended configuration |
| --- | --- |
| About | Description: `Self-hosted portfolio platform with a Laravel API, Flutter Android dashboard and shared Dart client.` |
| Website | https://mahmoudbannan.com — identify it as the author's portfolio, not an admin demo |
| Topics | laravel, flutter, dart, rest-api, portfolio, content-management, android, mysql, mariadb, self-hosted |
| Features | Enable Issues; Discussions optional only if the maintainer wants to moderate another channel |
| Pull requests | Prefer squash merging and automatic deletion of merged topic branches; preserve the current default branch |
| Actions | Keep default workflow token permissions read-only; public fork PR checks must not receive production/signing secrets |
| Security | Review/enable Dependabot alerts, supported secret scanning/push protection and private vulnerability reporting |
| Code scanning | Enable supported analysis only after reviewing language coverage; do not add a fake PHP/Dart scanning badge |
| Branch rules | Protect the default branch against deletion/force pushes; require passing appropriate checks and resolved conversations |
| Reviews | Require another reviewer only when someone is actually available; do not deadlock a solo-maintainer workflow |
| Releases | Publish a version/tag only after review and relevant gates; never attach an owner-configured debug APK as a production release |

CODEOWNERS routes review to @Mahmoudmnb; it does not grant permissions or force review by itself. Configure rules after checking the actual stable CI job names. Existing backend/dashboard workflows use path filters: indiscriminately requiring their checks can block unrelated PRs because skipped workflows may leave required checks pending. Resolve check coverage first or use a properly designed always-running aggregate gate; do not select nonexistent checks.

Dependabot configuration adds reviewable update PRs; it does not enable automatic merge, prove vulnerability coverage or replace hosted validation. Keep application lockfiles and verify SDK compatibility before accepting updates. Avoid privileged workflows that execute untrusted fork code. No automatic deployment workflow is introduced.

Verify that Security → Report a vulnerability works before advertising it as an enabled private channel. SECURITY.md provides a fallback request for a private contact channel without inventing a public email address.

Confirm that @Mahmoudmnb has write access for CODEOWNERS, and provide a usable private contact on the linked maintainer profile for conduct concerns and the security fallback. Validate the issue chooser and Dependabot jobs after merging these files into the default branch. These controls follow GitHub's [CODEOWNERS requirements](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners), [private reporting setup](https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/configure-vulnerability-reporting/configure-for-a-repository) and [Dependabot options](https://docs.github.com/en/code-security/reference/supply-chain-security/dependabot-options-reference).

## Publication review

1. Inspect current tracked files and full Git history for secrets with a maintained secret scanner in a trusted environment. A filename/regex inspection is limited and does not certify a clean repository.
2. Verify no .env, owner credentials, signing material, private inquiry data, backup archives or uploaded production media are tracked. Ignore rules do not remove already committed content.
3. If a real leak is found, report privately, revoke/rotate through the owner and coordinate any history cleanup. Do not silently force-push or delete shared history.
4. Audit dashboard/assets/figma SVG provenance and redistribution terms; keep font OFL notices and dependency licenses. This review remains open rather than assumed complete.
5. Review documentation screenshots/evidence for fictional data, private contact information, account identifiers and inappropriate production diagnostics. Personal branding intentionally shown by the owner may stay; infrastructure details are not necessary for public examples.
6. Confirm a fresh checkout can follow the local setup and create its own owner without the author's credentials or production API.
7. Run hosted Backend and Android dashboard workflows on the reviewed revision, recording URLs/results. Old local reports are not current hosted evidence.
8. Verify the README's current limitations before making any release-readiness claim. Existing unresolved picker/physical-device/Figma checks remain open until newly verified.

## Validation of this change

This task changes documentation and repository metadata only. Local checks cover Markdown file links introduced/edited here, YAML parsing and issue-form structure, Dependabot directory/manifest existence, ignore-pattern probes, tracked sensitive-file-name patterns and git diff whitespace. No full application test suite, hosted CI, complete history secret scan, license certification or live-system test is implied.

Results on 2026-10-23:

- All 47 relative Markdown/image links in the new or edited contributor documents resolve locally. The three README screenshots were visually inspected and show empty development screens without private inquiry data.
- All six GitHub YAML files parse without duplicate keys, including the two unchanged workflows. Both issue forms pass structural checks for supported field types, required attributes and unique field IDs.
- All eight Dependabot entries have unique ecosystem/directory pairs and point to existing manifests. The CODEOWNERS entry matches the owner in the configured Git remote; remote permissions remain unverified.
- All 37 private-path probes are ignored, including environment files, credential stores, database backups, signing keys and visitor uploads. Eight public templates, notices and lockfiles remain eligible for tracking.
- No tracked filenames matched the inspected credential, signing-key or database-file patterns. This is a filename check, not a content or history secret scan.
- The MIT license and both bundled font notices match HEAD byte-for-byte. No application files or existing workflows changed. Whitespace checks pass for the tracked diff and added contributor documents/configuration.
- Remote repository/workflow URLs could not be fetched by the web tool. Their paths match `origin` and the local workflow filenames, but badges, the issue chooser, new security-policy link and private advisory form need authenticated verification after merge. Localhost examples require the documented services to be running. Fresh installation was not executed for this documentation-only change.

The pre-existing untracked `docs/open-source-readiness.patch` was preserved. Selected documentation/configuration sections were used as a starting point and revised here; the patch is not an exact representation of the resulting changes. Review the working tree directly rather than reapplying it.
