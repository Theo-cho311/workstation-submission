# 저녁 7시 실습 시작 안내

이 묶음은 **다른 PC로 옮겨 사용할 준비 파일**입니다. 현재 PC에 설치할 필요가 없습니다.
아직 실제 수행 완료본이 아닙니다. Docker 실행 로그·브라우저 캡처·GitHub 연동을 실습 PC에서 채운 뒤 저장소 링크로 제출합니다. ZIP 자체가 최종 제출물은 아닙니다.

## 1. 실습 PC에서 확인

- Linux 또는 WSL의 Bash를 기준으로 작성했습니다. Windows PowerShell에 그대로 붙여 넣지 마세요.
- macOS도 Bash로 실행할 수 있습니다.
- Windows는 WSL2 Ubuntu + Docker Desktop의 WSL 통합을 사용하거나 교육기관이 제공하는 Linux 환경을 사용합니다. 권한 실습은 WSL 홈 디렉터리에서 하세요(`/mnt/c` 지양).
- 서울캠퍼스의 **macOS + sudo 제한 환경**은 과제 안내에 따라 OrbStack 앱을 실행합니다. OrbStack은 Windows/Linux용 대안으로 쓰지 않습니다.
- Linux에 Docker가 없다면 담당자에게 설치 권한을 확인하고 [Docker Ubuntu 공식 설치 안내](https://docs.docker.com/engine/install/ubuntu/)에 따라 설치합니다. 회사·교육기관 보안 정책을 우회하지 않습니다.
- `docker --version`은 도구 설치 여부, `docker info`는 엔진 연결 여부를 확인합니다. 둘 다 성공해야 실습을 시작합니다.
- Git, curl, Bash, VS Code도 필요합니다. `command -v git curl bash docker`로 확인합니다.

## 2. 압축 풀고 프로젝트 열기

ZIP을 다운로드한 위치에서 터미널로 압축을 풉니다(아래 경로는 예시이므로 실제 다운로드 위치로 바꾸세요).

```bash
mkdir -p ~/projects
cd ~/projects
unzip ~/Downloads/workstation_submission.zip
cd workstation-submission
pwd
ls -la
code .
```

`unzip`이 없으면 시스템 압축 해제 기능으로 푼 뒤 터미널로 해당 폴더에 이동합니다. 파일 조작 실습 자체는 반드시 CLI로 수행합니다. `code` 명령이 없다면 VS Code에서 이 폴더를 열어도 됩니다.

## 3. Dockerfile 직접 작성

과제에 “Dockerfile은 직접 작성”이라고 되어 있으므로 제공 파일을 읽고 다음 내용을 터미널로 직접 작성하세요. 각 줄의 의미는 평가 문서에 있습니다.

```bash
cat > Dockerfile <<'EOF'
FROM nginx:stable-alpine
COPY app/ /usr/share/nginx/html/
EXPOSE 80
EOF
cat Dockerfile
```

## 4. 순서대로 실행하고 확인

아래 명령은 **하나씩** 실행하세요. 오류가 나면 다음 단계로 넘어가지 말고 해결합니다. 스크립트는 실제 명령과 출력을 `evidence/*.md`에 기록합니다. 명령을 묶어 실행하는 도우미이며 실습자는 로그와 내용을 확인해야 합니다.

```bash
bash scripts/lab.sh env
bash scripts/lab.sh terminal
bash scripts/lab.sh docker
```

여기서 [대화형 컨테이너 실습](docs/interactive.md)을 수행합니다.

```bash
bash scripts/lab.sh web
```

브라우저에서 **http://localhost:8080**을 열고 주소창과 페이지가 함께 나오게 `03-web.png`를 저장합니다.

```bash
bash scripts/lab.sh mount
bash scripts/lab.sh volume
bash scripts/lab.sh trouble
```

마운트 실습은 캡처 시점에 멈춥니다. 스크립트 실행 중 터미널에 다른 명령을 입력하지 말고, 브라우저 캡처를 저장한 뒤 Enter를 누릅니다.

로그 파일이 이미 있으면 덮어쓰지 않습니다. 재실행하려면 기존 로그를 보관하고 이름 충돌 컨테이너를 확인하세요. `docker ps -a`로 확인 후 **이 실습에서 만든 해당 컨테이너만** 중지·삭제합니다. 전체 prune 명령은 필요 없습니다.

## 5. 문서와 캡처 채우기

1. [캡처 목록](docs/screenshots.md)에 따라 `evidence/screenshots/`에 이미지를 저장합니다.
2. README의 환경 표, 체크리스트와 결과 요약을 실제 결과로 채웁니다.
3. [트러블슈팅](docs/troubleshooting.md)의 실제 오류 문구·결과를 채웁니다.
4. [GitHub 제출](docs/github.md)을 따라 커밋·푸시하고 로그인/저장소 캡처를 추가합니다.
5. README의 모든 증거 링크가 GitHub에서 열리는지 확인하고 저장소 URL로 제출합니다.

문서의 예상 결과는 실제 수행 증거가 아닙니다. 로그가 실패했으면 완료 표시를 하지 마세요. Docker 설치/로그인 상황에 따라 소요시간이 달라지므로 7시에 시작해 곧바로 제출할 수 있다고 보장할 수는 없습니다.
