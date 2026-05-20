# Terraform Core

테라폼으로 IaC를 배우는 수업의 예제들입니다.


## 1. 브랜치 생성

```bash
$ git switch -c feature/example
$ git add work/example.tf
$ git commit -m 'feat: add example.tf'
$ git push origin feature/example
```

## 2. PR 생성 (github 에서)
## 3. Review (github 에서)
## 4. Merge  (github 에서)

## 5. main 브랜치 동기화 & 작업 브랜치 정리

```bash
$ git checkout main
$ git pull origin main

$ git push origin --delete feature/example
$ git branch -d feature/example
```