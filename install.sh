#!/bin/bash

# Check distribution type
if [ -f /etc/os-release ]; then
  # Extract ID from os-release (e.g., debian, ubuntu, centos, rhel)
  DISTRO=$(source /etc/os-release && echo $ID)
elif [ -f /etc/lsb-release ]; then
  # Extract DISTRIB_ID from lsb-release (e.g., Debian, Ubuntu)
  DISTRO=$(source /etc/lsb-release && echo $DISTRIB_ID)
else
  echo "Unsupported distribution. Exiting..."
  exit 1
fi

# Install based on distro type
case "$DISTRO" in
  debian|ubuntu)
    sudo apt-get update && sudo apt-get install -y make
    ;;
  centos|rhel|fedora)
    sudo yum install -y make
    ;;
  *)
    echo "Make installation for $DISTRO not implemented yet."
    ;;
esac

echo "Make installation complete."

