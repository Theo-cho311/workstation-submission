# Git 설정, VS Code 연동, 제출

인증은 실습 PC에서 직접 진행합니다. 비밀번호·토큰을 명령줄/README에 적지 않습니다. Git 사용자 이름·이메일은 커밋 작성자 정보이며 GitHub 로그인과 다릅니다.

## 1. 설정 및 저장소 초기화

프로젝트 루트에서 실행합니다. 아래 사용자명/이메일은 **실제 값으로 바꾸세요**. 이메일은 GitHub 설정에서 확인한 비공개 noreply 주소를 권장합니다.

```bash
git config --global user.name "본인 커밋 이름"
git config --global user.email "본인의 GitHub noreply 이메일"
git config --global init.defaultBranch main
git init -b main
git config --list
```

`git config --list`는 실제 화면에서 먼저 확인합니다. URL에 인증정보나 추가 토큰 설정이 있다면 출력 원본을 저장하지 않습니다. `evidence/git.md`에 명령과 마스킹한 출력을 코드블록으로 넣습니다. 이름·이메일도 제출 정책에 맞게 마스킹하되 해당 항목과 기본 브랜치 값은 확인 가능하게 남깁니다.

## 2. 첫 커밋

로그·스크린샷의 비밀정보와 README 빈칸을 확인하고 실행합니다.

```bash
git status
git add .
git diff --cached --stat
git diff --cached
git commit -m "Add workstation lab and verification evidence"
```

## 3. VS Code에서 GitHub 연결

VS Code에서 프로젝트 폴더를 열고 명령 팔레트의 `Publish to GitHub`를 선택합니다. 브라우저 인증 안내에 따라 로그인하고 과제 공개 범위를 선택합니다. 공개 제출이면 Public, 비공개 허용이면 Private을 선택하고 평가자 접근 권한을 확인합니다.

이 단계의 인증·연동 UI는 과제에서 별도로 요구한 증거입니다. 실습 및 Git 명령은 터미널에서 수행하고, VS Code 로그인과 브라우저 확인만 해당 화면을 사용합니다.

게시가 끝난 뒤 터미널에서 실행:

```bash
git remote -v
git branch -vv
git status
git log -1 --oneline
```

주소에 토큰이 포함되지 않았는지 확인한 후 실제 출력을 `evidence/git.md`에 기록합니다. `07-vscode-login.png`, `08-vscode-repo.png`, `09-github.png`를 촬영합니다.

## 4. 최종 증거 반영

README에 실제 이미지 링크를 넣고 체크리스트와 환경을 완성한 다음:

```bash
git add README.md docs evidence
git diff --cached --stat
git commit -m "Complete screenshots and verification notes"
git push
git status
```

GitHub에서 모든 로그와 이미지가 열리는지 확인합니다. 원격 화면은 캡처 당시 커밋을 보여주므로 캡처 자체를 추가한 최종 커밋과 해시가 달라도 이유를 설명할 수 있습니다. 제출할 것은 **GitHub 저장소 URL**입니다.

토큰이 실제 커밋되었다면 먼저 해당 토큰을 폐기·재발급합니다. 파일에서 가리는 것만으로 과거 커밋의 노출이 사라지지 않으므로 히스토리 정리도 필요합니다.
