#!/bin/sh
if grep -Fxq "getUpsellForProduct" ../MicroServices/atg/rest/registry/ActorChainRegistry.properties
then
    echo UPSELL_ENABLED=1 > ~/env.properties
else
    echo UPSELL_ENABLED=0 > ~/env.properties
fi
