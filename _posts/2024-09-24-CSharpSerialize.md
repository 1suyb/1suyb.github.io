---
layout: post
title:  "[C#] Serialization & Deserializaton"
date:   2024-09-24 15:00:00 +0900
categories: Csharp
---
# [C#] Serialization & Deserializaton
직렬화(Serialization)와 역직렬화(Deserialization)는 데이터의 저장 및 전송을 용이하게 하기 위해 데이터를 변환하는 것
### 1. 직렬화 (Serialization)
직렬화는 객체 / 데이터를 바이트등의 형태로 변환하여 저장/전송 할 수 있도록 하는 과정
- 대표적 직렬화 방식
	- Json
	- Xml
	- Binary
- 사용 예시
	- 파일 저장
	- 네트워크로 객체 전송
### 2. 역직렬화 (Deserialization)
직렬화된 데이터를 다시 객체로 복원하는 과정
저장된 바이트나 문자열을 다시 객체로 불러오는 것

###  C# Json직렬화 예시
- 기본 코드
```C#
string filepath = "filepath.json";

string json = JsonSerializer.Serialize(objects)

File.WriteAllText(filepath, json);
```

- 작성된 파일이 읽기 편했으면 좋겠을 때
```C#
string json = JsonSerializer.Serialize(Objects, new  JsonSerializerOptions{WriteIndented=true})
```

- 작성된 파일이 한글이 깨져 보일 때
```c#
var options = new JsonSerializerOptions
{
	Encoder = System.Text.Encodings.Web.JavaScriptEncoder.UnsafeRelaxedJsonEscaping,
	WriteIndented = true 
}; 
string json = JsonSerializer.Serialize(Object,options)
```

### C# Json역직렬화 예시
- 기본 코드
```C#
string jsonString = File.ReadAllText(filePath);
T obj = JsonSerializer.Deserialize<T>(jsonString);
```

- 제약
	- setter가 private이거나 없으면 역 직렬화가 불가능함
	- 생성자가 여러개 일 때, 매개변수가 없는 pubilc 생성자를 우선 사용함
	- 매개변수가 있는 생성자가 유일한 생성자일 때 해당 생성자를 사용함
- 제약을 해소하는 방법
	- [변경할 수 없는 형식 및 속성 사용 - .NET | Microsoft Learn](https://learn.microsoft.com/ko-kr/dotnet/standard/serialization/system-text-json/immutability)
		- `[JsonInclude]`
		- `[JsonConstructor]`
		- `[JsonPropertyName("Name")]`

#### `[JsonInclude]`
- pubilc이 아닌 property나 field도 직렬화/역직렬화 시 포함되도록 함
```C#
public class Forecase
{
	public DateTime Date{get; init;}
	[JsonInclude] // private도 직렬화/역직렬화시 포함되도록 함
	public int Temperature{get;private set;} // 원래는 역직렬화 불가능
	[JsonInclude]
	pubilc string? Summary{private get; set;} // 원래는 직렬화 불가능
}
```
#### `[JsonConstructor]`
- 생성자가 여러개 일 때 지정한 생성자로 객체를 초기화 할 수 있도록 함
```C#
public class Forecase
{
	public DateTime Date{get;} // 역직렬화 불가능
	public int Temperature{get;} // 역직렬화 불가능
	pubilc string? Summary{get;} // 역직렬화 불가능
	
	[JsonConstructor]
	public Forecast(DateTime date, int temperature, string summary){
	(Date,Temperature,Summary) = (date,temperature,summary)
	}
}
```
- 제약조건
	- 변수 이름이 Json 변수 이름과 동일해야함.
#### `[JsonPropertyName("name")]`
- 생성자 매개변수 이름과 json 변수이름의 불일치를 해소할 수 있도록 함
```C#
public class Forecase
{
	public DateTime Date{get;} // 역직렬화 불가능
	[JsonPropertyName("celsius")]
	public int Temperature{get;} //
	pubilc string? Summary{get;} // 역직렬화 불가능
	
	[JsonConstructor]
	public Forecast(DateTime date, int temperature, string summary){
	(Date,Temperature,Summary) = (date,temperature,summary)
	}
}
json
{
	"date" : "2024-09-24",
	"celsius" : -1,  // Temperature와 불일치
	"summary" : "Cold"
}
```






#### 작성 및 수정 내용
- 2024.09.24 \[C# 직렬화 역직렬화 초안 작성\]