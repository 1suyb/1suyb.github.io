---
layout: post
title:  "[DesignPattern] 커맨드 패턴"
date:   2024-10-08 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 커맨드 패턴
tag: 
thumbnail:
---

# Command Pattern이란?
- 매서드 호출을 실체화 한 것
- 실행될 행동을 객체로 감싸는 것

# 예제
## 플레이어의 입력을 받는 함수
### 간단 버전
```Csharp
public class InputHandler{
    public handleInput(){
        if(isPressed(BUTTON_X)) jump();
        else if(isPressed(BUTTON_Y)) fireGun(); 
        else if(isPressed(BUTTON_A)) swapWeapon(); 
        else if(isPressed(BUTTON_B)) lurchIneffectively(); 
    }
}
```
#### 문제점
- 입력 키의 변경이 불가능함

### 개선 버전
```CSharp
public class Command{
    public virtual execue();
}

public class JumpCommand : Command{
    public virtual void execuete(){jump();}
}
public class FireCommand : Command{
    public virtual void execute(){fireGun();}
}

class InputHandler{
    private Command ButtonX;
    private Command ButtonY;
    private Command ButtonA;
    private Command ButtonB;

    public handleInput(){
        if(isPressed(BUTTON_X)) ButtonX.execute();
        else if(isPressed(BUTTON_Y)) ButtonY.execute(); 
        else if(isPressed(BUTTON_A)) ButtonA.execute(); 
        else if(isPressed(BUTTON_B)) ButtonB.execute(); 
    }

}
```
- Handler의 button들에 원하는 command객체를 할당해주면 된다!
#### 여전히 남아있는 문제점
- Command클래스에 플래이어 객체를 암시적으로 찾아서 함수를 호출 해야함.
- 커플링(Command에 player에 강하게 의존함)이 가정에 깔려 있음

