# changelog

all notable changes to this project are documented here.

format: [keep a changelog](https://keepachangelog.com/en/1.0.0/)
versioning: [semantic versioning](https://semver.org/spec/v2.0.0.html)

---

## [0.1.0] - 2026-05-10

### added

- `fox system` — info, disk, memory, processes, users, version, weather, notes
- `fox network` — ip4, ip6, ports, notes
- `fox ssh` — keygen, copy-id, notes
- `fox update` — pulls latest release from GitHub into `~/.fox/bin/fox`
- `fox uninstall` — removes `~/.fox` from the machine
- `fox_print_local_notes` — per-tool local notes from `~/.fox/notes/<tool>.sh`
- docker sandbox — `make image`, `make test`, `make sandbox` for safe testing
- shellcheck + bats-core test suite (21 tests)
- MIT license, CONTRIBUTING.md with CLA clause
- SPEC.md, AGENTS.md, CLAUDE.md

### changed

- replaced numbered menu (`fox m`) with named-command UX (`fox <tool>`)
- moved legacy subprojects (clamshield, fox-go, samurai, graph-docker, hound-docker) to `legacy/`
- replaced Apache 2.0 license with MIT

### removed

- numbered menu commands (`fox m`, `fox mm`, `fox m <n>`)
- CI workflows (codeql, superlinter) — replaced by docker-based `make test`
