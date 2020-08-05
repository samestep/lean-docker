# Lean in Docker

First make sure you [have Docker installed][get docker]:
```
$ docker --version
Docker version 19.03.12, build 48a66213fe
```
The Docker images in this repo are tagged using shortened Git commit hashes:
```
$ TAG=registry.gitlab.com/sestep/lean-docker:$(git rev-parse HEAD | cut -c-8)
```
You can either download an image:
```
$ docker pull $TAG
```
Or build it yourself:
```
$ docker build -t $TAG .
```
Either way, you should now be able to run it:
```
$ docker run -it $TAG
```

[get docker]: https://docs.docker.com/get-docker/
