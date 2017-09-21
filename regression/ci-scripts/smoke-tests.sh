#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

./regression/ci-scripts/build-docker-images.sh
./regression/ci-scripts/pip-install-smoke.sh
