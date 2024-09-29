---
layout: post
title:  "[git] GitConvention"
date:   2024-09-09 17:00:00 +0900
categories: Git
---

## git commit Convention이 왜 필요한가?
효율적인 commit message 작성을 위함.  

## 구조
``` text
<Type> subject

body

footer
```


## TYPE 
| Type                      | Description         |
| :--------------------------- | :--------------- | 
| Feat | 새로운 기능 추가
| Fix | 버그, 오타 수정
| Complex | 여러가지 일 수행
| Update | 기능을 업데이트
| Rename | 파일 혹은 폴더명 수정, 옮기는 경우
| Remove | 파일을 삭제
| Chore | 기타 변경 사항
| Refactor | 리팩토링
| Move | 코드의 이동
| Asset | 에셋 추가
| Design | 배경, 맵 디자인 등

## Subject Rule
1. 50자를 넘지 말 것, 대문자로 시작해야하며 마침표 및 특수기호를 사용하면 안됨.
2. 명령형 어조를 사용

## Body Rule
1. 선택사항
2. 커밋의 내용과 이유를 설명. 방법은 설명하지 말것
3. 각 줄의 길이를 72자 이내로 제한 할 것

## Footer Rule
1. 선택사항
2. 이슈 트래커 ID를 참조  
```
ex-1) 
fixes: #47 Related to #32, #21
ex-2)
Resolves: #123
See also : #456, #789
```



#### 작성 및 수정 내용
- 2024.09.09 \[글 초안 작성\]