---
layout: post
title:  "UML_ClassDiagram TIL_20240926"
date:   2024-09-26 20:00:00 +0900
categories: CS
description: 2024년 09월 26일 Today I Learned
tag: 내일배움캠프
thumbnail: /assets/images/TIL/TIL.jpg
---

![thumnail]({{page.tilthumbnail}}){:width="100%" display="flex" justify-content="center"}


# Class Diagram
- 시스템에서 객체 및 객체간의 관계를 설명하는 diagram   
### 일반화
- 상속 관계를 나타냄  
![generalization](/assets/images/20240926til/Generalization.jpg){:width="40%" display="flex" justify-content="center"}
```
public class Animal
{
	public string Name{get;set;}
	public int Age{get;set;}
	public void Describe(){}
}
public class Dog : Animal
{
	public void Bark(){}
}
```

### 실체화
- 인터페이스와 클래스의 관계를 나타냄  
![Realization](/assets/images/20240926til/Realization.jpg){:width="40%" display="flex" justify-content="center"}
```
public class IDrive
{
	public void Drive();
}
public class Car : IDrive
{
	public string Model{get;set;}
	public void Drive(){}
}
```

### 의존
- 한 클래스가 다른 클래스를 일시적으로 사용 하는 관계
- 클래스 A가 클래스 B의 객체를 매개 변수로 받거나 매서드 내에서 사용하는 것
- 클래스간의 결합도가 낮은 관계  
![Dependency](/assets/images/20240926til/Dependency.jpg){:width="40%" display="flex" justify-content="center"}

```
public class Engine
{
	public void Start(){}
}
public class Car
{
	pubilc void StartCar(Engine)
	{
		Engine.Start();
	}
}
```

### 연관 & 직접연관
- 클래스가 다른 클래스를 속성으로 갖는 관계
- 의미적으로 서로 연관이 있는 정도의 관계
- 한 클래스가 일방적으로 다른 클래스를 속성으로 갖는 경우 DirectAssociation
- 클래스 서로가 서로를 속성으로 갖는경우 Association
**DirectAssociation**  
![DirectAssociation](/assets/images/20240926til/DirectAssociation.jpg){:width="40%" display="flex" justify-content="center"}  
```
public class Address
{
	public DisplayAddress(){}
}
public class Person
{
	public Address address;
	public void DisplayPersion() {}
}
```      
**Association**  
![Association](/assets/images/20240926til/Association.jpg){:width="40%" display="flex" justify-content="center"}  
```
public class Company
{
	public List<Person> person;
}
public class Person
{
	public Company company;
}
```

## 집합 & 연관집합
- 클래스가 다른 클래스를 속성으로 갖는 관계
- 의미적으로는 전체와 부분의 관계
- 전체 클래스가 일방적으로 부분 클래스를 속성으로 갖는 경우 Aggregation
- 전체 클래스와 부분 클래스가 서로를 속성으로 갖는 경우 Aggregation Association
- 전체 클래스와 부분 클래스 사이의 생명주기가 독립적

## 합성 & 복합연관
- 클래스가 다른 클래스를 속성으로 갖는 관계
- 의미적으로는 전체와 부분의 관계
- 전체 클래스가 일방적으로 부분 클래스를 속성으로 갖는 경우 Composition
- 전체 클래스와 부분 클래스가 서로를 속성으로 갖는 경우 Composite Association
- 전체 클래스와 부분 클래스 사이의 생명주기가 독립적

### 직접연관 / 연관 / 집합 / 집합연관 / 합성 / 복합연관 사이의 차이점과 공통점
| Direct Association | Association | Agregation | Aggregation Association | Composition | Composition Association |
|:------|:-------------------|-------------|------------|-------------------------|-------------|-------------------------|
|참조관계| A가 ->B를          | A랑 - B랑   | A가 -> B를  | A랑 - B랑               | A가 -> B를  | A랑 - B랑                |
|의미관계| 연관 있는 친구      | 연관이 있는  | 전체와 부분 | 전체와 부분             | 전체와 부분  | 전체와 부분               |
|생명주기| 독립적             | 독립적      | 독립적       | 독립적                  | B가 A에 의존 | B가 A에 의존             |

### 연관과 집합의 차이점
연관 : student와 subject처럼 서로간의 연관만있음
집합 : car와 engin처럼 전체가 부분이 없으면 안돌아감. 하지만 차의 뼈대가 먹는다고 엔진이 무조건 터지진 않음
합성 : 집과 방처럼 집이 무너지면 방도 같이 무너짐