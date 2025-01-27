cd /usr/share
sudo mkdir ligolo && cd ligolo
sudo mkdir linux windows

sudo wget \
    https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_agent_0.7.5_linux_amd64.tar.gz \
    https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_proxy_0.7.5_linux_amd64.tar.gz \
    https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_agent_0.7.5_windows_amd64.zip \
    https://github.com/nicocha30/ligolo-ng/releases/download/v0.7.5/ligolo-ng_proxy_0.7.5_windows_amd64.zip

sudo tar -xzf ligolo-ng_agent_0.7.5_linux_amd64.tar.gz
sudo tar -xzf ligolo-ng_proxy_0.7.5_linux_amd64.tar.gz
sudo unzip -o ligolo-ng_agent_0.7.5_windows_amd64.zip
sudo unzip -o ligolo-ng_proxy_0.7.5_windows_amd64.zip

sudo mv agent linux/agent
sudo mv proxy linux/proxy
sudo mv agent.exe windows/agent.exe
sudo mv proxy.exe windows/proxy.exe

sudo rm -f LICENSE README.md *.tar.gz *.zip
