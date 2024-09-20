---
layout: post
title:  "[C#] Console"
date:   2024-09-20 15:00:00 +0900
categories: Csharp
---
C# Console 기능 정리

### 1. `Console.SetCursorPosition(int x, int y)`
   - **역할**: 콘솔 창 내에서 커서를 특정 위치(x, y)로 이동
   - **활용 예시**: console을 클리어하지 않고 특정 위치로 옮겨 문자를 그리거나 지울 수 있음.

   ```csharp
   Console.SetCursorPosition(10, 5); // 콘솔 창의 (10, 5) 위치로 커서 이동
   Console.Write("O"); // 스네이크 머리 또는 몸체 출력
   ```

### 2. `Console.SetWindowSize(int width, int height)`
   - **역할**: 콘솔 창의 너비와 높이를 설정
   - **활용 예시**: 게임을 위한 고정된 화면 크기를 설정하여 게임 공간을 관리

   ```csharp
   Console.SetWindowSize(80, 40); // 콘솔 창의 너비를 80, 높이를 40으로 설정
   ```

### 3. `Console.CursorVisible = false;`
   - **역할**: 콘솔 창에서 커서를 보이게 할지 여부를 설정
   - **활용 예시**: 게임 진행 시 커서가 보이지 않게 하여 화면을 깔끔하게 함

   ```csharp
   Console.CursorVisible = false; // 커서 숨기기
   ```

### 4. `Console.ForegroundColor = ConsoleColor.ColorName;`
   - **역할**: 콘솔에 출력될 텍스트의 전경색을 설정
   - **활용 예시**: 콘솔에서도 알록달록하게 게임을 만들 수 있다!

   ```csharp
   Console.ForegroundColor = ConsoleColor.Red; // 텍스트 색상을 빨간색으로 설정
   Console.Write("O"); // 빨간색으로 출력
   ```

### 5. `Console.Clear()`
   - **역할**: 현재 콘솔 화면을 지우고 커서를 (0, 0)으로 이동.
   - **활용 예시**: 새로운 게임 프레임을 시작할 때 화면을 초기화.

   ```csharp
   Console.Clear(); // 화면을 모두 지우고 새로 고침
   ```

### 6. `Console.ReadKey(bool intercept)`
   - **역할**: 키보드 입력 (키 하나)을 읽어옴.
   - **활용 예시**: 스네이크 게임에서 방향을 전환할 때 사용자가 누르는 키를 읽어 처리.
   - `intercept`가 `true`일 경우, 입력된 키를 콘솔에 표시하지 않음음.

   ```csharp
   ConsoleKeyInfo keyInfo = Console.ReadKey(true); // 키 입력을 콘솔에 표시하지 않고 읽기
   ```

### 7. `Console.WindowWidth` 및 `Console.WindowHeight`
   - **역할**: 콘솔 창의 현재 너비와 높이를 가져옴.
   - **활용 예시**: 콘솔 창 크기를 확인할 때 사용할 수 있음.

   ```csharp
   int width = Console.WindowWidth;
   int height = Console.WindowHeight;
   ```






#### 작성 및 수정 내용
- 2024.09.20 \[C# Console 초안 작성\]