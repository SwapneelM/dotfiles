#!/usr/bin/bash

# Run tests to verify the packages installed by the installation script

# Show OS info when opening a new terminal
if neofetch; then
    echo ""
else
    echo "Neofetch isn't installed automatically so you will have to run a manual install"
    echo "For Linux you can try"
    echo -e "\t sudo apt-get install neofetch"
    echo -e "\n"
    echo "For OS X you can try"
    echo -e "\t brew install neofetch"
    echo "For RHEL/Fedora/CentOS you can try"
    echo -e "\t sudo yum install neofetch"
    echo "For more platforms or in case of errors take a look at installation instructions"
    echo -e "\t https://github.com/dylanaraps/neofetch/wiki/Installation"
fi

# Test the fortune package installed for spouting wise quotes
if fortune | cowsay; then
    echo "The fortune package has been installed successfully"
else
    echo "Fortune has not been installed"
    echo "Please ensure you have Python 2/3 installed on your system and run"
    echo -e "\t $ pip install fortune"
fi

# Test the thefuck package that auto-corrects mistyped commands
if thefuck; then
    echo "The thefuck package has been  installed successfully"
else
    echo "thefuck has not been installed"
    echo "Please ensure you have Python 2/3 installed on your system and run"
    echo -e "\t $ pip install thefuck"
fi

echo "In case of errors please open an issue at"
echo -e "\t https://github.com/swapneelm/dotfiles"

echo "Thank you for running the tests"
echo "Please feel free to offer your feedback at swapneel.mehta96@gmail.com"
