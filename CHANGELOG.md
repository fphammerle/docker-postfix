# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- added [mozilla's ca cert store](https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/)
  (disabled per default, enable via `tls_append_default_CA=yes`)

### Fixed
- upgrade postfix v3.4.8 -> v3.4.9
  - changelog: http://www.postfix.org/announcements/postfix-3.4.9.html
  - package commit: https://git.alpinelinux.org/aports/commit/?id=f38ee5d5622a4b456addea492f7ee9b187719934

## [1.0.3] - 2019-12-22
### Fixed
- fix permission denied / `EACCES` error
  when `$POSTMAP_PATHS` contains path to file not owned by root.
  keep `postmap` from changing uid/gid to file owner
  as user might not have write perms on dir
  (e.g., due to mount with `dockerd --userns-remap`).

## [1.0.2] - 2019-12-21
### Fixed
- disable local apk cache
- upgrade postfix v3.4.7 -> v3.4.8
  - changelog: http://www.postfix.org/announcements/postfix-3.4.8.html
  - package commit: https://git.alpinelinux.org/aports/commit/?id=4f878d653bf1e8dd1d2d13dc58b64ce5ec14d48b

## [1.0.1] - 2019-08-10
### Fixed
- mount /var/spool/postfix to preserve mail queue

## [1.0.0] - 2019-08-10
### Added
- on startup: postmap paths in `$POSTMAP_PATHS`
- on startup: update aliases database

### Changed
- minimal image containing default config only
- log to stdout

[Unreleased]: https://github.com/fphammerle/docker-postfix/compare/1.0.3...HEAD
[1.0.3]: https://github.com/fphammerle/docker-postfix/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/fphammerle/docker-postfix/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/fphammerle/docker-postfix/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/fphammerle/docker-postfix/releases/tag/1.0.0
