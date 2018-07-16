#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/cuda:/usr/lib/nvidia

if [[ -z "$WORKER" || -z "$EWAL" ]]; then
    echo "You must at least set WORKER and EWAL env vars."
    exit 1
fi

/claymore/ethdcrminer64 -epool ${EPOOL} -ewal ${EWAL} -epsw ${EPSW} -eworker ${WORKER} -gser ${GSER} -mode ${MODE}