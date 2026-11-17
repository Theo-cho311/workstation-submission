# 실제 실행 로그: trouble

```text

$ mkdir -p practice

$ bash -c printf\ \"permission\ practice\\n\"\ \>\ practice/locked.txt

$ chmod 000 practice/locked.txt

$ ls -l practice/locked.txt
---------- 1 silver silver 20 11월 17 20:22 practice/locked.txt

$ cat practice/locked.txt
cat: practice/locked.txt: 허가 거부

$ chmod 644 practice/locked.txt

$ cat practice/locked.txt
permission practice

$ docker run --name ws-name-test ubuntu:24.04 echo first
first

$ docker run --name ws-name-test ubuntu:24.04 echo second
docker: Error response from daemon: Conflict. The container name "/ws-name-test" is already in use by container "e2bb9b3715599d37780f89d01eacfcc6edb6d39f824a3211d71392ac6a2a44b4". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.

$ docker ps -a --filter name=ws-name-test
CONTAINER ID   IMAGE          COMMAND        CREATED                  STATUS                              PORTS     NAMES
e2bb9b371559   ubuntu:24.04   "echo first"   Less than a second ago   Exited (0) Less than a second ago             ws-name-test

$ docker rm ws-name-test
ws-name-test

$ docker run --name ws-name-test ubuntu:24.04 echo resolved
resolved

$ docker rm ws-name-test
ws-name-test

종료 코드: 0
```
