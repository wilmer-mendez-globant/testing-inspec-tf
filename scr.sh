#!/usr/bin/env bash

awk '

function myfunc()

{

printf "The user %s has home path at %s\n", $1,$6

}

BEGIN{FS=":"}

{

myfunc()

}' /etc/passwd
