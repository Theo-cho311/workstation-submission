# 실제 실행 로그: docker

```text

$ docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:1e4c05b897a751332ce85c7e9449da2d93514ea2dea6dbb0e2753c9e949b2bfa
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview hello-world

$ docker run --name ws-hello hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/


$ docker pull ubuntu:24.04
24.04: Pulling from library/ubuntu
26538842dfbf: Pulling fs layer
26538842dfbf: Download complete
26538842dfbf: Pull complete
Digest: sha256:73b999393d07f2bf65a40373778a44dc9a6d54ad7718d29247d8ff9413c4d6a8
Status: Downloaded newer image for ubuntu:24.04
docker.io/library/ubuntu:24.04

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview ubuntu:24.04

$ docker run -d --name ws-ubuntu ubuntu:24.04 sleep infinity
705f8530c01da4d216a5a434c566f392dd730d90c47ea0b12e8b9852dc53200b

$ docker exec ws-ubuntu sh -c ls\ /\;\ echo\ \"inside\ ubuntu\"
bin
boot
dev
etc
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
inside ubuntu

$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
my-web        1.0       8a8e50b2cbd0   5 days ago     63MB
ubuntu        24.04     7da97f743f39   7 days ago     78.2MB
hello-world   latest    e2ac70e7319a   7 months ago   10.1kB
ubuntu        latest    febc1a2eec1f   56 years ago   102MB

$ docker ps
CONTAINER ID   IMAGE          COMMAND            CREATED         STATUS                  PORTS     NAMES
705f8530c01d   ubuntu:24.04   "sleep infinity"   2 seconds ago   Up Less than a second             ws-ubuntu

$ docker logs ws-hello

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/


$ docker stats --no-stream ws-ubuntu
CONTAINER ID   NAME        CPU %     MEM USAGE / LIMIT   MEM %     NET I/O       BLOCK I/O   PIDS
705f8530c01d   ws-ubuntu   0.00%     424KiB / 15.27GiB   0.00%     2.05kB / 0B   0B / 0B     1

$ docker stop ws-ubuntu
ws-ubuntu

$ docker ps -a
CONTAINER ID   IMAGE          COMMAND            CREATED          STATUS                                PORTS     NAMES
705f8530c01d   ubuntu:24.04   "sleep infinity"   14 seconds ago   Exited (137) Less than a second ago             ws-ubuntu
fc75cd34154f   hello-world    "/hello"           26 seconds ago   Exited (0) 25 seconds ago                       ws-hello
a0b3ebe47f46   ubuntu         "bash"             5 days ago       Exited (137) 5 days ago                         loving_bose
f1318131eba4   ubuntu         "bash"             5 days ago       Exited (0) 5 days ago                           keen_poincare
63cfb85f65d3   hello-world    "/hello"           5 days ago       Exited (0) 5 days ago                           elastic_mcnulty
3d990fb9a611   hello-world    "/hello"           5 days ago       Exited (0) 5 days ago                           keen_northcutt

$ docker start ws-ubuntu
ws-ubuntu

종료 코드: 0
```
