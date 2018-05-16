#!/usr/bin/env bats

@test "Ensure that samurai file exists" {
  run stat samurai.sh
  [ $status = 0 ]
}

