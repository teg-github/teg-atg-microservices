#!/bin/sh
if grep "getUpsellForProduct" ./MicroServices/config/atg/rest/registry/ActorChainRestRegistry.properties
then
    echo UPSELL_ENABLED=1 > ~/env.properties
else
    echo UPSELL_ENABLED=0 > ~/env.properties
fi
