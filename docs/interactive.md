# 대화형 진입, exec, attach 실습

앞서 `docker` 단계를 완료한 후 진행합니다. 아래 명령어와 출력을 함께 캡처하거나 직접 복사하여 `evidence/interactive.md`의 코드블록에 넣으세요. 도우미의 비대화형 exec만으로는 내부 진입 증거가 충분하지 않으므로 이 단계를 생략하지 않습니다.

## 1. 셸 종료가 컨테이너 종료로 이어지는 경우

```bash
docker run -it --name ws-interactive ubuntu:24.04 bash
```

컨테이너 안에서 입력:

```bash
ls /
echo "interactive ubuntu"
exit
```

호스트로 돌아온 뒤:

```bash
docker ps -a --filter name=ws-interactive
```

이 컨테이너는 주 프로세스인 Bash가 종료되어 Exited 상태가 되어야 합니다.

## 2. exec 셸만 종료하는 경우

```bash
docker exec -it ws-ubuntu bash
```

컨테이너 안에서:

```bash
echo "exec shell"
exit
```

호스트에서:

```bash
docker ps --filter name=ws-ubuntu
```

`ws-ubuntu`는 주 프로세스가 `sleep infinity`이므로 exec로 만든 추가 셸을 종료해도 실행 중입니다.

## 3. attach 후 컨테이너 유지

```bash
docker start -ai ws-interactive
```

컨테이너 안에서 `echo "attached again"`을 입력합니다. 이어서 **Ctrl+P를 누르고 Ctrl+Q**를 눌러 연결만 분리합니다. `exit`나 Ctrl+C와 다릅니다.

호스트에서:

```bash
docker ps --filter name=ws-interactive
```

Running/Up 상태인지 확인합니다. 종료하지 않고 터미널 연결만 빠져나온 것입니다. 키가 터미널에 가로채이면 다른 터미널에서 상태를 확인하고 실제 현상을 적으세요.

## 기록 양식

`evidence/interactive.md`에 실제 명령·출력을 코드블록으로 추가하고, 아래 세 문장의 관찰 결과를 채웁니다.

- 주 프로세스 Bash에서 exit 후 상태: [기입]
- exec로 연 셸에서 exit 후 ws-ubuntu 상태: [기입]
- attach 후 분리 키를 사용한 상태: [기입]
