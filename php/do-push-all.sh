#!/usr/bin/env bash

(cd php/7.4 && bash do-push.sh)
(cd php/7.3 && bash do-push.sh)
(cd php/7.2 && bash do-push.sh)

# Legacy.

#(cd php/7.1 && bash do-push.sh)
#(cd php/7.0 && bash do-push.sh)
