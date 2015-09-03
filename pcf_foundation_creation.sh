#!/bin/bash

## create demo users
cf api --skip-ssl-validation $1
### Get admin password after successful install using OpsMgr.
cf login -u admin -p $2 -o system -s console

## create personal accounts
cf create-user jamie password
cf create-user fred password

## Create Personal Org, Spaces and assignments
cf create-org operations
cf create-org acme
cf create-space development -o operations
cf create-space test -o operations
cf create-space production -o operations
cf create-space development -o workshop
cf set-org-role jamie operations OrgManager
cf set-org-role fred operations OrgManager
cf set-space-role jamie operations development SpaceDeveloper
cf set-space-role jamie operations test SpaceDeveloper
cf set-space-role jamie operations production SpaceDeveloper

## Assign users to space
cf set-space-role user1 workshop development SpaceDeveloper
cf set-space-role user2 workshop development SpaceDeveloper
cf set-space-role user3 workshop development SpaceDeveloper
cf set-space-role user4 workshop development SpaceDeveloper
cf set-space-role user5 workshop development SpaceDeveloper
cf set-space-role user6 workshop development SpaceDeveloper
cf set-space-role user7 workshop development SpaceDeveloper
cf set-space-role user8 workshop development SpaceDeveloper
cf set-space-role user9 workshop development SpaceDeveloper
cf set-space-role user10 workshop development SpaceDeveloper
cf set-space-role user11 workshop development SpaceDeveloper
cf set-space-role user12 workshop development SpaceDeveloper
cf set-space-role user13 workshop development SpaceDeveloper
cf set-space-role user14 workshop development SpaceDeveloper
cf set-space-role user15 workshop development SpaceDeveloper

## Assign quota
cf set-quota workshop runaway
cf logout
