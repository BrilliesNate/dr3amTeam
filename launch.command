#!/bin/bash

ROOT="$(cd "$(dirname "$0")" && pwd)"

export DEV_ENV_ROOT="$ROOT"
export BASH_SILENCE_DEPRECATION_WARNING=1

mkdir -p "$ROOT/projects"
cd "$ROOT/projects" || exit 1

exec /bin/bash --noprofile --rcfile "$ROOT/session.sh" -i
