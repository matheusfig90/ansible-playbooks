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

ansible-playbook -i ./hosts ./personal.yml
ansible-playbook -i ./hosts ./development.local.yml