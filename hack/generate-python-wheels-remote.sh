#!/bin/bash

set -euo pipefail

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

cd "${ROOT}/task-generator/remote"
GOTOOLCHAIN=auto GOSUMDB=sum.golang.org go build -o /tmp/python-wheels-remote-generator main.go

/tmp/python-wheels-remote-generator \
    --source-task="${ROOT}/tasks/build-python-wheels-oci-ta.yaml" \
    --remote-task="${ROOT}/tasks/build-python-wheels-remote-oci-ta.yaml"
