#!/bin/bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# buildah-rhtap
source $SCRIPTDIR/common.sh

function build() {
	echo "Running $TASK_NAME:build"
	echo "================================= CHANGED =============================="

	echo "TASK NAME: ${TASK_NAME}"
	echo "RESULTS DIR: ${RESULTS}"
 
	echo "GH ====> ${GITOPS_AUTH_PASSWORD:0:10}"
	echo "URL====> $ROX_CENTRAL_ENDPOINT"
 	echo "TOKEN==> ${ROX_API_TOKEN:0:10}"
	# Set task results
	echo "sha256:9c9cecb1ad8f37012baea8676b76a4d7d96d23b656aa1b8dc79b8d77ad27aa3e" | tee $RESULTS/IMAGE_DIGEST
	echo "quay.io/mmorhun-org/test-jenkins:latest@sha256:9c9cecb1ad8f37012baea8676b76a4d7d96d23b656aa1b8dc79b8d77ad27aa3e" | tee $RESULTS/IMAGE_REF
	echo "quay.io/mmorhun-org/test-jenkins:latest" | tee $RESULTS/IMAGE_URL

    # Alt for testing
    #echo "sha256:1f0f650f4bd1153bd2666763e293e630e9d516cbacd5858dfc79ccd3878d6f3b" | tee $RESULTS/IMAGE_DIGEST
    #echo "quay.io/redhat-user-workloads/rhtap-build-tenant/build-service/build-service:fc154a3fc1d240e27c3435369059f601b33ab3fa@sha256:1f0f650f4bd1153bd2666763e293e630e9d516cbacd5858dfc79ccd3878d6f3b" | tee $RESULTS/IMAGE_REF
    #echo "quay.io/redhat-user-workloads/rhtap-build-tenant/build-service/build-service:fc154a3fc1d240e27c3435369059f601b33ab3fa" | tee $RESULTS/IMAGE_URL
}

# Task Steps
build

exit_with_success_result
