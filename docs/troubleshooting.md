# 트러블슈팅 기록 (2건)

## 1. 파일 읽기 권한 부족 (`Permission denied`)

- **문제 상황:** 실습 파일(`practice/locked.txt`)의 권한이 `000`(`----------`)으로 설정된 상태에서 `cat practice/locked.txt` 실행 시 파일 내용을 읽지 못하고 오류 발생.
- **원인 가설:** 소유자(User)를 포함한 모든 주체의 읽기(`r`) 권한이 제거되어 파일 접근이 거부되었을 것이다.
- **확인 과정:** `ls -l practice/locked.txt`로 권한 비트(`----------`)를 확인하고 `cat` 실행 시의 오류 메시지를 대조함.
  - 오류 출력: `cat: practice/locked.txt: 허가 거부`
- **해결 방법:** `chmod 644 practice/locked.txt` 명령을 수행하여 소유자에게 읽기·쓰기(`rw-`), 그룹 및 기타 사용자에게 읽기(`r--`) 권한을 부여함.
- **재검증 결과:** 권한 변경 후 `ls -l`에서 `-rw-r--r--`을 확인하고, `cat practice/locked.txt` 재실행 시 `permission practice`가 정상 출력됨.

---

## 2. Docker 컨테이너 이름 중복 (`Conflict`)

- **문제 상황:** `--name ws-name-test` 옵션으로 컨테이너를 실행·종료한 뒤, 동일한 이름(`ws-name-test`)으로 다시 `docker run`을 실행하자 컨테이너 생성이 실패함.
- **원인 가설:** 컨테이너 프로세스가 종료(`Exited`)되었더라도 컨테이너 객체 자체는 삭제되기 전까지 Docker 데몬에 남아 이름을 점유하고 있을 것이다.
- **확인 과정:** `docker ps -a --filter name=ws-name-test`로 중지된 컨테이너(`Exited (0)`)가 존재하는 것을 확인함.
  - 오류 출력: `docker: Error response from daemon: Conflict. The container name "/ws-name-test" is already in use by container "...". You have to remove (or rename) that container to be able to reuse that name.`
- **해결 방법:** 기존 종료 컨테이너를 `docker rm ws-name-test`로 삭제한 후 동일한 이름으로 재실행함.
- **재검증 결과:** 재실행 시 `resolved`가 정상 출력되었으며, 실습 후 `docker rm ws-name-test`로 정리 완료함.
- **대안:** 기존 컨테이너의 상태와 데이터를 유지해야 하는 경우 `docker start ws-name-test`로 재시작하거나, 새로운 `--name`을 지정하여 별도 컨테이너로 실행한다.

---

- **수행 로그 원본:** [`evidence/trouble.md`](../evidence/trouble.md)
