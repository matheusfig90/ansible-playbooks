setupForMac() {
    echo "Mac OS system detected"
    ./scripts/setup_mac.sh
}

setupForLinux() {
    echo "Linux system detected"
}

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)   setupForLinux;;
  Darwin*)  setupForMac;;
esac

echo "Setting up environments"

cp ansible.cfg $HOME/.ansible.cfg

ansible-playbook -i ./hosts ./profiles/personal.yml

read -e -p "Do you want to setup the development env (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ansible-playbook -i ./hosts ./profiles/development.yml
fi

read -e -p "Do you want to setup the workstation env (y/n? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ansible-playbook -i ./hosts ./profiles/workstation.yml
fi
