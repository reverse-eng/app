#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e3f97261aecd2001990c0fe/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e3f97261aecd2001990c0fe
curl -s -X POST https://api.stackbit.com/project/5e3f97261aecd2001990c0fe/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e3f97261aecd2001990c0fe/webhook/build/publish > /dev/null
