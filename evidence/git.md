# Git / GitHub 검증

상태: Git 설정, VS Code GitHub 연동 및 원격 저장소 게시 완료.

```text
$ git config --list
user.name=Theo-cho311
user.email=[masked]
credential.https://github.com.helper=
credential.https://github.com.helper=!/usr/bin/gh auth git-credential
credential.https://gist.github.com.helper=
credential.https://gist.github.com.helper=!/usr/bin/gh auth git-credential
init.defaultbranch=main
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true

$ git remote -v
origin	https://github.com/Theo-cho311/workstation-submission.git (fetch)
origin	https://github.com/Theo-cho311/workstation-submission.git (push)

$ git branch -vv
* main 66e22e8 [origin/main] Add workstation lab and verification evidence

$ git status
현재 브랜치 main
브랜치가 'origin/main'에 맞게 업데이트된 상태입니다.

커밋할 사항 없음, 작업 폴더 깨끗함

$ git log -1 --oneline
66e22e8 (HEAD -> main, origin/main) Add workstation lab and verification evidence
```
