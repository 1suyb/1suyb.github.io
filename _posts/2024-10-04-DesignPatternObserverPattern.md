---
layout: post
title:  "[DesignPattern] 옵저버 패턴"
date:   2024-10-04 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 옵저버 패턴
tag: 내일배움캠프
thumbnail:
---

# Observer Pattern이란?
- 객체의 변화를 캐치하고, 그 객체에 의존하는 다른 객체들이 자동으로 알림을 받고 업데이트 될 수 있도록 하는 방법
- 일대다 의존성을 갖게됨
- 이벤트 기반 시스템이나 GUI 응용 프로그램에서 많이 사용됨

# Observer Pattern 구조
- Subject : 상태를 관리하고, 옵저버들을 등록하거나 삭제할 수 있는 객체. 상태가 변하면 모든 옵저버들에게 변경사항을 통지
- Observer : 주제의 상태를 관찰하는 객체. 

```C#
public class Player{
    private List<IObserver> observers = new List<IObserver>();
    private int health;

    public int Health{
        get{return health;}
        set{
            health=value;
            NotyfiyObservers();
        }
    }
    public void Attach(IObserver observer){
        observers.Add(observer);
    }
    public void Detach(IObserver observer){
        observers.Remove(observer);
    }
    public void NotifyObservers(){
        foreach(var observer in observers){
            observers.Handle(Health);
        }
    }
}
public interface IObserver{
    void Update(int health);
}
public class HealthUI : IObserver{
    public void Handle(int health){
        Console.WireteLine($"{health}")
    }
}
```

## 장단점
### 장점
- subject와 observer가 서로 독립적으로 존재할 수 있어 느슨한 결합을 유지할 수 있음.
- 확장성 새로운 옵저버를 쉽게 추가할 수 있음 (OCP)
- 주제의 상태가 변경ㅎ될 때 모든 옵저버가 자동으로 업데이트 되어 수동 객체간의 상태를 동기화하는 작업을 줄일 수 있음. 이벤트 기반 시스템에서 효율적인 이벤트 처리가 가능함
### 단점
- 디버깅이 어려움
- 옵저버가 너무 많을 경우 시간이 오래걸릴 수 있음.
- 등록만하고 해제하지 않는 다면 불필요한 옵저버가 할당되어 메모리 누수의 위험성이 있음
