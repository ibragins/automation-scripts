#!/bin/bash
version="7.2.0"
declare -A images
declare -A hashes

if [ "$1" == "docker" ]; then
    CMD="docker"
else
    CMD="podman"
fi

echo "Attention, using $CMD as container engine"
echo "Pulling D/S images..."
for item in java generic dotnet cli; do
    package=$(cat output.txt | grep registry | grep "$item" | cut -d "\"" -f 2|cut -d "/" -f 3)
    $CMD pull "registry-proxy.engineering.redhat.com/rh-osbs/mta-$package"
done

echo --------------------
echo "Getting hash..."
for item in java generic dotnet cli; do
    hashes[$item]=$($CMD images | grep "$item" | grep none | awk '{print $3}')
    echo "$item's hash is ${hashes[$item]}"
done

echo --------------------
echo "Tagging images..."
for item in java generic dotnet cli; do
    image=$(cat output.txt | grep registry | grep "$item" | cut -d "\"" -f 2|cut -d "/" -f 3|cut -d "@" -f 1)
    $CMD tag ${hashes[$item]} "registry.redhat.io/mta/$image:$version"
    echo "$item image is tagged"
done
# $CMD tag ${hashes[dotnet]} "registry.redhat.io/mta/mta-dotnet-external-provider-rhel8:$version"
# $CMD tag ${hashes[cli]} "registry.redhat.io/mta/mta-cli-rhel9:$version"
echo "cli image is tagged"

if [ ! -d "$HOME/bin" ]; then
  mkdir "$HOME/bin"
fi
$CMD cp $($CMD create ${hashes[cli]}):/usr/local/bin/mta-cli ~/bin/
