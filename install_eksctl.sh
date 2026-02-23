# Download the latest release
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Move the binary to /usr/local/bin
sudo mv /tmp/eksctl /usr/local/bin

# Verify installation
eksctl version
