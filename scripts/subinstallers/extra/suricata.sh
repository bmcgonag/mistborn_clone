#!/bin/bash

# Scirius
SCIRIUS_PROD_FILE="$1"
SCIRIUS_SECRET_KEY=$(python3 -c "import secrets; import string; print(f''.join([secrets.choice(string.ascii_letters+string.digits) for x in range(50)]))")
echo "SECRET_KEY=$SCIRIUS_SECRET_KEY" > $SCIRIUS_PROD_FILE
echo "ALLOWED_HOSTS=suricata.mistborn" >> $SCIRIUS_PROD_FILE