#!/bin/bash

# ================================================================================
# Install zsh and start setup for specific distro
# ================================================================================

set -e

if grep openSUSE /etc/os-release 2>&1; then
	sudo zypper install zsh
	zsh ./init-openSUSE.zsh
else
	echo "This distro is not yet supported"
fi

