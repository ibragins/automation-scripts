#!/bin/bash
version="7.1.0"
images=("java" "generic" "dotnet" "cli")
hashes=()

if [ "$1" == "docker" ]; then
    CMD="docker"
else
    CMD="podman"
fi

echo "Attention, using $CMD as container engine"
echo "Pulling D/S images..."
for item in "${images[@]}"; do
    package=$(grep registry output.txt | grep "$item" | cut -d "\"" -f 2 | cut -d "/" -f 3)
    $CMD pull "brew.registry.redhat.io/rh-osbs/mta-$package"
done

echo --------------------
echo "Getting hash..."
for item in "${images[@]}"; do
    hash=$($CMD images | grep "$item" | grep none | awk '{print $3}')
    hashes+=("$hash")
    echo "$item's hash is $hash"
done

echo --------------------
echo "Tagging images..."
for i in "${!images[@]}"; do
    item=${images[$i]}
    hash=${hashes[$i]}
    if [ "$item" != "cli" ]; then
        $CMD tag "$hash" "registry.redhat.io/mta/mta-$item-external-provider-rhel9:$version"
        echo "$item image is tagged"
    else
        $CMD tag "$hash" "registry.redhat.io/mta/mta-cli-rhel9:$version"
        echo "cli image is tagged"
        if [ ! -d "$HOME/bin" ]; then
            mkdir "$HOME/bin"
        fi
        $CMD cp $($CMD create "$hash"):/usr/local/bin/darwin-mta-cli ~/bin/
    fi
done
