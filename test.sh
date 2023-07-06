#!/bin/bash

source start.sh

test_dep1_group_id="org.springframework"
test_dep1_artifact_id="spring-core"
test_dep2_group_id="org.mybatis"
test_dep2_artifact_id="mybatis"
target_pom="./sample/pom.xml"

# change_scope_to_test $test_dep1_group_id $test_dep1_artifact_id $target_pom
# select_dependency $test_dep1_group_id $test_dep1_artifact_id $target_pom
remove_dependency $test_dep2_group_id $test_dep2_artifact_id $target_pom