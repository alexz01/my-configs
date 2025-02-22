
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'fnm' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'fnm'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'fnm' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--multishell-path', 'multishell-path', [CompletionResultType]::ParameterName, 'Where the current node version link is stored. This value will be populated automatically by evaluating `fnm env` in your shell profile. Read more about it using `fnm help env`')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', 'V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('list-remote', 'list-remote', [CompletionResultType]::ParameterValue, 'List all remote Node.js versions')
            [CompletionResult]::new('ls-remote', 'ls-remote', [CompletionResultType]::ParameterValue, 'List all remote Node.js versions')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all locally installed Node.js versions')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List all locally installed Node.js versions')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install a new Node.js version')
            [CompletionResult]::new('use', 'use', [CompletionResultType]::ParameterValue, 'Change Node.js version')
            [CompletionResult]::new('env', 'env', [CompletionResultType]::ParameterValue, 'Print and set up required environment variables for fnm')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Print shell completions to stdout')
            [CompletionResult]::new('alias', 'alias', [CompletionResultType]::ParameterValue, 'Alias a version to a common name')
            [CompletionResult]::new('unalias', 'unalias', [CompletionResultType]::ParameterValue, 'Remove an alias definition')
            [CompletionResult]::new('default', 'default', [CompletionResultType]::ParameterValue, 'Set a version as the default version')
            [CompletionResult]::new('current', 'current', [CompletionResultType]::ParameterValue, 'Print the current Node.js version')
            [CompletionResult]::new('exec', 'exec', [CompletionResultType]::ParameterValue, 'Run a command within fnm context')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a Node.js version')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'fnm;list-remote' {
            [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter versions by a user-defined version or a semver range')
            [CompletionResult]::new('--lts', 'lts', [CompletionResultType]::ParameterName, 'Show only LTS versions (optionally filter by LTS codename)')
            [CompletionResult]::new('--sort', 'sort', [CompletionResultType]::ParameterName, 'Version sorting order')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--latest', 'latest', [CompletionResultType]::ParameterName, 'Only show the latest matching version')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;ls-remote' {
            [CompletionResult]::new('--filter', 'filter', [CompletionResultType]::ParameterName, 'Filter versions by a user-defined version or a semver range')
            [CompletionResult]::new('--lts', 'lts', [CompletionResultType]::ParameterName, 'Show only LTS versions (optionally filter by LTS codename)')
            [CompletionResult]::new('--sort', 'sort', [CompletionResultType]::ParameterName, 'Version sorting order')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--latest', 'latest', [CompletionResultType]::ParameterName, 'Only show the latest matching version')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;list' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;ls' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;install' {
            [CompletionResult]::new('--progress', 'progress', [CompletionResultType]::ParameterName, 'Show an interactive progress bar for the download status')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--lts', 'lts', [CompletionResultType]::ParameterName, 'Install latest LTS')
            [CompletionResult]::new('--latest', 'latest', [CompletionResultType]::ParameterName, 'Install latest version')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;use' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--install-if-missing', 'install-if-missing', [CompletionResultType]::ParameterName, 'Install the version if it isn''t installed yet')
            [CompletionResult]::new('--silent-if-unchanged', 'silent-if-unchanged', [CompletionResultType]::ParameterName, 'Don''t output a message identifying the version being used if it will not change due to execution of this command')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;env' {
            [CompletionResult]::new('--shell', 'shell', [CompletionResultType]::ParameterName, 'The shell syntax to use. Infers when missing')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--json', 'json', [CompletionResultType]::ParameterName, 'Print JSON instead of shell commands')
            [CompletionResult]::new('--multi', 'multi', [CompletionResultType]::ParameterName, 'Deprecated. This is the default now')
            [CompletionResult]::new('--use-on-cd', 'use-on-cd', [CompletionResultType]::ParameterName, 'Print the script to change Node versions every directory change')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;completions' {
            [CompletionResult]::new('--shell', 'shell', [CompletionResultType]::ParameterName, 'The shell syntax to use. Infers when missing')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;alias' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;unalias' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;default' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;current' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;exec' {
            [CompletionResult]::new('--using', 'using', [CompletionResultType]::ParameterName, 'Either an explicit version, or a filename with the version written in it')
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--using-file', 'using-file', [CompletionResultType]::ParameterName, 'Deprecated. This is the default now')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;uninstall' {
            [CompletionResult]::new('--node-dist-mirror', 'node-dist-mirror', [CompletionResultType]::ParameterName, '<https://nodejs.org/dist/> mirror')
            [CompletionResult]::new('--fnm-dir', 'fnm-dir', [CompletionResultType]::ParameterName, 'The root directory of fnm installations')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'The log level of fnm commands')
            [CompletionResult]::new('--arch', 'arch', [CompletionResultType]::ParameterName, 'Override the architecture of the installed Node binary. Defaults to arch of fnm binary')
            [CompletionResult]::new('--version-file-strategy', 'version-file-strategy', [CompletionResultType]::ParameterName, 'A strategy for how to resolve the Node version. Used whenever `fnm use` or `fnm install` is called without a version, or when `--use-on-cd` is configured on evaluation')
            [CompletionResult]::new('--corepack-enabled', 'corepack-enabled', [CompletionResultType]::ParameterName, 'Enable corepack support for each new installation. This will make fnm call `corepack enable` on every Node.js installation. For more information about corepack see <https://nodejs.org/api/corepack.html>')
            [CompletionResult]::new('--resolve-engines', 'resolve-engines', [CompletionResultType]::ParameterName, 'Resolve `engines.node` field in `package.json` whenever a `.node-version` or `.nvmrc` file is not present. Experimental: This feature is subject to change. Note: `engines.node` can be any semver range, with the latest satisfying version being resolved.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            break
        }
        'fnm;help' {
            [CompletionResult]::new('list-remote', 'list-remote', [CompletionResultType]::ParameterValue, 'List all remote Node.js versions')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all locally installed Node.js versions')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install a new Node.js version')
            [CompletionResult]::new('use', 'use', [CompletionResultType]::ParameterValue, 'Change Node.js version')
            [CompletionResult]::new('env', 'env', [CompletionResultType]::ParameterValue, 'Print and set up required environment variables for fnm')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Print shell completions to stdout')
            [CompletionResult]::new('alias', 'alias', [CompletionResultType]::ParameterValue, 'Alias a version to a common name')
            [CompletionResult]::new('unalias', 'unalias', [CompletionResultType]::ParameterValue, 'Remove an alias definition')
            [CompletionResult]::new('default', 'default', [CompletionResultType]::ParameterValue, 'Set a version as the default version')
            [CompletionResult]::new('current', 'current', [CompletionResultType]::ParameterValue, 'Print the current Node.js version')
            [CompletionResult]::new('exec', 'exec', [CompletionResultType]::ParameterValue, 'Run a command within fnm context')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstall a Node.js version')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'fnm;help;list-remote' {
            break
        }
        'fnm;help;list' {
            break
        }
        'fnm;help;install' {
            break
        }
        'fnm;help;use' {
            break
        }
        'fnm;help;env' {
            break
        }
        'fnm;help;completions' {
            break
        }
        'fnm;help;alias' {
            break
        }
        'fnm;help;unalias' {
            break
        }
        'fnm;help;default' {
            break
        }
        'fnm;help;current' {
            break
        }
        'fnm;help;exec' {
            break
        }
        'fnm;help;uninstall' {
            break
        }
        'fnm;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
