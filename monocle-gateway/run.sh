#!/bin/bash
# Generate monocle.token
MONOCLE_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI2YTYyYmQwOC01MTNjLTRmNTItYTdkNC00Njg3ZmIzYTU4M2YiLCJpc3MiOiJtb25vY2xlIiwicm9sZSI6IkFQSSIsInN1YiI6IlU6Y2I0YmZkYjgtOWZkOS00MmVlLWFiMjgtYWFjY2JlNGE2MTM3IiwiYXVkIjoiYXBpIiwiaWF0IjoxNzAyODIyMTEyfQ.Eh3JLR4BcqvbEXWO79HNwlYUnsnudPP4gKGS_ECYOyM"
if [ "$MONOCLE_TOKEN" -gt "0" ]; then
   MONOCLE_TOKEN_VALUE=MONOCLE_TOKEN

   if [ "$MONOCLE_TOKEN_VALUE" = "-" ] || [ "$MONOCLE_TOKEN_VALUE" = "your_very_long_token" ] ; then       
      exit 1
   fi

   rm -f /etc/monocle/monocle.token
   echo "$MONOCLE_TOKEN_VALUE"   > /etc/monocle/monocle.token
   /usr/local/bin/monocle-gateway
fi  