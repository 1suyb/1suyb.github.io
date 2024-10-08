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

# 플레이어의 입력을 받는 함수를 짠다고 가정 할 때
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
    public override void execuete(){jump();}
}
public class FireCommand : Command{
    public override void execute(){fireGun();}
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
#### => *Command*의 execute인자에 player를 인자로 받아 실행하면 된다!
#### HandleInput에서는 뭘 인자로 넘겨줘야하는지 모르는데요?
#### => 함수 호출 시점을 지연 시켜서 해결

```CSharp
public class Command{
    public virtual execue(GameActor actor);
}

public class JumpCommand : Command{
    public override void execuete(GameActor actor){actor.jump();}
}

class InputHandler{
    private Command ButtonX;
    private Command ButtonY;
    private Command ButtonA;
    private Command ButtonB;

    public Command handleInput(){
        if(isPressed(BUTTON_X)) return ButtonX;
        else if(isPressed(BUTTON_Y)) return ButtonX; 
        else if(isPressed(BUTTON_A)) return ButtonX; 
        else if(isPressed(BUTTON_B)) return ButtonX; 
    }
}

// 실행 하는 곳에서 아래의 일련의 코드를 실행
    Command command = InputHandler.handleInput();
    if(command!=null){command.execute(actor);}

```
- 명령을 실행할 때 액터만 바꾸면 플레이어가 게임에 있는 어떤 액터라도 제어 할 수 있게 됨.
- 플레이어 뿐만 아니라 AI가 액터를 제어 할 수 있게 되었음

## 대표적인 사용 예시2 실행취소와 재실행
```Csharp
public class Command{
    public virtual execute();
    public virtual undo();
}
class MoveUnitCommand : Command{
    private Unit unit;
    private int x;
    private int y;
    private int beforex;
    private int beforey;
    public override void execute(){
        beforex = unit.x;
        beforey = unit.y;
        unit.moveto(x,y);
    }
    public override void undo(){
        unit.moveto(beforex,beforey);
    }
    
}
class InputHandler{
    public Command handleInput(){
        if(isPressed(BUTTON_X)){
            return new MoveUnitcommand(unit,unit.x,unit.y-1);
        }
        else if(isPressed(BUTTON_Y)) {
            return new MoveUnitcommand(unit,unit.x,unit.y+1);
        }
    }
}
```