# 실제 실행 로그: terminal

```text

$ pwd
/home/silver/다운로드/workstation_submission/workstation-submission

$ ls -la
합계 60
drwxrwxr-x 8 silver silver 4096 11월 17 20:28 .
drwxrwxr-x 3 silver silver 4096 11월 17 19:29 ..
-rw-r--r-- 1 silver silver   57 11월 17 10:34 .dockerignore
drwxrwxr-x 8 silver silver 4096 11월 17 20:44 .git
-rw-r--r-- 1 silver silver   58 11월 17 10:34 .gitignore
-rw-r--r-- 1 silver silver   68 11월 17 19:40 Dockerfile
-rw-r--r-- 1 silver silver 7087 11월 17 20:43 README.md
-rw-r--r-- 1 silver silver 4516 11월 17 10:35 START_HERE.md
drwxrwxr-x 2 silver silver 4096 11월 17 20:20 app
drwxrwxr-x 2 silver silver 4096 11월 17 19:29 docs
drwxrwxr-x 3 silver silver 4096 11월 17 20:48 evidence
drwxrwxr-x 2 silver silver 4096 11월 17 20:22 practice
drwxrwxr-x 2 silver silver 4096 11월 17 19:29 scripts

$ mkdir -p practice/permissions

$ cd practice

$ pwd
/home/silver/다운로드/workstation_submission/workstation-submission/practice

$ touch empty.txt

$ bash -c printf\ \"CLI\ practice\\n\"\ \>\ original.txt

$ cat original.txt
CLI practice

$ cp original.txt copied.txt

$ mv copied.txt renamed.txt

$ ls -la
합계 24
drwxrwxr-x 3 silver silver 4096 11월 17 20:48 .
drwxrwxr-x 8 silver silver 4096 11월 17 20:28 ..
-rw-rw-r-- 1 silver silver    0 11월 17 20:48 empty.txt
-rw-r--r-- 1 silver silver   20 11월 17 20:22 locked.txt
-rw-rw-r-- 1 silver silver   13 11월 17 20:48 original.txt
drwxrwxr-x 2 silver silver 4096 11월 17 20:48 permissions
-rw-rw-r-- 1 silver silver   13 11월 17 20:48 renamed.txt

$ rm renamed.txt

$ ls -la
합계 20
drwxrwxr-x 3 silver silver 4096 11월 17 20:48 .
drwxrwxr-x 8 silver silver 4096 11월 17 20:28 ..
-rw-rw-r-- 1 silver silver    0 11월 17 20:48 empty.txt
-rw-r--r-- 1 silver silver   20 11월 17 20:22 locked.txt
-rw-rw-r-- 1 silver silver   13 11월 17 20:48 original.txt
drwxrwxr-x 2 silver silver 4096 11월 17 20:48 permissions

$ touch permissions/sample.txt

$ chmod 600 permissions/sample.txt

$ chmod 700 permissions

$ ls -ld permissions permissions/sample.txt
drwx------ 2 silver silver 4096 11월 17 20:48 permissions
-rw------- 1 silver silver    0 11월 17 20:48 permissions/sample.txt

$ chmod 644 permissions/sample.txt

$ chmod 755 permissions

$ ls -ld permissions permissions/sample.txt
drwxr-xr-x 2 silver silver 4096 11월 17 20:48 permissions
-rw-r--r-- 1 silver silver    0 11월 17 20:48 permissions/sample.txt

$ cd ..

$ pwd
/home/silver/다운로드/workstation_submission/workstation-submission

종료 코드: 0
```
