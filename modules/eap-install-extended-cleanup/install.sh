#!/bin/bash

set -e

#https://issues.redhat.com/browse/KIECLOUD-592
function extended_cleanup() {
  echo "Deleting folders domain migration welcome-content"
  rm -rf ${JBOSS_HOME}/domain
  rm -rf ${JBOSS_HOME}/migration
  rm -rf ${JBOSS_HOME}/welcome-content

  echo "Deleting all *.bat and *.ps1 and init.d folder"
  rm -rf ${JBOSS_HOME}/bin/*.bat
  rm -rf ${JBOSS_HOME}/bin/*.ps1
  rm -rf ${JBOSS_HOME}/bin/init.d
}

# Execute extended cleanup deleting from $JBOSS_HOME
extended_cleanup

