---
layout: post
title:  "[C#] OrderBy"
date:   2024-09-09 13:00:00 +0900
categories: Csharp
---

# Orderby 함수란?
배열이나 리스트의 각 요소에 대해 "정렬 기준"을 하나 설정하고, 그 기준에 맞게 오름차순으로 정렬하는 함수


1. 숫자 리스트를 오름차순으로 정렬
``` C#
int[] numbers = {5,2,9,1,6};
int[] sorted = numbers.OrderBy(x=>x).ToArray();
// 결과=> numbers : {1,2,5,6,9}
```
2. 객체 리스트를 특정 필드를 기준으로 정렬
``` C#
class Person{
    public sring Name {get;set;}
    public int Age{get;set;}
}

List<Person> people = new List<Person>{
    new Person{Name="Alice", Age = 30},
    new Person{Name="Bob", Age = 25},
    new Person{Name="Charlie", Age = 35},
}

List<Person> people = people.OrderBy(p=> p.Age).ToList()
// 결과: Bob(25), Alice(30), Charlie(35)
```

3. OrderBy와 Random의 조합
 ``` C#
int[] numbers = {5,2,9,1};
int[] sorted = numbers.OrderBy(x=>Random.Range(0f,7f)).ToArray();
```
- `5`에 대해 `Random.Range(0f,7f)`가 `3.4`를 생성
- `2`에 대해 `Random.Range(0f,7f)`가 `6.2`를 생성
- `9`에 대해 `Random.Range(0f,7f)`가 `1.1`를 생성
- `1`에 대해 `Random.Range(0f,7f)`가 `4.8`를 생성  
이 값을 기준으로 `1.1` -> `3.4` -> `4.8` -> `6.2` 순으로 정렬  
```C#
// 결과
{9, 5, 1, 2}
```


#### 작성 및 수정 내용
- 2024.09.09 \[OrderBy 설명 및 3가지 예시 작성\]