#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

# -------------------------------------------------------------
# This makefile defines the following targets
#
#   - ci-daily: Execute daily tests suite in hyperledger CI
#   - ci-smoke: Executes smoke tests suite in hyperledger CI
#   - ci-release: Executes release tests suite in hyperledger CI

DIR=gopath/src/github.com/hyperledger
fabric_repo?= https://github.com/hyperledger/fabric
#fabric_repo: ssh://hyperledger-jobbuilder@gerrit.hyperledger.org:29418/fabric
.PHONY: clone
clone:
	@cd $(GOPATH/src/github.com/hyperledger/fabric)
	@if [ ! -d $@ ]; then (git clone $(fabric_repo)); fi
	@cd $@
	make docker
	@regression/ci-scripts/daily-tests.sh
ci-daily: clone
ci-smoke: .FORCE
	@regression/ci-scripts/smoke-tests.sh

ci-release: .FORCE
	@regression/ci-scripts/release-tests.sh

.FORCE:
