#!/bin/bash
openssl s_client \
    -connect $1:443 \
    < /dev/null 2>/dev/null \
    | openssl x509 -fingerprint -noout -in /dev/stdin \
    | cut -d '=' -f 2
