#!/bin/bash
# shellcheck shell=bash

set -e

current_version=$(ruby -e "require '$(pwd)/lib/ims/lti1_1/version.rb'; puts IMS::LTI1_1::VERSION;")
existing_versions=$(gem list --exact ims-lti --remote --all | grep -o '\((.*)\)$' | tr -d '() ')

if [[ $existing_versions == *$current_version* ]]; then
  echo "Gem has already been published ... skipping ..."
else
  gem build ./ims-lti.gemspec
  find ims-lti-*.gem | xargs gem push
fi
