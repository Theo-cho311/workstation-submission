# 실제 실행 로그: web

```text

$ cat Dockerfile
FROM nginx:stable-alpine
COPY app/ /usr/share/nginx/html/
EXPOSE 80

$ docker build -t workstation-web:1.0 .
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 105B done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/nginx:stable-alpine
#2 DONE 0.0s

#3 [internal] load .dockerignore
#3 transferring context: 97B done
#3 DONE 0.0s

#4 [1/2] FROM docker.io/library/nginx:stable-alpine
#4 DONE 0.0s

#5 [internal] load build context
#5 transferring context: 59B done
#5 DONE 0.0s

#6 [2/2] COPY app/ /usr/share/nginx/html/
#6 CACHED

#7 exporting to image
#7 exporting layers done
#7 writing image sha256:fc19ad5bb7ce2af64cf4135c06cca76fd3c8a993ac6ba129a08dbb86047dd93e 0.0s done
#7 naming to docker.io/library/workstation-web:1.0 done
#7 DONE 0.0s

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview

$ docker image inspect workstation-web:1.0 --format \{\{.Id\}\}
sha256:fc19ad5bb7ce2af64cf4135c06cca76fd3c8a993ac6ba129a08dbb86047dd93e

$ docker image inspect nginx:stable-alpine --format \{\{json\ .RepoDigests\}\}
["nginx@sha256:901e593c95dc85f5a729f5765516321366ef4ac401821431d408897e95287d0a"]

$ docker run -d --name ws-web -p 127.0.0.1:8080:80 workstation-web:1.0
ebc3779a7d9bc9190d14d8bddb3e22d32a186c7971234ffee5511a50e3f8c7f8

$ docker port ws-web
80/tcp -> 127.0.0.1:8080

$ curl --retry 10 --retry-connrefused --retry-delay 1 -fsS -i http://localhost:8080
HTTP/1.1 200 OK
Server: nginx/1.30.6
Date: Tue, 17 Nov 2026 11:15:09 GMT
Content-Type: text/html
Content-Length: 836
Last-Modified: Tue, 17 Nov 2026 01:34:46 GMT
Connection: keep-alive
ETag: "6afbaf36-344"
Accept-Ranges: bytes

<!doctype html>
<html lang="ko">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>개발 워크스테이션</title>
<style>body{margin:0;background:#edf2f7;color:#152438;font-family:system-ui,sans-serif}main{max-width:760px;margin:12vh auto;padding:40px;background:white;border-radius:20px}h1{font-size:32px}strong{color:#166958}code{background:#eef3f5;padding:5px}footer{margin-top:35px;color:#526274}</style></head>
<body><main><p>DEVELOPMENT WORKSTATION</p><h1>개발 워크스테이션 구축</h1><p>직접 작성한 Dockerfile로 NGINX 웹 서버를 실행합니다.</p><p>페이지 버전: <strong>VERSION_1</strong></p><p>접속 경로: 호스트 <code>8080</code> → 컨테이너 <code>80</code></p><footer>Linux CLI · Docker · Git / GitHub</footer></main></body></html>

$ docker logs ws-web
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/11/17 11:15:08 [notice] 1#1: using the "epoll" event method
2026/11/17 11:15:08 [notice] 1#1: nginx/1.30.6
2026/11/17 11:15:08 [notice] 1#1: built by gcc 15.2.0 (Alpine 15.2.0) 
2026/11/17 11:15:08 [notice] 1#1: OS: Linux 6.8.0-63-generic
2026/11/17 11:15:08 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/11/17 11:15:08 [notice] 1#1: start worker processes
2026/11/17 11:15:08 [notice] 1#1: start worker process 30
2026/11/17 11:15:08 [notice] 1#1: start worker process 31
2026/11/17 11:15:08 [notice] 1#1: start worker process 32
2026/11/17 11:15:08 [notice] 1#1: start worker process 33
2026/11/17 11:15:08 [notice] 1#1: start worker process 34
2026/11/17 11:15:08 [notice] 1#1: start worker process 35
2026/11/17 11:15:08 [notice] 1#1: start worker process 36
2026/11/17 11:15:08 [notice] 1#1: start worker process 37
172.17.0.1 - - [17/Nov/2026:11:15:09 +0000] "GET / HTTP/1.1" 200 836 "-" "curl/8.5.0" "-"

$ docker stats --no-stream ws-web
CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O     PIDS
ebc3779a7d9b   ws-web    0.00%     7.484MiB / 15.27GiB   0.05%     2.51kB / 1.45kB   0B / 8.19kB   9

종료 코드: 0
```
