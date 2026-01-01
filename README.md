<div align="center">

# asdf-lua [![Build](https://github.com/stannum-l/asdf-lua/actions/workflows/build.yml/badge.svg)](<https://github.com/>stannum-l/asdf-lua/actions/workflows/build.yml) [![Lint](https://github.com/stannum-l/asdf-lua/actions/workflows/lint.yml/badge.svg)](<https://github.com/>stannum-l/asdf-lua/actions/workflows/lint.yml)

[lua](<TOOL HOMEPAGE>) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add lua
# or
asdf plugin add lua https://github.com/stannum-l/asdf-lua.git
```

lua:

```shell
# Show all installable versions
asdf list-all lua

# Install specific version
asdf install lua latest

# Set a version globally (on your ~/.tool-versions file)
asdf global lua latest

# Now lua commands are available
<TOOL CHECK>
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](<<https://github.com/stannum-l/asdf-lua/graphs/contributors>)!

# License

See [LICENSE](LICENSE) © [Stannum-l](<<https://github.com/stannum-l/>)
