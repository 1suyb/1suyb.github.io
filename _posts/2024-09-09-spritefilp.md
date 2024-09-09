---
layout: post
title:  "[Unity 2D] Sprite Flip"
date:   2024-09-09 14:00:00 +0900
categories: Unity
---

# 상황
2d project에서 sprite를 x축 혹은 y축으로 뒤집어야 하는 경우 사용
- 캐릭터 이동 구현시 좌,우 이동 시에 해당 방향으로 스프라이트를 뒤집어 그 방향으로 이동하는 것 처럼 보이게 함.

``` C#
SpriteRenderer sr = GetComponent<SpriteRenderer>();
// bool filpX, bool flipY 제어 가능 
sr.flipX=false;
sr.flipY=false;
```

#### 작성 및 수정 내용
- 2024.09.09 \[sprite flip 설명 작성\]