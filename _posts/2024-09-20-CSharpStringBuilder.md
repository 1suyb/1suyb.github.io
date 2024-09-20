---
layout: post
title:  "[C#] String Builder"
date:   2024-09-20 15:00:00 +0900
categories: Csharp
---
## String의 문제점
- String은 불변 특성을 가져 문자열을 수정하거나 연결할 때마다 새로운 인스턴스가 생성되어 메모리 할당과 해제가 반복적으로 발생하게 됨. -> 성능저하

## StringBuilder란?
- string의 새로운 인스턴스 생성문제를 해결하기 위해 만들어짐
- 문자열을 동적으로 수정할 수 있는 가변 객체로, 문자열이 자주 변경되는 상황에서 성능을 향상 시키기위해 사용됨.





#### 작성 및 수정 내용
- 2024.09.20 \[C# StringBuilder 초안 작성\]