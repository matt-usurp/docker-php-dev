#!/usr/bin/env bash

(cd php/7.3 && bash do-build.sh)
(cd php/7.2 && bash do-build.sh)

# Legacy.

#(cd php/7.1 && bash do-build.sh)
#(cd php/7.0 && bash do-build.sh)
