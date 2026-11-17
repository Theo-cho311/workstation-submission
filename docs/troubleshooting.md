# 트러블슈팅 2건

두 항목은 **의도적으로 재현하는 실습**입니다. 우연히 발생한 장애라고 쓰지 않습니다. `bash scripts/lab.sh trouble`을 실행한 뒤 실제 로그를 확인해 빈칸을 채웁니다.

## 1. 파일 내용을 읽을 수 없음 — 권한 오류 재현

- 문제: 일반 사용자 소유 실습 파일의 권한을 000으로 설정한 뒤 `cat` 실행이 실패하는지 확인한다.
- 원인 가설: 파일 읽기 권한이 없어 실패했을 것이다.
- 확인: `ls -l practice/locked.txt`의 권한과 `cat` 오류를 비교한다.
- 실제 오류 문구: `cat: practice/locked.txt: 허가 거부`
- 해결: `chmod 644 practice/locked.txt`로 소유자 읽기·쓰기, 그룹/기타 읽기를 부여한다.
- 재검증: 같은 `cat`으로 `permission practice`가 표시되는지 확인한다.
- 실제 재검증 결과: `permission practice` 정상 출력 확인 (종료 코드 0)
- 주의: root는 일반적인 읽기 권한 검사를 우회할 수 있어 이 실험은 일반 사용자로 실행한다.

## 2. 컨테이너 이름 중복 — 종료된 컨테이너도 이름 유지

- 문제: `ws-name-test` 컨테이너를 실행 후 종료시키고 같은 이름으로 다시 run하여 실패를 재현한다.
- 원인 가설: 종료된 컨테이너도 삭제 전까지 존재하므로 이름이 중복된다.
- 확인: `docker ps -a --filter name=ws-name-test`에서 기존 컨테이너를 확인한다.
- 실제 오류 문구: `docker: Error response from daemon: Conflict. The container name "/ws-name-test" is already in use by container "e2bb9b3715599d37780f89d01eacfcc6edb6d39f824a3211d71392ac6a2a44b4". You have to remove (or rename) that container to be able to reuse that name.`
- 해결: 이 실습용 컨테이너만 `docker rm ws-name-test`로 삭제하고 같은 이름으로 다시 실행한다.
- 재검증: `resolved` 출력 및 정상 종료 여부를 확인한다.
- 실제 재검증 결과: `resolved` 정상 출력 후 컨테이너 삭제 완료 (종료 코드 0)
- 대안: 기존 컨테이너를 유지하려면 다른 `--name`을 사용하거나 목적에 따라 `docker start`로 재시작한다.

공통 증거: [실제 명령·출력](../evidence/trouble.md)

## 추가 문제 발생 시 참고 — 수행 사례로 자동 집계하지 않음

| 증상 | 확인 | 해결 방향 |
|---|---|---|
| Cannot connect to Docker daemon | docker info, docker context ls | Docker Desktop/OrbStack 실행, 올바른 context 및 WSL 통합 확인 |
| docker.sock permission denied | id, 소켓 권한 | Linux 관리자에게 권한 설정 요청; 임의로 소켓을 666으로 열지 않음 |
| port already allocated | docker ps, 사용 중인 8080 확인 | 원인을 확인하고 실습 컨테이너만 중지 또는 8081:80 사용. 문서·캡처 주소도 변경 |
| 파일 수정이 화면에 안 보임 | pwd, docker inspect ws-bind, curl | 프로젝트 루트에서 절대 경로로 마운트, 새로고침, 캐시 여부 확인 |
| curl 연결이 즉시 실패 | docker logs ws-web | 시작 시간을 기다려 재시도. 포트와 컨테이너 상태 확인 |
