---
layout: post
title:  "[DesignPattern] 전략 패턴"
date:   2024-10-02 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 상태패턴
tag: 내일배움캠프
thumbnail:
---

# Strategy Pattern 이란?
- 객체의 행위를 런타임에 동적으로 변경할 수 있도록 하는 디자인 패턴
- 알고리즘(행동) 군을 정의하고, 각 알고리즘을 캡슐화하여 서로 교환 할 수 있도록 함.



# State Pattern의 구조
- Context : Strategy 객체를 참조하고, 그 객체를 통해 클라이언트 요청을 처리함
- Strategy : 공통된 인터페이스 또는 추상 클래스로, 각기 다른 알고리즘을 정의함
- ConcreateStrategy : Strategy 인터페이스를 구현하여 특정 알고리즘을 제공

```CSharp
public interface IWeaponStrategy{
    void Attack();
}
public class SwordStrategy: IWeaponStrategy{
    public void Attack(){
        
    }
}
public class BowStrategy: IWeaponStrategy{
    public void Attack(){
        
    }
}
public class MagicStrategy: IWeaponStrategy{
    public void Attack(){
        
    }
}
public class Character{
    private IWeaponStrategy _weaponStrategy;
    public void SetWeaponStrategy(IWeaponStrategy weaponStrategy){
        _weaponStrategy = weaponStrategy;
    }
    public void PerformAttac(){
        _weaponStrategy.Attack();
    }
}
```

## Singleton 장단점
### 장점
- 무기가 추가 됨에 따라 캐릭터의 함수를 수정할 필요없이 추가할 수 있음 (OCP만족)
- 런타임중에 쉽게 교체할 수 있음

### 단점 
- 클래스 수의 증가
- 외부에서 Context에 Strategy 의존성을 주입해주어야함

## 상태패턴과의 차이점
### 상태패턴
- 객체의 상태에 따라 객체의 행동이 달라지도록 하는 것
- 객체의 상태전이에 중점을 둠
- 객체 내부에서 상태가 변경됨에 따라 행동이 달라짐
### 전략패턴
- 행동을 교체하는 것
- 행위에 다양성에 중점을 둠
- 외부에서 전략을 주입해줘야함. 외부에서 행동을 지정해줌

