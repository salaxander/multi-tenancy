#!/bin/bash

set -e

# This file is run by Prow during all presuubmits

# Not included or existing by default in Prow
#  - This is part of an ongoing discussion present on the issue:
#    https://github.com/kubernetes/test-infra/issues/9469;
#  - Other projects that use Prow as the CI, e.g. kubernetes-sigs/controller-runtime,
#    https://github.com/kubernetes-sigs/controller-runtime/blob/master/hack/ci-check-everything.sh,
#    also have this custom configuration;
#  - In Prow, the GOPATH is set to /home/prow/go, whereas in
#    the Docker container is /go, which is the default one.

export PATH=$(go env GOPATH)/bin:$PATH
mkdir -p $(go env GOPATH)/bin
hack_dir=$(dirname ${BASH_SOURCE})

echo "Running 'make test'"
make test -C "$hack_dir/.."