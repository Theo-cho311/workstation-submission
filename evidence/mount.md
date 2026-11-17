# 실제 실행 로그: mount

```text

$ docker stop ws-web
ws-web

$ docker run -d --name ws-bind -p 127.0.0.1:8080:80 --mount type=bind\,source=/home/silver/다운로드/workstation_submission/workstation-submission/app\,target=/usr/share/nginx/html\,readonly workstation-web:1.0
8338edc9ac4a3f4f199facfdcb19a67b21448175e45e5494a32996f8192610c1

$ curl --retry 10 --retry-all-errors --retry-delay 1 -fsS http://localhost:8080
curl: (56) Recv failure: 상대편이 연결을 끊음
<!doctype html>
<html lang="ko">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>개발 워크스테이션</title>
<style>body{margin:0;background:#edf2f7;color:#152438;font-family:system-ui,sans-serif}main{max-width:760px;margin:12vh auto;padding:40px;background:white;border-radius:20px}h1{font-size:32px}strong{color:#166958}code{background:#eef3f5;padding:5px}footer{margin-top:35px;color:#526274}</style></head>
<body><main><p>DEVELOPMENT WORKSTATION</p><h1>개발 워크스테이션 구축</h1><p>직접 작성한 Dockerfile로 NGINX 웹 서버를 실행합니다.</p><p>페이지 버전: <strong>VERSION_1</strong></p><p>접속 경로: 호스트 <code>8080</code> → 컨테이너 <code>80</code></p><footer>Linux CLI · Docker · Git / GitHub</footer></main></body></html>
★ 브라우저에서 VERSION_1 화면을 캡처하세요: 04-bind-before.png
캡처를 저장했으면 Enter: 
$ bash -c sed\ \"s/VERSION_1/VERSION_2/g\"\ app/index.html\ \>\ app/index.html.tmp\ \&\&\ mv\ app/index.html.tmp\ app/index.html

$ curl -fsS http://localhost:8080
<!doctype html>
<html lang="ko">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>개발 워크스테이션</title>
<style>body{margin:0;background:#edf2f7;color:#152438;font-family:system-ui,sans-serif}main{max-width:760px;margin:12vh auto;padding:40px;background:white;border-radius:20px}h1{font-size:32px}strong{color:#166958}code{background:#eef3f5;padding:5px}footer{margin-top:35px;color:#526274}</style></head>
<body><main><p>DEVELOPMENT WORKSTATION</p><h1>개발 워크스테이션 구축</h1><p>직접 작성한 Dockerfile로 NGINX 웹 서버를 실행합니다.</p><p>페이지 버전: <strong>VERSION_2</strong></p><p>접속 경로: 호스트 <code>8080</code> → 컨테이너 <code>80</code></p><footer>Linux CLI · Docker · Git / GitHub</footer></main></body></html>

$ docker ps --filter name=ws-bind
CONTAINER ID   IMAGE                 COMMAND                   CREATED              STATUS              PORTS                    NAMES
8338edc9ac4a   workstation-web:1.0   "/docker-entrypoint.…"   About a minute ago   Up About a minute   127.0.0.1:8080->80/tcp   ws-bind
★ 브라우저를 새로고침하고 VERSION_2 화면을 캡처하세요: 05-bind-after.png
캡처를 저장했으면 Enter: 
$ bash -c sed\ \"s/VERSION_2/VERSION_1/g\"\ app/index.html\ \>\ app/index.html.tmp\ \&\&\ mv\ app/index.html.tmp\ app/index.html

$ docker stop ws-bind
ws-bind

$ docker start ws-web
ws-web

종료 코드: 0
```
