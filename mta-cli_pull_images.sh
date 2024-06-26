#!/bin/bash
version="7.1.0"
declare -A images
declare -A hashes

if [ "$1" == "docker" ]; then
    CMD="docker"
else
    CMD="podman"
fi

echo "Attention, using $CMD as container engine"
echo "Pulling D/S images..."
for item in java generic dotnet; do
    package=$(cat output.txt | grep registry | grep "$item" | cut -d "\"" -f 2|cut -d "/" -f 3)
    $CMD pull "registry-proxy.engineering.redhat.com/rh-osbs/mta-$package"
done

echo --------------------
echo "Getting hash..."
for item in java generic dotnet; do
    hashes[$item]=$($CMD images | grep "$item" | grep none | awk '{print $3}')
    echo "$item's hash is ${hashes[$item]}"
done

echo --------------------
echo "Tagging images..."
for item in java generic dotnet; do
    $CMD tag ${hashes[$item]} "registry.redhat.io/mta/mta-$item-external-provider-rhel9:$version"
    echo "$item image is tagged"
done