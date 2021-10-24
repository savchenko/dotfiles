#!/bin/bash

set -o errexit
set -o nounset

# TODO: Regexp check
echo $(curl -s wttr.in/Adelaide?format="+%t" | cut -b 3-6)
