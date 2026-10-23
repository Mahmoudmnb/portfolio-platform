# Security policy

## Scope and support

Security fixes are maintained on the default development branch. No older release branch currently has a promised security-support period. Published deployment/review reports do not imply that every deployment is patched or that a debug APK is a distribution release.

## Report privately

Use GitHub's **Security → Report a vulnerability** for this repository when private vulnerability reporting is enabled:

https://github.com/Mahmoudmnb/portfolio-platform/security/advisories/new

If that control is unavailable, request a private reporting channel from [the maintainer](https://github.com/Mahmoudmnb) through their GitHub profile/contact options. A public request should contain no vulnerability details, exploit, credentials or affected private records. Do not submit a vulnerability through the ordinary public bug template.

Include the affected revision, component, impact, minimal reproduction against an instance you control, and suggested mitigation if available. Redact tokens, passwords, personal information and inquiry contents. Do not test the author's production service or other deployments without separate authorization.

Reports are handled on a best-effort basis. No response deadline, bounty or permission for live-system testing is implied by this policy.

## Contributor responsibilities

Use local/disposable environments, keep credentials out of source and logs, preserve TLS verification and authorization checks, and report suspected leaks privately. Removing a secret from the latest file does not remove it from Git history; exposed credentials require revocation/rotation by their owner. Do not rewrite shared history or rotate production secrets without coordination.
