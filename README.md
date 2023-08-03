# hello-enterprise
Hello-world, with all the enterprise features

## prerequisites
install nodeJS on raspberry pi:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
source ~/.zshrc
nvm install node
```

install workaround for unmaintained hello-world for react:
`npm install --save-dev @babel/plugin-proposal-private-property-in-object`

install the rest of the requirements
`npm install`

test that the build works:
`npm run build`

## docker install
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

now configure buildkit:

`echo "export DOCKER_BUILDKIT=1" >> ~/.zshrc `

## Building with docker

the `my-enterprise-app` is semantic, `.` builds in pwd

if you want to test that docker is working,
`docker build -t my-enterprise-app .`

build takes about 10 minutes(!)
delete build from the local registry:
```
# get list of images
docker images

then remove based on repository and tag
docker rmi repository:tag
```

run over LAN at port 8080:
`docker run -p 8080:80 my-enterprise-app`

great, it works!

## create the docker registry for building with CI

`kubectl apply -f registry-deployment.yaml`

to prune builds to this registry:

```
docker images --format '{{.Repository}}:{{.Tag}}' | grep -v ':latest' | xargs -r docker rmi
```

REPOS=$(curl -s -X GET http://localhost:5000/v2/_catalog | jq -r '.repositories[]')


navigate to your jenkins panel 