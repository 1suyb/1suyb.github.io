---
layout: post
title:  "[DesignPattern] 싱글톤 패턴"
date:   2024-10-01 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 상태패턴
tag: 내일배움캠프
thumbnail:
---

# Singleton Pattern 이란?
- 특정 클래스의 인스턴스가 오직 하나만 생성되도록 보장
- 해당 인스턴스에 전역적으로 접근 할 수 있도록 함


# State Pattern의 구조
- 외부에서 생성하지 못하도록 생성자를 private로 막음
- Instance 프로퍼티를 사용해 get할때 없다면 생성될 수 있도록 함

```CSharp
public class Singleton{
    private static Singleton instance = null;

    private Singleton(){}

    public static Singleton Instance{
        get{
            if(instance ==null)
                instance = new Singleton();
            return instance;
        }
    }
}
```

## Singleton 장단점
### 장점
- 전역적 접근성
- 생성 및 초기화 제어
- 자원의 효율적 관리
### 단점 
- 전역 상태 관리의 위험
- 클래스 생명주기 관리의 어려움
- 테스트 어려움
- 확장성 문제

## 적합한 경우
- 로그 관리
- 설정 파일 관리
- DB연결
- 한 번만 생성되고 모든 곳에서 동일한 객체로 접근할 필요가 있는 경우

