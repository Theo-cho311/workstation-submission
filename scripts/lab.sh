#!/usr/bin/env bash
# 실제 실습 PC에서 단계별 실행. Docker 설치·권한·로그인 설정은 변경하지 않습니다.
set -Eeuo pipefail
cd "$(dirname "$0")/.."
mkdir -p evidence
step="${1:-}"
case "$step" in env|terminal|docker|web|mount|volume|trouble) ;; *) echo '사용: bash scripts/lab.sh env|terminal|docker|web|mount|volume|trouble'; exit 2;; esac
log="evidence/${step}.md"
if [ -e "$log" ]; then echo "$log 파일이 이미 있습니다. 이전 로그를 다른 이름으로 보관한 후 다시 실행하세요."; exit 1; fi
exec > >(tee "$log") 2>&1
printf '# 실제 실행 로그: %s\n\n```text\n' "$step"
trap 'rc=$?; printf "\n종료 코드: %s\n\140\140\140\n" "$rc"' EXIT
run() { printf '\n$'; printf ' %q' "$@"; printf '\n'; "$@"; }
expected_fail() { printf '\n$'; printf ' %q' "$@"; printf '\n'; if "$@"; then echo '예상 오류가 발생하지 않았습니다. 원인을 확인하세요.'; return 1; else echo '예상한 실패를 관찰했습니다.'; fi; }
if [ "$step" = env ]; then
 run date
 run uname -a
 if [ -f /etc/os-release ]; then run cat /etc/os-release; else run sw_vers; fi
 run bash --version
 run printenv SHELL
 run git --version
 run docker --version
 run docker info
elif [ "$step" = terminal ]; then
 run pwd
 run ls -la
 run mkdir -p practice/permissions
 run cd practice
 run pwd
 run touch empty.txt
 run bash -c 'printf "CLI practice\n" > original.txt'
 run cat original.txt
 run cp original.txt copied.txt
 run mv copied.txt renamed.txt
 run ls -la
 run rm renamed.txt
 run ls -la
 run touch permissions/sample.txt
 run chmod 600 permissions/sample.txt
 run chmod 700 permissions
 run ls -ld permissions permissions/sample.txt
 run chmod 644 permissions/sample.txt
 run chmod 755 permissions
 run ls -ld permissions permissions/sample.txt
 run cd ..
 run pwd
elif [ "$step" = docker ]; then
 run docker pull hello-world
 run docker run --name ws-hello hello-world
 run docker pull ubuntu:24.04
 run docker run -d --name ws-ubuntu ubuntu:24.04 sleep infinity
 run docker exec ws-ubuntu sh -c 'ls /; echo "inside ubuntu"'
 run docker images
 run docker ps
 run docker logs ws-hello
 run docker stats --no-stream ws-ubuntu
 run docker stop ws-ubuntu
 run docker ps -a
 run docker start ws-ubuntu
elif [ "$step" = web ]; then
 run cat Dockerfile
 run docker build -t workstation-web:1.0 .
 run docker image inspect workstation-web:1.0 --format '{{.Id}}'
 run docker image inspect nginx:stable-alpine --format '{{json .RepoDigests}}'
 run docker run -d --name ws-web -p 127.0.0.1:8080:80 workstation-web:1.0
 run docker port ws-web
 run curl --retry 10 --retry-connrefused --retry-delay 1 -fsS -i http://localhost:8080
 run docker logs ws-web
 run docker stats --no-stream ws-web
elif [ "$step" = mount ]; then
 run docker stop ws-web
 run docker run -d --name ws-bind -p 127.0.0.1:8080:80 --mount "type=bind,source=$(pwd)/app,target=/usr/share/nginx/html,readonly" workstation-web:1.0
 run curl --retry 10 --retry-all-errors --retry-delay 1 -fsS http://localhost:8080
 echo '★ 브라우저에서 VERSION_1 화면을 캡처하세요: 04-bind-before.png'
 read -r -p '캡처를 저장했으면 Enter: '
 run bash -c 'sed "s/VERSION_1/VERSION_2/g" app/index.html > app/index.html.tmp && mv app/index.html.tmp app/index.html'
 run curl -fsS http://localhost:8080
 run docker ps --filter name=ws-bind
 echo '★ 브라우저를 새로고침하고 VERSION_2 화면을 캡처하세요: 05-bind-after.png'
 read -r -p '캡처를 저장했으면 Enter: '
 run bash -c 'sed "s/VERSION_2/VERSION_1/g" app/index.html > app/index.html.tmp && mv app/index.html.tmp app/index.html'
 run docker stop ws-bind
 run docker start ws-web
elif [ "$step" = volume ]; then
 run docker volume create ws-data
 run docker run -d --name ws-data-before --mount type=volume,source=ws-data,target=/data ubuntu:24.04 sleep infinity
 run docker exec ws-data-before sh -c 'echo "persistent-data-2026" > /data/proof.txt'
 run docker exec ws-data-before cat /data/proof.txt
 run docker inspect ws-data-before --format '{{.Id}} {{json .Mounts}}'
 run docker stop ws-data-before
 run docker rm ws-data-before
 run docker ps -a --filter name=ws-data-before
 run docker run -d --name ws-data-after --mount type=volume,source=ws-data,target=/data ubuntu:24.04 sleep infinity
 run docker exec ws-data-after cat /data/proof.txt
 run docker inspect ws-data-after --format '{{.Id}} {{json .Mounts}}'
 run docker volume inspect ws-data
elif [ "$step" = trouble ]; then
 if [ "$(id -u)" = 0 ]; then echo '권한 오류 실습은 root가 아닌 일반 사용자로 실행하세요.'; exit 1; fi
 run mkdir -p practice
 run bash -c 'printf "permission practice\n" > practice/locked.txt'
 run chmod 000 practice/locked.txt
 run ls -l practice/locked.txt
 expected_fail cat practice/locked.txt
 run chmod 644 practice/locked.txt
 run cat practice/locked.txt
 run docker run --name ws-name-test ubuntu:24.04 echo first
 expected_fail docker run --name ws-name-test ubuntu:24.04 echo second
 run docker ps -a --filter name=ws-name-test
 run docker rm ws-name-test
 run docker run --name ws-name-test ubuntu:24.04 echo resolved
 run docker rm ws-name-test
fi
