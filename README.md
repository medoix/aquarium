# aquarium
Terminal ASCII aquarium as a Docker container

## Installation
Install [Docker](https://docs.docker.com/engine/installation/)

zshrc/bashrc
```
alias aquarium="docker run --rm -t docker.pkg.github.com/medoix/aquarium/aquarium:latest"
```

manual build
```
docker build -t aquarium .
docker run --rm -t aquarium
```
