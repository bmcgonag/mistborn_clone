#!/bin/bash

# Wireguard
if [ "$DISTRO" == "raspbian" ]; then
    echo "Adding Wireguard repo keys"
    sudo apt-get install -y dirmngr
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC
fi

echo "Installing Wireguard"
if [ "$DISTRO" == "ubuntu" ]; then
    # Ubuntu	
    sudo add-apt-repository -y ppa:wireguard/wireguard
elif [ "$DISTRO" == "debian" ] || [ "$DISTRO" == "raspbian" ]; then
    # Debian
    sudo bash -c 'echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list'
    sudo bash -c "printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable"
fi
sudo apt-get update
sudo apt-get install -y openresolv wireguard