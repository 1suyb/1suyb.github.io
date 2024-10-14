---
layout: post
title:  "[DesignPattern] 경량 패턴"
date:   2024-10-11 20:00:00 +0900
categories: DesignPattern
description: 디자인패턴 - 커맨드 패턴
tag: 
thumbnail:
---

# Flyweight Pattern이란?
- 객체들이 공유하는 데이터들을 분리해, 공유하게 만들어 메모리사용량을 줄이는 패턴
- 공유할 수 있는 데이터를 고유상태(intrinsic state) / 자유문맥(context-free) 상태라고 함
- 인스턴스 별로 값이 다른 데이터는 외부상태(extrinsic state)라고 한다.

# 예제 - Terrain

## 열거형으로 사용한다면
```Csharp
enum Terrain{
    TERRIN_GRASS,
    TERRAIN_HILL,
    TERRIN_REIVER
}

class World{
    private Terrain tiles_[WIDTH][HEIGTH];
    public int GetMovementCost(int x, int y){
        switch(tiles_[x][y]){
            case TERRIN_GRASS : return 1;
            case TERRAIN_HILL : return 3;
            case TERRIN_REIVER : return 2;
        }
    }
    pubilc bool isWater(int x, int y){
                switch(tiles_[x][y]){
            case TERRIN_GRASS : return false;
            case TERRAIN_HILL : return false;
            case TERRIN_REIVER : return true;
        }
    }
}
```
- 매우 지저분하고 가독성이 좋지 않음. 이동 비용이나 땅 여부는 지형에 관한 데이터인데 하드코딩 되어 있음

## 캡슐화
```CSharp
class Terrain{
    public const int getMovementCost(){ return movementCost;}
    public const bool const(){ return isWater; }
    public const Texture& getTexture(){return texture;}

    private int movementCost;
    private bool isWater;
    private Texture texture;
}

class World{
    private Terrain tiles[WIDTH][HEIGHT];
    private Terrain grassTerrain;
    private Terrain hillTerrain;
    private Terrain riverTerrain;

    public void generateTerrain(){
        // 지형 생성 
    }
    public const Terrain getTile(int x, int y){
        return tile[x][y];
    }
}
```
- 깔끔해졌음!
- 열거형을 선언해 수많은 다중 선택문을 만들 생각이라면, 경량 패턴을 먼저 고려해보자!