# butler fox

![GitHub](https://img.shields.io/github/license/mirageglobe/butler-fox.svg)

- maintainer : jimmy mg lim (mirageglobe@gmail.com)
- source : https://github.com/mirageglobe/butler-fox

```
                             .::::::.
        ..:=====:..        .::::::::::.
    ..:=============:..   .::::::::::::.    Butler
   :==================: .::::::::::::.      Fox
   :==================:::::::::::::::
 .::.=================::::::::::::::
 :::..==============..:::.    ::::
  :.:::::::::::::::::::      :::::
    :: .:::::.      ::        ::::.
     ::             :
```

butler fox is a local machine management CLI that fights forgetfulness. instead of remembering exact flags, package names, and command sequences, you ask fox. it wraps the commands a developer uses daily behind a named, searchable interface.

evolved from samurai (2013) → fox (2016) → butler-fox (current).

## features

- named commands: `fox system`, `fox ssh`, `fox git`, `fox docker`
- keyword search across all tools: `fox s <term>`
- per-tool reference notes with local override support
- almost no dependencies — bash, curl, grep
- works on macOS and debian/ubuntu

see [SPEC.md](SPEC.md) for the project roadmap.

## install

requirements: bash 4.0+, curl

```bash
curl -fsSL https://raw.githubusercontent.com/mirageglobe/butler-fox/main/install.sh | bash
```

restart your shell, then:

```bash
fox help          # usage summary
fox m             # browse numbered command menu
fox system        # show system info, disk, memory, processes
fox s <term>      # search all tools by keyword
```

## uninstall

```bash
rm -fr ~/.fox
```

## contribute

- bugs and suggestions: https://github.com/mirageglobe/butler-fox/issues
- pull requests welcome — see SPEC.md for architecture and build instructions

before submitting a PR:

```bash
make test         # lint (shellcheck) + bats test suite — must pass
make all          # build → test → deploy
```
