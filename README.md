# Sample scripts to automate common PCF tasks

* PCF Foundation Creation - This script provides post-installation set up for a foundation including organizations, spaces, users (if desired), quotas, etc. It uses the CF CLI to create these constructs and requires a user and password with the correct permissions. The script can be run multiple times w/o impacting the existing installation and it will any existing items with a message stating it already exist.

* PCF Tile Maintenance - This example script makes managing tiles in Ops Manager easy by using the API feature of http://network.pivotal.io to download tiles and upload them to Ops Manager using its API. The script is best executed on the Ops Manager VM to reduce download requirements. Please see https://network.pivotal.io/docs/api for details on using the Pivotal Network API.
