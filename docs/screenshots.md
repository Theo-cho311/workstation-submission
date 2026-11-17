# 스크린샷·증거 체크리스트

과제에서 “브라우저 또는 curl”과 “주소창 포함 브라우저”가 함께 제시되어 있으므로 **curl 로그와 브라우저 캡처 모두** 제출합니다. 터미널 항목은 명령+출력 로그로 충족할 수 있고, GitHub/VS Code와 브라우저는 실제 화면 캡처를 준비합니다.

| 파일 이름 | 구분 | 반드시 보일 것 | 촬영 시점 |
|---|---|---|---|
| 01-environment.png | 권장·로그 대체 가능 | docker --version, docker info의 명령과 정상 출력 | env 단계 |
| 02-permissions.png | 권장·로그 대체 가능 | chmod 명령, 파일·디렉터리의 변경 전후 ls -ld | terminal 단계 |
| 03-web.png | 필수로 준비 | 주소창 http://localhost:8080, 페이지 제목, VERSION_1 | web 단계 직후 |
| 04-bind-before.png | 준비 권장 | 동일 주소창, VERSION_1 | mount 첫 번째 대기 |
| 05-bind-after.png | 준비 권장 | 동일 주소창, VERSION_2 | mount 두 번째 대기 |
| 06-volume.png | 권장·로그 대체 가능 | 삭제 전 cat, stop/rm, 새 컨테이너 cat과 동일 문자열 | volume 단계 |
| 07-vscode-login.png | 필수로 준비 | VS Code 계정 메뉴의 GitHub 로그인 상태 | 인증 완료 후 |
| 08-vscode-repo.png | 필수로 준비 | 프로젝트 폴더, Source Control의 main, 터미널의 remote/status | 푸시 완료 후 |
| 09-github.png | 필수로 준비 | GitHub 저장소 주소창, 파일 목록, 최신 커밋 및 README | 최종 푸시 후 |
| 10-interactive.png | 권장·로그 대체 가능 | 내부 명령과 exit/분리 뒤 컨테이너 상태 | interactive 단계 |

저장 위치: 프로젝트의 `evidence/screenshots/`. 한 화면에 다 담기 어려우면 `06-volume-before.png`, `06-volume-after.png` 등으로 나누고 README 링크도 추가합니다. 글자를 너무 작게 축소하지 마세요.

브라우저 캡처만으로 `-p` 실행 명령을 증명할 수 없으므로 `evidence/web.md`와 함께 봅니다. 마운트도 변경 명령·전후 curl·컨테이너 상태가 있는 `evidence/mount.md`를 함께 제출합니다.

비밀번호, 토큰, 인증 코드, 개인키, 다른 계정·탭의 개인정보를 가리세요. 과제에 ID 마스킹 요구도 있으므로 로그인 상태는 보이게 두고 계정명·이메일은 필요한 범위에서 마스킹합니다. 저장소 URL과 저장소명은 평가자가 접근할 수 있어야 합니다. 제출용 이미지 자체를 불투명하게 편집한 뒤 저장하고 원본을 커밋하지 않습니다.

README에 이미지를 표시하는 방법:

```markdown
![포트 매핑 접속](evidence/screenshots/03-web.png)
```

docs 폴더 문서에서 삽입할 때는 `../evidence/screenshots/03-web.png`처럼 상대 경로가 달라집니다.
