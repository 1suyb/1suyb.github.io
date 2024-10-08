---
layout: post
title:  "[DesignPattern] 상태 패턴"
date:   2024-09-30 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 상태패턴
tag: 내일배움캠프
thumbnail:
---

# State Pattern이란?
- 객체의 내부 상태에 따라 객체의 행동을 변경하는 디자인 패턴
- 상태의 변경이 객체의 클래스 변경을 동반하지 않고 동적으로 이루어질 수 있도록 해줌
- 상태패턴은 객체를 캡슐화하고 상태 전환이 객체의 메소드 호출에 영향을 미치도록 설계함

# State Pattern의 구조
- Context 클래스는 상태 객체를 갖고 있으며, 상태에 따른 행동을 State인터페이스를 통해 위임함
- State 인터페이스는 handle()과 같은 상태별로 구현될 메서드를 정의함
- ConcreteState 클래스는 State 인터페이스를 구현하며, 각 상태에 대한 구체적인 행동을 정의함

```CSharp
public interface IQuestState
{
	void Handle(Quest quest);
	public string GetStateName();
}

public class NotStarted : IQuestState{
	public void Handle(Quest quest){
		quest.SetState(new InProgress());
	}
	public string GetStateName(){
		return "NotStarted";
	}
}
public class InProgress: IQuestState{
	public void Handle(Quest quest){
		qeust.SetState(new Complete());
	}
	public string GetStateName(){
		return "InProgress";
	}
}
public class Complete: IQuestState{
	public void Handle(Quest quest){
		quest.SetState(new Done());
	}
	public string GetStateName(){
		return "Complete";
	}
}
public class Done: IQuestState{
	public void Handle(Quest quest){
		
	}
	public string GetStateName(){
		return "Done";
	}
}

public class Quest{
	private IQuestState = _state;
	public Quest(IQuestState state){
		this._state = new NotStarted()
	}

	public void SetState(IQuestState state){
		this._state=state;
	}
	public void Request(){
		_state.Handle(this);
	}
}
```
### 어?
- 이렇게 하면 Quest를 수락하는지, 완료한지, 완료된 퀘스트인지에 따라 함수를 호출하기가 어려움.
- 그럼 Quest에 Accept, Complte, Done을 enum으로 해서 그냥 구현하는게 낫지 않나? 라는 의문이 생김

```CSharp
public interface IQuestState
{
    void Accept(Quest quest);
    void Complete(Quest quest);
    void GiveReward(Quest quest);
    string GetStateName();
}

// NotStarted 상태
public class NotStarted : IQuestState
{
    public void Accept(Quest quest)
    {
        Console.WriteLine("퀘스트를 수락했습니다.");
        quest.SetState(new InProgress());
    }

    public void Complete(Quest quest)
    {
        Console.WriteLine("퀘스트가 아직 시작되지 않았습니다.");
    }

    public void GiveReward(Quest quest)
    {
        Console.WriteLine("퀘스트가 아직 시작되지 않았습니다.");
    }

    public string GetStateName()
    {
        return "NotStarted";
    }
}

// InProgress 상태
public class InProgress : IQuestState
{
    public void Accept(Quest quest)
    {
        Console.WriteLine("퀘스트가 이미 진행 중입니다.");
    }

    public void Complete(Quest quest)
    {
        Console.WriteLine("퀘스트를 완료했습니다.");
        quest.SetState(new Complete());
    }

    public void GiveReward(Quest quest)
    {
        Console.WriteLine("퀘스트가 완료되지 않았습니다.");
    }

    public string GetStateName()
    {
        return "InProgress";
    }
}

// Complete 상태
public class Complete : IQuestState
{
    public void Accept(Quest quest)
    {
        Console.WriteLine("퀘스트가 이미 완료되었습니다.");
    }

    public void Complete(Quest quest)
    {
        Console.WriteLine("퀘스트가 이미 완료되었습니다.");
    }

    public void GiveReward(Quest quest)
    {
        Console.WriteLine("보상을 받았습니다.");
        quest.SetState(new Done());
    }

    public string GetStateName()
    {
        return "Complete";
    }
}

// Done 상태
public class Done : IQuestState
{
    public void Accept(Quest quest)
    {
        Console.WriteLine("퀘스트가 이미 완료되어 더 이상 진행할 수 없습니다.");
    }

    public void Complete(Quest quest)
    {
        Console.WriteLine("퀘스트가 이미 완료되어 더 이상 진행할 수 없습니다.");
    }

    public void GiveReward(Quest quest)
    {
        Console.WriteLine("이미 보상을 받았습니다.");
    }

    public string GetStateName()
    {
        return "Done";
    }
}

// Quest 클래스
public class Quest
{
    private IQuestState _state;

    public Quest()
    {
        this._state = new NotStarted();  // 처음 상태는 NotStarted로 설정
    }

    public void SetState(IQuestState state)
    {
        this._state = state;
    }

    public void Accept()
    {
        _state.Accept(this);
    }

    public void Complete()
    {
        _state.Complete(this);
    }

    public void GiveReward()
    {
        _state.GiveReward(this);
    }

    public string GetCurrentState()
    {
        return _state.GetStateName();
    }
}
```
### 코드가 너무 길고 LSP와를 어기게 됨
### 이 구조보다 위의 구조가 훨씬 나으며, OCP와 LSP를 모두 지킬 수 있게됨

# 상태패턴의 장단점
## 장점
1. 유연성
- 상태에 따라 객체의 행동을 다르게 정의할 수 있음
- 새로운 상태를 추가하기 쉬워 확장성이 뛰어남 **OCP를 만족**
- 상태 관련 로직을 상태 객체 내에 캡슐화 하여 상태전환 로직이 분산되지 않고, 집중됨
- 각 상태는 자신이 할 일을 책임짐 **SRP를 만족**

## 단점
- 객체 코드는 짧아질지 몰라도, 전체 코드는 길어짐
