# 대화형 실습 결과

상태: 실습 완료.

```text
$ docker run -it --name ws-interactive ubuntu:24.04 bash
# ls / ; echo "interactive ubuntu" ; exit
$ docker ps -a --filter name=ws-interactive
-> STATUS: Exited

$ docker exec -it ws-ubuntu bash
# echo "exec shell" ; exit
$ docker ps --filter name=ws-ubuntu
-> STATUS: Up (실행 유지)

$ docker start -ai ws-interactive
# echo "attached again"
(Ctrl+P, Ctrl+Q로 연결 분리)

$ docker ps --filter name=ws-interactive
CONTAINER ID   IMAGE          COMMAND   CREATED          STATUS          PORTS     NAMES
11a453ef90a6   ubuntu:24.04   "bash"    20 minutes ago   Up 35 seconds             ws-interactive
```

- Bash 주 프로세스 종료 후: 컨테이너가 함께 종료되어 `Exited` 상태가 됨
- exec 셸만 종료 후: 주 프로세스(`sleep infinity`)가 유지되어 `Up` 상태 유지
- attach 연결만 분리 후: `Ctrl+P, Ctrl+Q`로 터미널 연결만 분리되어 컨테이너는 `Up 35 seconds` 실행 상태 유지
