#!/usr/bin/env bats

@test "Ensure that samurai file exists" {
  run stat samurai
  [ $status = 0 ]
}

@test "Ensure that tmp directory exists" {
  run stat /tmp
  [ $status = 0 ]
}
