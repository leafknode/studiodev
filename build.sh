#! /bin/bash

EXPECTED_HOME="re-dev"

if [[ "$PWD" != *"$EXPECTED_HOME" ]]; then 
    echo "Must be run from re-dev repo directory"
    exit 1
fi

echo "Executing Maven Builds"

repos=( "reach-engine" "studio-services" "nimbus" "studio" )

if [[ "$1" == "true" ]]; then
  FLAG="-DskipTests"
fi

for i in "${repos[@]}"
do
  cd ../$i
  mvn clean install $FLAG
done
