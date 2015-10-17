#!/bin/sh -x
(date;date;date)|sort
echo foo bar >/dev/null
echo $?
