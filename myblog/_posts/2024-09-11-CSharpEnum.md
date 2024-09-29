---
layout: post
title:  "[C#] Enum"
date:   2024-09-11 14:00:00 +0900
categories: Csharp
---

# Enum 이란
열거형


## Enum.GetNames vs Enum.GetValues
### 차이점 요약
1. **Enum.GetNames**:
   - 열거형의 **이름(문자열)** 목록을 반환 (`string[]`).
   - 각 열거형 항목의 이름을 가져옴

2. **Enum.GetValues**:
   - 열거형의 **값(정수 또는 해당 열거형 타입)** 목록을 반환 (`Array`).
   - 각 열거형 항목에 할당된 값을 가져옴

> 둘이 비슷해보이지만, GetValues는 enum 타입 그 자체의 값을 가져온다. 즉 (int)output 하면 그 값의 숫자를, output.string() 하면 그 값의 이름을 가져온다.

### 함께 사용 예시:
```csharp
public enum Days
{
    Sunday = 0,
    Monday = 1,
    Tuesday = 2,
    Wednesday = 3,
    Thursday = 4,
    Friday = 5,
    Saturday = 6
}

public class Program
{
    public static void Main()
    {
        // GetNames 사용
        string[] names = Enum.GetNames(typeof(Days));
        Console.WriteLine("Enum Names:");
        foreach (var name in names)
        {
            Console.WriteLine(name);
        }

        // GetValues 사용
        Array values = Enum.GetValues(typeof(Days));
        Console.WriteLine("\nEnum Values:");
        foreach (var value in values)
        {
            Console.WriteLine(value);
        }
    }
}
```

#### 결과:
```
Enum Names:
Sunday
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday

Enum Values:
Sunday
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
```

### 결론
- `Enum.GetNames`: 열거형 항목의 **이름**을 반환.
- `Enum.GetValues`: 열거형 항목의 **값**을 반환.

---
#### 작성 및 수정 내용
- 2024.09.11 \[Enum.GetNames 와 Enum.GetValues의 차이\]