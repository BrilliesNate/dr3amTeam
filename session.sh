Root="${DEV_ENV_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

export DEV_ENV_ROOT="$Root"
export HOME="$Root/config/home"
export NPM_CONFIG_CACHE="$Root/cache/npm"
export YARN_CACHE_FOLDER="$Root/cache/yarn"
export VSCODE_PORTABLE="$Root/apps/mac/vscode-data"
export GIT_PAGER="cat"
export PAGER="cat"

# apps/node, apps/git and apps/vscode are Windows builds, so the macOS builds
# live in apps/mac. Anything missing there falls back to the system install.
# Yarn is plain JavaScript and is shared with Windows.
export PATH="$Root/apps/mac/node/bin:$Root/apps/yarn/bin:$Root/apps/mac/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

mkdir -p "$HOME" "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER" "$Root/projects"
chmod +x "$Root/apps/yarn/bin/yarn" "$Root/apps/yarn/bin/yarnpkg" 2>/dev/null

if ! command -v node >/dev/null 2>&1; then
    echo "Node.js was not found."
    echo "Extract the macOS build of Node v22.14.0 from https://nodejs.org/dist/v22.14.0/"
    echo "to $Root/apps/mac/node, or install Node.js on this Mac, then relaunch."
    echo ""
fi

if git --version >/dev/null 2>&1; then
    name="$(git config --global --get user.name)"

    if [ -z "${name// /}" ]; then
        read -r -p "Enter your full name: " name
        git config --global user.name "$name"
    fi

    email="$(git config --global --get user.email)"

    if [ -z "${email// /}" ]; then
        read -r -p "Enter your Stellenbosch University e-mail address: " email
        git config --global user.email "$email"
    fi
else
    echo "Git was not found. Run 'xcode-select --install', then relaunch."
    echo ""
fi

cd "$Root/projects"

PS1='\w \$ '

echo "Organisational Informatics 348 Development Environment"
echo "Node: $(node --version 2>/dev/null)"
echo "Git:  $(git --version 2>/dev/null)"
echo "Yarn: $(yarn --version 2>/dev/null)"
echo ""
echo "Working directory: $PWD"
echo ""
