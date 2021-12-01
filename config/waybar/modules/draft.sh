#!/bin/bash

E="3003658200";
D=$(($(($(( $E - $(date +%s))) * 1 ))/86400));
H=$(date -u --date @$(($E - `date +%s`)) +%H);
M=$(date -u --date @$(($E - `date +%s`)) +%M);

let "H=10#${H}"; let "M=10#${M}";

echo -e "$D days, $H hours and $M minutes";
