---
layout: post
title:  "[Unity] Frame"
date:   2024-09-09 15:00:00 +0900
categories: Unity
---

Application.targetFrameRate 와 FixedUpdate

# Application.targetFrameRate
Unity 어플리케이션이 초당 실행하려는 프레임 수를 제어하는 속성
```C#
Application.targetFrameRate=60;
// 60fps로 제한
```
- 프레임 속도를 최적화 할 수 있음

# FixedUpdate
기기의 성능에 관계 없이 일정한 시간간격으로 호출되는 메소드  
물리 연산에 사용하기 적합함.
```C#
void FixedUpdate(){
    transform.position += vector3.up*speed;
}
```
- 고정된 시간간격(기본  50Hz)으로 호출 됨

## 둘이 무슨 차이?
Application.targetFrameRate로 60fps를 고정하면 UI반응이나 그래픽 업데이트까지 60fps로 고정됨.  
기기가 허용하는 최대 fps만큼 부드럽게 움직이지 못하고 고정 시킴.
FixedUpdate 기기의 성능과 Application.targetFrameRate와 (거의)관계 없이 일정한 간격으로 실행


#### 작성 및 수정 내용
- 2024.09.09 \[targetFrameRate와 FixedUpdate 차이점\]