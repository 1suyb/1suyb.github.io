---
layout: post
title:  "[DesignPattern] 프로토타입 패턴"
date:   2024-10-14 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 프로토타입 패턴
tag: 
thumbnail:
---

# Prototype Pattern이란?
- 어떤 객체가 자기와 비슷한 객체를 스폰 할 수 있도록 하는 패턴

# 예제

## 몬스터 스포너
```Csharp
public class Monster{
}
public class Ghost : Monster{}
public class Demon : Monster{}
public class Sorcerer : Monster{}

public class Spawner{
    public virtual Monster SpawnMonster(){}
}
public class GhostSpawner : Spawner{}
public class DemonSpawner : Spawner{}
```
- 애초에 요즘은 몬스터를 각기 다른 클래스로 만들지도 않지만, 각각의 몬스터에 따라 스포너를 만들어줘야하는 문제가 생긴다.
#### Monster에 추상 매서드 Clone 추가
```CSharp
public abstract class Monster{
    public abstract Monster Clone()
}
public class Ghost : Monster{
    public override Monster Clone(){
        return new Ghost(_health,_speed);
    }
}

public class Spawner{
    private Monster _prototype;
    public Monster SpawnMonster(){
        return _prototype.Clone();
    }
}
```
- 깔끔하다! 하지만 이렇게되면 매번 Clone()함수를 만들어줘야한다. 이를 해결해 보자.

1. 스폰 함수를 사용하는 법
```CSharp
public class Spawner{
    private Func<Monster> _spawn;
    public Monster SpawnMonster(){
        return _spawn?.Invoke();
    }
    public Spanwer(Func<Monster> spanFunc){
        _spawn = spanFunc;
    }
}

// 사용시
Spawner ghostSpanwer = new Spawner(()=>{return new Ghost()})
ghostSpawner.SpawnMonster();
```
2. 템플릿을 사용하는 법
```Csharp
public class Spawner{
    public Monster Spawn<T>() where T : Monster
    {
        return new T();
    }
}
```