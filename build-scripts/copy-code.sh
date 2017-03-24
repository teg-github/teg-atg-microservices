#!/bin/sh
source ~/env.properties
echo Details --- $UPSELL_ENABLED
if [ $UPSELL_ENABLED -eq 1 ];
then
  echo "Its 1"
  cp -rf ./Build-Configurations/enabled/ActorChainRestRegistry.properties ./MicroServices/config/atg/rest/registry/ActorChainRestRegistry.properties
else
  echo "Its 0"
  cp -rf ./Build-Configurations/disabled/ActorChainRestRegistry.properties ./MicroServices/config/atg/rest/registry/ActorChainRestRegistry.properties
fi
