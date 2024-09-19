---
layout: post
title:  "[C#] Ooperator Precedence"
date:   2024-09-19 15:00:00 +0900
categories: Csharp
---
[C# 연산자 및 식 - 모든 C# 연산자 및 식 나열 - C#  Microsoft Learn](https://learn.microsoft.com/ko-kr/dotnet/csharp/language-reference/operators/)

| 우선순위 | 연산자 유형| 연산자|
| :--- | ----------- | -------: |
| 0    | 기본          | x.y (맴버 액세스)<br>f(x) (호출 식)<br>x?.y , x?\[y] (Null 조건부 연산자)<br>x++, x--<br>new<br>typeof,<br>checked,<br>unchecked,<br>defualt,<br>nameof,<br>delegate,<br>sizeof,<br>stackalloc,<br>x->y (포인터 맴버 엑세스) |
| 1    | 괄호          | ()  |
| 2    | 단항연산자       | ++x, --x, ture,false.. |
| 3    | 산술 곱        | \*, / |
| 4    | 산술 덧셈       | +- |
| 5    | shift       | <<, >>, >>> |
| 6    | 관계형 및 형식테스트 | <, >, <=, >=, is, as  |
| 7    | equality    | \==, !==  |
| 8    | 논리 and      | &  |
| 9    | 논리 Xor      | ^  |
| 10   | 논리 or       | \|  |
| 11   | 조건부 And     | &&   |
| 12   | 조건부 OR      | \|\|    |
| 13   | Null 병합     | ??  |
| 14   | 조건 연산자      | c?t:f |
| 15   | 할당 및 람다 선언  |     |




#### 작성 및 수정 내용
- 2024.09.19 \[C# 연산자 우선순위 초안 작성\]