#!/bin/bash

set -e

: ${HOST:=}
: ${CA:=}
: ${CERT:=} # Default: empty build args
: ${KEY:=}
: ${PROJECT:=}
: ${JOB:=}
: ${OPTIONS:=}

if [ -z "$HOST" ]
then
   echo "HOST must be configured"
   exit 1
fi
if [ -z "$CA" ]
then
   echo "CA must be configured"
   exit 1
fi
if [ -z "$CERT" ]
then
    echo "CERT must be configured"
   exit 1
fi
if [ -z "$KEY" ]
then
   echo "KEY must be configured"
   exit 1
fi
if [ -z "$PROJECT" ]
then
   echo "PROJECT must be configured"
   exit 1
fi
if [ -z "$JOB" ]
then
   echo "JOB must be configured"
   exit 1
fi

   
echo "Triggering ${PROJECT}/${JOB} on ${HOST}"
echo $CA > /ca.crt
echo $CERT > /cert.crt
echo $KEY > /cert.key

/gundeck --url=${HOST} --cacert=/ca.crt --cert=/cert.crt --key=/cert.key --name=${JOB} --project=${PROJECT} --token=${TOKEN} --jobOptions=${OPTIONS}
