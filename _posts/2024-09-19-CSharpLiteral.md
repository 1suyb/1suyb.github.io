---
layout: post
title:  "[C#] Literal"
date:   2024-09-19 15:00:00 +0900
categories: Csharp
---
# [C#] Literal
[Lexical structure - C# language specification | Microsoft Learn](https://learn.microsoft.com/ko-kr/dotnet/csharp/language-reference/language-specification/lexical-structure)

### 정수형 리터럴

#### 1. **10진수 리터럴 (Decimal Integer Literal)**

- **정수 범위**: `0` ~ `9`
- **예시**: `123`, `1_000_000` (언더스코어 `_` 사용 가능)
- **타입 접미사**:
    - `U` 또는 `u`: 부호 없는 정수
    - `L` 또는 `l`: long 타입 정수
    - `UL` 또는 `ul`: 부호 없고 long 타입 정수
- **예시**:
    - `42U`: 부호 없는 정수
    - `42L`: long 타입 정수
    - `42UL`: 부호 없고 long 타입 정수

#### 2. **16진수 리터럴 (Hexadecimal Integer Literal)**

- **정수 범위**: `0` ~ `9`, `A` ~ `F`
- **표기법**: `0x` 또는 `0X`로 시작
- **타입 접미사**: 10진수와 동일 (`U`, `L`, `UL`)
- **예시**:
    - `0xFFU`: 부호 없는 16진수
    - `0XFFL`: long 타입 16진수

#### 3. **2진수 리터럴 (Binary Integer Literal)**

- **정수 범위**: `0`과 `1`
- **표기법**: `0b` 또는 `0B`로 시작
- **타입 접미사**: 10진수와 동일 (`U`, `L`, `UL`)
- **예시**:
    - `0b1101U`: 부호 없는 2진수
    - `0B1010L`: long 타입 2진수

---

### 실수형 리터럴

#### 1. **기본 소수점 리터럴**

- **형태**: `숫자.숫자`
- **타입 접미사**: `F`, `D`, `M` (float, double, decimal)
- **예시**:
    - `123.456`
    - `1.23_456F` (float 타입)
    - `12.34E10` (지수 표기법)
    - `0.001D` (double 타입)

#### 2. **소수점 앞에 숫자가 없는 리터럴**

- **형태**: `.숫자`
- **예시**:
    - `.456`
    - `.789f` (float 타입)
    - `.001E3` (지수 표기법)

#### 3. **지수 표기법만 사용된 리터럴**

- **형태**: `숫자e지수`
- **예시**:
    - `1e5`
    - `3.14e-2F` (float 타입)
    - `5E10D` (double 타입)

---

### Character 리터럴

#### 1. **기본 구조**

- 작은 따옴표(`'`)로 감싼 **단일 문자**
- **형식**: `'문자'`
- **예시**: `'A'`, `'z'`, `'7'`

#### 2. **문자 유형**

- **단일 문자**: `'A'`, `'7'`, `'@'`
- **단순 이스케이프 시퀀스**:
	- `'\''`: 작은 따옴표 자체를 표현
     - `'\\'`: 역슬래시 자체를 표현
     - `'\n'`: 줄 바꿈 (newline)
     - `'\t'`: 탭 (tab)
     - `'\r'`: 캐리지 리턴 (carriage return)
     - `'\b'`: 백스페이스 (backspace)
     - `'\0'`: null 문자
     - `'\a'`: 경고음 (alert)
     - `'\f'`: 폼 피드 (form feed)
     - `'\v'`: 수직 탭 (vertical tab)
- **16진수 이스케이프**: `'\x41'` (A), `'\x7A'` (z)
- **유니코드 이스케이프**: `'\u0041'` (A), `'\u03A9'` (Ω)

---

### String 리터럴

#### 1. **일반 문자열 리터럴 (Regular String Literal)**

- **형식**: `"문자열"`
- **문자**: `"`, `\`, 줄 바꿈 제외
- **이스케이프 시퀀스**:
    - 단순 이스케이프: `\n`, `\t`, `\\`, `\"`
    - 16진수 이스케이프: `\x41` (A)
    - 유니코드 이스케이프: `\u0041` (A)
- **예시**:
    - `"Hello, World!"`
    - `"Line 1\nLine 2"`

#### 2. **Verbatim 문자열 리터럴 (Verbatim String Literal)**

- **형식**: `@"문자열"`
- **문자**: 모든 문자 포함 가능, `"는 두 번 연속 표시`
- **예시**:
    - `@"C:\Program Files\MyApp"`
    - `@"This is a ""quoted"" word."`

| 자료형     | .NET 데이타 타입    | 크기 (바이트) | 범위                                                     |
| ------- | -------------- | -------- | ------------------------------------------------------ |
| sbyte   | System.SByte   | 1        | -128 ~ 127                                             |
| byte    | System.Byte    | 1        | 0 ~ 255                                                |
| short   | System.Int16   | 2        | -32,768 ~ 32,767                                       |
| ushort  | System.UInt16  | 2        | 0 ~ 65,535                                             |
| int     | System.Int32   | 4        | -2,147,483,648 ~ 2,147,483,647                         |
| uint    | System.UInt32  | 4        | 0 ~ 4,294,967,295                                      |
| long    | System.Int64   | 8        | -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807 |
| ulong   | System.UInt64  | 8        | 0 ~ 18,446,744,073,709,551,615                         |
| float   | System.Single  | 4        | ±1.5 × 10^-45 ~ ±3.4 × 10^38                           |
| double  | System.Double  | 8        | ±5.0 × 10^-324 ~ ±1.7 × 10^308                         |
| decimal | System.Decimal | 16       | ±1.0 × 10^-28 ~ ±7.9 × 10^28                           |
| char    | System.Char    | 2        | 유니코드 문자                                                |
| string  | System.String  |          | 유니코드 문자열                                               |
| bool    | System.Boolean | 1        | true 또는 false                                          |


#### 작성 및 수정 내용
- 2024.09.19 \[C# Literal 초안 작성\]