#!/bin/bash
cd ../simulatorUI/simulator-ui/
npm run build
cd -


cp -r ../simulatorUI/simulator-ui/dist/* .

# vue will build thinking router is being used and everything is under /.
# use sed to include repo-name: /js becomes /SentinelSoar/js
echo "Edit relative URLs for Github"
sed -i -e 's/src="\/js/ src="\/SentinelSoar\/js/g' index.html
sed -i -e 's/href="\/favicon.ico/href="\/SentinelSoar\/favicon.ico/g' index.html
sed -i -e 's/href="\/css\/app/href="\/SentinelSoar\/css\/app/g' index.html

echo "Done"
ls -alhtr .
echo ""
grep --color "/SentinelSoar" index.html

# odd bug
if [ -f "index.html-e" ] ; then
    rm "index.html-e"
fi