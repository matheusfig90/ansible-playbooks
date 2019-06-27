echo "Installing ansible playbooks..."

# Use /tmp like current directory
cd /tmp

echo "Downloading repository from github"
curl -s https://codeload.github.com/matheusfig90/ansible-playbooks/zip/master --output ansible-playbooks.zip

echo "Uncompressing repository"
unzip -q ansible-playbooks.zip

echo "Removing compress file"
rm -rf ansible-playbooks.zip 

# Set a new current directory
cd ansible-playbooks-master/

./scripts/setup.sh
