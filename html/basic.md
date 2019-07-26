# HTML

Hypertext Markup Language(HTML) is the standard markup language for creating web pages and web applications

### 구성요소

* **elements**: <u>시작 태그 + 내용 + 종료 태그</u>로 이루어진 모든 HTML 명령어

* **tag**: elements의 일부; 시작태그와 종료 태그**만** 지칭 (< p > < /p >)

* **attribute**: element의 시작 태그 안에서 명령어; 태그의 속성을 좀 더 구체화 (align)

* **argument**: attribute에 해당하는 실질적인 값 ( center)

  ```html
  <p align = "center">
      elements: 전체
      tag: p 시작 태그(p), p 끝 태그(/p)
      attribute: align
      argument: center
  </p>
  ```

  

### HTML 기본 구성

HTML

현재 이 문서가 HTML을 사용한 것임을 시작과 끝에 HTML 태그를 달아서 표현한다.

* HEAD

  HTML 문서에 대한 기본정보를 포함하고 있다.

  - Title: 문서 상단의 제목 설정
  - META: 문서 정보
  - script: 여러가지 언어 등을 사용한 다양한 프로그램이 위치하는 공간
  - style: 문서 장식

  -> HTML,  HEAD,  Title 등의 태그를 적어도 화면상에 출력되지 않는다.  <u>웹 브라우저가 알아야할 중요한 정보</u>들이 있다. Title은 화면에 출력되지는 않지만 웹브라우저의 제목 표시줄에 표시된다.

  

* BODY

   실제로 <u>화면에 직접 출력</u>되는 부분이다.

  * 주요 attribute
    * bgcolor: 본문의 배경색 지정
    * leftmargin: 본문의 왼쪽 여백 지정
    * topmargin:본문의 상단 여백 지정 



### 온라인 html, css, js  에디터

[https://codepen.io/pen/](https://codepen.io/pen/ "https://codepen.io/pen/")



### 주석

```html
<!---여기는 주석이에요--->
```



### 텍스트 관련 태그의 종류

HTML을 처음 배울때는 CSS를 모르는 상태이기에  **논리적 태그**보다 물리적 태그를 자주 사용한다.  그러나 HTML 태그의 성격은 화면에 출력하는 형태를 규정하는 것이 아니고 <u>**텍스트의 의미**</u>를 중요하므로 **논리적 태그**를 자주 이용하는 것이 좋다.

1. 물리적 태그

   ![1564156159567](C:\Users\IMPlay\Desktop\뜸부기\html\물리적태그.png)

   

2. 논리적 태그

   ![1564156744328](C:\Users\IMPlay\Desktop\뜸부기\html\logicalTag.png)

### 자주 쓰는 태그(tag)

* h 태그

   h1 ~ h6 태그는 HTML의 headings, 즉 제목 태그이다. heading h뒤에는 숫자가 붙는다.  숫자가 커지면 글씨가 작아진다. 따라서 <h1>은 가장 중요한 제목에 쓰이며 <h6>은 상대적으로 중요도가 떨어지는 제목일 때 쓰인다.
  
  ``` html
  <h1> 반갑습니다! </h1>
  <h2> 반갑습니다! </h2>
  <h3> 반갑습니다! </h3>
  ```

![1564149882963](C:\Users\IMPlay\Desktop\뜸부기\html\h태그.png)



* strong 태그와 b태그

  html 문서에서 어떤 텍스트 내용을 강조하기 위해 볼드체로 바꿀때 strong 태그가 쓰인다. <b>태그는 bold의 약자로 **단순히 텍스트를 굵게 표시**하라는 의미를 가지고, <strong>태그는 **강조**의 의미를 가진다. <strong>태그로 둘러싸인 텍스트가 중요하다는 의미이다.

  ```html
  제 이름은 <strong>이연주</strong>입니다.
  <b>제</b> 취미는 유투브 영상보는 것입니다.
  ```

  

* u태그

   html 문서에서 어떤 텍스트 내용을 강조하기 위해 밑줄을 그을 때 u 태그가 쓰인다.

  ```html
  <strong>좋아하는 동물은 <u>강아지와 고양이</u></strong>입니다.
  ```

![1564149928051](C:\Users\IMPlay\Desktop\뜸부기\html\strong와 u태그.png)



* 단락 구분 태그; **br 태그 **와 **p 태그**

   html은 공백과 엔터를 여러번 입력해도 하나의 공백으로만 인식한다.

  

  1) **br (line break) 태그 **; 줄바꿈 태그

  새로운 줄을 표현할 때 쓰인다.  br 태그의 특이한 점은 다른 태그들과 달리 **닫는 태그가 필요하지 않다.**

  ``` html
  제 이름은 이연주이고 영어이름은 Joy입니다.<br>
  <strong>좋아하는 동물은 <u>강아지와 고양이</u></strong>입니다.<br>
  좋아하는 음식은 라면입니다. 라면 중에서 볶음 너구리를 가장 좋아합니다:) 
  ```

  

  2) **p (paragraph) 태그 **; 단락 표현 태그

  하나의 단락을 그룹핑할 수 있도록 열고 닫는 태그가 존재한다. 단락을 표현할 때는 줄바꿈 태그br 태그보다는 css와 함께 p 태그를 이용하는 것이 더 좋다. p 태그를 통해서 단락의 경계를 분명히 하면서 css를 통해서 p 태그의 디자인을 변경할 수 있기 때문이다.

  ``` html
  <p>
  제 이름은 이연주이고 영어이름은 Joy입니다.
  </p>
  <p style = "margin-top: 20px; width:600px">
      <strong>좋아하는 동물은 <u>강아지와 고양이</u></strong>입니다.
      좋아하는 음식은 라면입니다. 라면 중에서 볶음 너구리를 가장 좋아합니다:) 
  </p>
  ```

  

* **a(anchor) 태그**

  a 태그를 이용해서 링크를 만들 수 있다.

  주요 attribute

  - <u>href</u>: 이동할 페이지 주소 지정
  - <u>target</u>: 웹페이지 어떻게 열것인지 지정
  - title: 웹페이지 이름 지정; 마우스를 올렸을 때 타이틀에 지정해주었던 값이 표시됨



* **img 태그**

  주요 attribute

  * src: 이미지 경로
  * border: 이미지의 경계선(1 px) 지우기
  * width: 이미지 너비
  * height: 이미지 높이

  ```html
  <img src ="https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" width = "100" height="200">
  ```

  