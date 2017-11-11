#!/bin/bash -ex

#BODY=$(jo url=https://images-fe.ssl-images-amazon.com/images/I/61rNsZ7iQZL.jpg)
BODY=$(jo url=https://images-fe.ssl-images-amazon.com/images/I/51%2BInxWXisL.jpg)
echo $BODY

@ECHO OFF

curl -v -X POST "https://westcentralus.api.cognitive.microsoft.com/vision/v1.0/analyze?visualFeatures=adult&language=en" \
-H "Content-Type: application/json" \
-H "Ocp-Apim-Subscription-Key: $SUBSCRIPTION_KEY" \
--data-ascii "$BODY"
