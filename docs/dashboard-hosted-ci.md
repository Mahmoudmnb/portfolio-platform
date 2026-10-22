# Hosted dashboard CI handoff

Observed 2026-10-21: `.github/workflows/dashboard.yml` is present, scoped to dashboard/shared API/OpenAPI/workflow changes, with read-only contents permission, Flutter 3.47.7, Java 17, locked dependency resolution, formatting, analysis/tests, generated-contract comparison and a debug Android build. Artifact upload selects only the APK and retains it seven days. The existing backend workflow is preserved.

Hosted execution is blocked: `git rev-parse --verify HEAD` fails; `git ls-files` lists zero tracked files. This checkout therefore has no committed intended revision whose workflow can be executed. Its origin is `git@github.com:Mahmoudmnb/portfolio-platform.git`, but that does not establish a matching hosted source revision. The `gh` CLI is also absent. No commit/push/merge was performed to manufacture a CI result. There is no run URL, tested commit SHA or hosted job result to report.

After the intended reviewed changes have been committed and pushed by the operator, open [Android dashboard Actions](https://github.com/Mahmoudmnb/portfolio-platform/actions/workflows/dashboard.yml), select **Run workflow**, choose that branch and run. Record the run URL and head commit SHA; inspect every step in the verify job and download the APK only from that run. Do not treat a run on another branch/revision as this checkout's evidence.

With an authenticated GitHub CLI installed, replace the branch and SHA below with the actual reviewed revision:

```sh
gh workflow run dashboard.yml --repo Mahmoudmnb/portfolio-platform --ref YOUR_REVIEWED_BRANCH
gh run list --repo Mahmoudmnb/portfolio-platform --workflow dashboard.yml --commit YOUR_REVIEWED_SHA --limit 5
gh run watch RUN_ID --repo Mahmoudmnb/portfolio-platform --exit-status
gh run view RUN_ID --repo Mahmoudmnb/portfolio-platform --json url,headSha,conclusion,jobs
```

No production/signing secrets are required for this workflow. Its debug API URL is an emulator development address; downloading the APK does not start an API or provide credentials. Local verification results are recorded separately in dashboard-completion.md and do not satisfy hosted execution.
