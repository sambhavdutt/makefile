#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
# -------------------------------------------------------------
# This makefile defines the following targets
#
#   - all (default) - builds all targets and runs all tests.
#   - ci-smoke: Executes the smoke test. 
#   - fabric-ca - builds the fabric-ca binaries.
#   - pip-install - Installs the dependencies required.

all: ci-smoke fabric-ca pip-install
FABRIC = https://gerrit.hyperledger.org/r/fabric
FABRIC_CA = https://gerrit.hyperledger.org/r/fabric-ca
FABRIC_WORKING_DIR = ${WORKSPACE}/gopath/src/github.com/hyperledger/fabric-test/fabric
CA_WORKING_DIR = ${WORKSPACE}/gopath/src/github.com/hyperledger/fabric-test/fabric-ca
PIP_CONFIG_PATH = ${WORKSPACE}/gopath/src/github.com/hyperledger/fabric-test/feature/scripts/install_behave.sh


ci-smoke: fabric ca pip-install

fabric:
	@echo "==========> Clone Fabric repository & Build Docker images <========="
	@git clone $(FABRIC)
	@make docker -C $(FABRIC_WORKING_DIR)
ca:
	@echo "===========> Installing Binaries===================================="
	@echo "############################################################################"
	@git clone $(FABRIC_CA)
	@make docker -C $(CA_WORKING_DIR)
pip-install:
	@echo "=====================Installing Dependencies================================"
	@echo "############################################################################"
	@bash $(PIP_CONFIG_PATH)

