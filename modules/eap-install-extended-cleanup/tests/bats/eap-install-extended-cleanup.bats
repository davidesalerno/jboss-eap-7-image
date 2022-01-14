#!/usr/bin/env bats

export JBOSS_HOME=$BATS_TMPDIR/jboss_home

setup() {
  mkdir -p  ${JBOSS_HOME}/domain
  mkdir -p  ${JBOSS_HOME}/migration
  mkdir -p  ${JBOSS_HOME}/welcome-content
  mkdir -p  ${JBOSS_HOME}/bin
  mkdir -p  ${JBOSS_HOME}/bin/init.d/
  touch ${JBOSS_HOME}/bin/test.bat
  touch ${JBOSS_HOME}/bin/test.ps1
  touch ${JBOSS_HOME}/bin/jboss-cli.sh
  touch ${JBOSS_HOME}/bin/init.d/test.sh
}

teardown() {
  rm -rf $JBOSS_HOME
}

@test "verify that domain, migration and welcome content are deleted without errors and bin folder is cleaned up correctly" {

    run bash $BATS_TEST_DIRNAME/../../install.sh

    # We have to delete folders domain, migration and welcome-content but not bin
    result="$(ls $JBOSS_HOME | wc -l)"
    [ "$result" -eq 1 ]

    # So let's check that there is the bin folder with 1 element
    result="$(ls $JBOSS_HOME/bin | wc -l)"
    [ "$result" -eq 1 ]

    # And that this element is not the init.d folder
    result="$(test -d $JBOSS_HOME/bin/init.d && echo "Found/Exists" || echo "Does not exist")"
    [ "$result" == "Does not exist" ]

    #Test completed!!!
}