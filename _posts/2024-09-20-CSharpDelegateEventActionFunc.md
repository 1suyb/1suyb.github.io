---
layout: post
title:  "[C#] Delegate, Event, Action 그리고 Func"
date:   2024-09-20 15:00:00 +0900
categories: Csharp
---
## 1. Delegate

- What is Delegate?
	- `Delegate`는 C#에서 **메서드 참조**를 가능하게 하는 형식.
	- 메서드의 **서명(매개변수와 반환 타입)**을 기반으로 메서드를 가리킬 수 있으며, 마치 함수 포인터처럼 동작.

### 예시
```csharp
public delegate void MyDelegate(string message);  // 리턴 타입이 void인 Delegate 정의

public void PrintMessage(string message)
{
    Console.WriteLine(message);
}

MyDelegate del = PrintMessage;  // 메서드 참조
del("Hello, Delegate!");        // Delegate를 통한 메서드 호출
```

---

## 2. Event
- What is Event?
	- 특수한 형태의 dlegate
	- 이벤트의 추가 및 제거만 가능 (=으로 할당 불가능)
	- 클래스 외부에서 이벤트 호출 불가
- **왜 이걸 쓰지? private 과 public으로 대리자를 선언하는 것과 무엇이 다를까**
	- private으로 선언 시 문제점 : 외부에서 완전히 접근이 막혀서 추가 불가능함
	- public으로 선언 시 문제점 : 외부에서 =으로 할당해버려서 다른 메서드들을 날려버릴 수 있음. 또한 캡슐화에도 위배됨
	- event로 선언하면 외부에서 메서드를 추가(구독)할 수는 있지만, =으로 할당해서 다른 메서드를 날려버리는 것을 방지할 수 있음. 또한 캡슐화를 유지할 수 있음.
---

## 2. Action

- What is Action
	- `Action`은 C#에서 **미리 정의된 Delegate**로, **리턴 값이 없는 메서드**를 참조할 때 사용.
	- 입력 매개변수를 최대 16개까지 가질 수 있으며, 따로 `Delegate`를 선언하지 않고 바로 사용할 수 있음.
	- 항상 반환 타입은 **void**.

### 예시
```csharp
Action<string> action = (message) => Console.WriteLine(message);  // 리턴 타입이 void인 메서드 참조

action("Hello, Action!");  // Action을 통한 메서드 호출
```

---

## 3. Func

- What is Func
	- `Func`는 C#에서 **미리 정의된 Delegate**로, **반환 값이 있는 메서드**를 참조할 때 사용.
	- **최대 16개의 매개변수**를 받을 수 있으며, 마지막 타입 인수는 **반환 타입**.
	- 반환 값을 필요로 하는 모든 메서드에 사용할 수 있으며, `Delegate`와 달리 미리 정의된 형태로 제공.

### 예시
```csharp
Func<int, int, int> add = (x, y) => x + y;  // 두 개의 int를 받아 int를 반환하는 Func

int result = add(5, 10);  // Func 호출
Console.WriteLine(result);  // 출력: 15
```

---

## 차이점 정리

| **구분**    | **Delegate**  | **Action**    | **Func**   |
|:-------------|------------|------------|------------:|
| **정의**    | 메서드를 참조할 수 있는 사용자가 정의한 형식  | 리턴 값이 없는 메서드를 참조할 수 있는 미리 정의된 Delegate | 리턴 값이 있는 메서드를 참조할 수 있는 미리 정의된 Delegate |
| **리턴 타입** | 사용자 정의 | `void` | 사용자 정의 (마지막 타입 인수가 반환 타입을 의미) |
| **매개변수** | 사용자 정의 | 최대 16개의 매개변수    | 최대 16개의 매개변수 |
| **사용 편의성** | 사용자가 직접 Delegate를 정의해야 함 | 미리 정의된 형식으로 간단하게 사용 가능 | 미리 정의된 형식으로 간단하게 사용 가능 |






#### 작성 및 수정 내용
- 2024.09.20 \[C# Delegate Event Action Func 초안 작성\]