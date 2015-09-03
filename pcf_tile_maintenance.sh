#!/bin/bash
set -e

## Parameters 
## Token from https://networ.pivotal.io edit profile->generate token
## Local File - file name of tile form network.pivotal.io
## Download URL - location of download URL from network.pivotal.io
## Opsmgr user - created during install of opsmgr
## OpsMgr password - used for upload into opsmgr

export PIVNET_TOKEN=$1 
export LOCAL_FILE_NAME=$2
export DOWNLOAD_URL=$3
export OPSMGR_HOST=localhost
export OPSMGR_USER=$4
export OPSMGR_PASSWORD=$5

echo "Attempting download of $LOCAL_FILE_NAME from $DOWNLOAD_URL"
wget -O "$LOCAL_FILE_NAME" --post-data="" --header="Authorization: Token $PIVNET_TOKEN" $DOWNLOAD_URL

echo "Attempting to upload of $LOCAL_FILE_NAME to $OPSMGR_HOST"
curl "https://${OPSMGR_HOST}/api/products" -F "product[file]=@${LOCAL_FILE_NAME}" -X POST -u ${OPSMGR_USER}:${OPSMGR_PASSWORD} -k

echo "$LOCAL_FILE_NAME finished uploading to Ops Manager"
