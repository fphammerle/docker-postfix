# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/fphammerle/docker-postfix/compare/1.0.1...HEAD
[1.0.1]: https://github.com/fphammerle/docker-postfix/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/fphammerle/docker-postfix/releases/tag/1.0.0
