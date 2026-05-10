# contributing to butler-fox

thanks for your interest in contributing.

## before you start

- read [AGENTS.md](AGENTS.md) for the project briefing and do-not rules
- read [SPEC.md](SPEC.md) for architecture and the roadmap
- follow the TDD workflow: write the bats test first, implement, then `make test`

## workflow

```bash
make image    # build sandbox image once
make test     # lint and test — must pass before any PR
make sandbox  # interactive sandbox to experiment safely
```

## contributor license agreement

by submitting a pull request you agree that your contributions may be
relicensed by the project maintainer under any license, including
proprietary or source-available licenses. you retain copyright to your
own work; this grant gives the maintainer the right to change the
project license in future without requiring your individual sign-off.
