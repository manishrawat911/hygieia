#!/bin/bash

#
run_test_scope_analysis=1
run_remove_build_analysis=1
# run_test_scope_analysis=1

project_dir=""
current_dir=""
subprojects=($(find "$project_dir" -name "pom.xml" -exec dirname {} \;))
