#!/bin/bash

set -e

SOURCES_DIR=/tmp/artifacts/

export JAVA_OPTS="${JAVA_OPTS} -Dorg.wildfly.patching.jar.invalidation=true"
$JBOSS_HOME/bin/jboss-cli.sh --command="patch apply $SOURCES_DIR/jboss-eap-7.2.8-patch.zip"
$JBOSS_HOME/bin/jboss-cli.sh --command="patch apply $SOURCES_DIR/jbeap-19359.zip"
