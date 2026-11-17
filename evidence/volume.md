# 실제 실행 로그: volume

```text

$ docker volume create ws-data
ws-data

$ docker run -d --name ws-data-before --mount type=volume\,source=ws-data\,target=/data ubuntu:24.04 sleep infinity
3429a3a6eee152d02776690fab5b2253576c02f22a0a5de2189fa37d7a1b1d27

$ docker exec ws-data-before sh -c echo\ \"persistent-data-2026\"\ \>\ /data/proof.txt

$ docker exec ws-data-before cat /data/proof.txt
persistent-data-2026

$ docker inspect ws-data-before --format \{\{.Id\}\}\ \{\{json\ .Mounts\}\}
3429a3a6eee152d02776690fab5b2253576c02f22a0a5de2189fa37d7a1b1d27 [{"Destination":"/data","Driver":"local","Mode":"z","Name":"ws-data","Propagation":"","RW":true,"Source":"/var/lib/docker/volumes/ws-data/_data","Type":"volume"}]

$ docker stop ws-data-before
ws-data-before

$ docker rm ws-data-before
ws-data-before

$ docker ps -a --filter name=ws-data-before
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

$ docker run -d --name ws-data-after --mount type=volume\,source=ws-data\,target=/data ubuntu:24.04 sleep infinity
760d31a28b95977a144b7a0ca21ee65cc6d0b62506a20c58559dcd69ecf60173

$ docker exec ws-data-after cat /data/proof.txt
persistent-data-2026

$ docker inspect ws-data-after --format \{\{.Id\}\}\ \{\{json\ .Mounts\}\}
760d31a28b95977a144b7a0ca21ee65cc6d0b62506a20c58559dcd69ecf60173 [{"Destination":"/data","Driver":"local","Mode":"z","Name":"ws-data","Propagation":"","RW":true,"Source":"/var/lib/docker/volumes/ws-data/_data","Type":"volume"}]

$ docker volume inspect ws-data
[
    {
        "CreatedAt": "2026-11-17T20:22:02+09:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/ws-data/_data",
        "Name": "ws-data",
        "Options": null,
        "Scope": "local"
    }
]

종료 코드: 0
```
