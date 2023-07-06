#!/bin/bash

namespace="http://maven.apache.org/POM/4.0.0"
dependency_xpath="//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']"
dependency_xpath_scope="//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']/ns:scope"
sample_pom="./sample/pom.xml"

# xml starlet helper functions

# update scope of a dependency as test
function change_scope_to_test(){

    local group_id=$1
    local artifact_id=$2
    local pom=$3
    echo Changing dependency scope to test --> GroupId: $group_id, ArtifactId: $artifact_id from $pom
    
    ./xml.exe ed -L -N ns=$namespace -d "//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']/ns:scope" $pom
    ./xml.exe ed -L -N ns=$namespace -s "//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']" -t elem -n "scope" -v "test" "$pom"
    # ./xml.exe ed -L -N ns=$namespace -d "$dependency_xpath_scope" $pom
    # ./xml.exe ed -L -N ns=$namespace -s "$dependency_xpath" -t elem -n "scope" -v "test" "$pom"
}

function remove_dependency(){
    local group_id=$1
    local artifact_id=$2
    local pom=$3
    echo Removing dependency, GroupId: $group_id, ArtifactId: $artifact_id from $pom
    
    ./xml.exe ed -L -N ns=$namespace -d "//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']" $pom
}

function select_dependency(){
    group_id=$1
    artifact_id=$2
    pom=$3
    echo Removing dependency GroupId: $group_id, ArtifactId: $artifact_id from $pom
    ./xml.exe sel -N "ns=http://maven.apache.org/POM/4.0.0" -t -v "//ns:dependency[ns:groupId='$group_id' and ns:artifactId='$artifact_id']" $pom    
}

