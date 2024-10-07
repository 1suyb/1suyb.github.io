---
layout: post
title:  "TIL Const와 Readonly"
date:   2024-10-07 20:00:00 +0900
categories: TIL
description: 
tag: 
thumbnail:
---

- 구 InputManager을 사용하여 입력 script를 구현하는 중, horizontal과 vertical 입력에 있어 오타가 발생할 것을 대비해 이를 const나 readonly의 상수로 정의해두고자 하였음.
- 이때, 값을 변경할 수 없도록 하는 상수를 선언하는 방법인 const와 readonly의 차이가 무엇인지 의문이 생김

# Const
- 정적 할당 : 컴파일 시에 정의 되어야하며, 런타임 중에는 변경할 수 없음.
- 암시적 static

# ReadOnly
- 런타임 할당 가능
- 기본적으로 instance