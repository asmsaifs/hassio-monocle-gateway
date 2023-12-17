#!/usr/bin/with-contenv bashio
# Generate monocle.token
MONOCLE_TOKEN=$(bashio::config 'monocle_token | length')
if [ "$MONOCLE_TOKEN" -gt "0" ]; then
   MONOCLE_TOKEN_VALUE=$(bashio::config 'monocle_token')

   if [ "$MONOCLE_TOKEN_VALUE" = "-" ] || [ "$MONOCLE_TOKEN_VALUE" = "your_very_long_token" ] ; then       
      exit 1
   fi

   rm -f /etc/monocle/monocle.token
   echo "$MONOCLE_TOKEN_VALUE"   > /etc/monocle/monocle.token
   /usr/local/bin/monocle-gateway
fi  