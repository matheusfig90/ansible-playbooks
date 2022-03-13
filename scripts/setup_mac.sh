echo "Installing requirements for Mac OS systems"

if ! [ -x "$(command -v brew)" ]; then
    echo "Brew not installed, installing it."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "Brew installed, updating and upgrading it."
    brew update
    brew upgrade
fi

if ! [ -x "$(command -v ansible-playbook)" ]; then
    echo "Ansible not installed, installing it."
    brew install ansible
else
    echo "Ansible installed, skipping installation."
fi