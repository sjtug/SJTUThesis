#!/usr/bin/env bash

set -e               # exit on error

ROOT=$(dirname "${BASH_SOURCE}")/..

export HTTP_PORT="${HTTP_PORT:-8848}"
export HTTP_SECRET="${HTTP_SECRET:-IAMDOG}"
export POULE_GITHUB_TOKEN="${POULE_GITHUB_TOKEN:-}"

cd ${ROOT}
envsubst < hack/thesis-bot.yml.template > hack/thesis-bot.yml
poule serve --config hack/thesis-bot.yml
