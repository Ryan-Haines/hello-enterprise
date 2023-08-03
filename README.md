# hello-enterprise
Hello-world, with all the enterprise features

install nodeJS on raspberry pi:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
source ~/.zshrc
nvm install node
```

Install Docker prerequisites:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o docker.gpg

sudo mv docker.gpg /etc/apt/trusted.gpg.d/
```


Add the repository:

```
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
Update the package list:

`sudo apt-get update`

Install Docker CE:


`sudo apt-get install -y docker-ce`

Add your user to the Docker group (replace 'username' with your actual username):


`sudo usermod -aG docker username`

Reboot your system:

`sudo reboot`

Test Docker installation:

docker --version
docker run hello-world