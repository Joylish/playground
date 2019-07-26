# HTML

Hypertext Markup Language(HTML) is the standard markup language for creating web pages and web applications



#### 온라인 html, css, js  에디터 

https://codepen.io/pen/



### 태(tag)

* h 태그

  h1 ~ h6 태그는 HTML의 headings, 즉 제목 태그이다. heading h뒤에는 숫자가 붙는다.  숫자가 커지면 글씨가 작아진다. 따라서 <h1>은 가장 중요한 제목에 쓰이며 <h6>은 상대적으로 중요도가 떨어지는 제목일 때 쓰인다.
  
  ``` html
  <h1> 반갑습니다! </h1>
  <h2> 반갑습니다! </h2>
  <h3> 반갑습니다! </h3>
  ```

* strong 태그

  html 문서에서 어떤 텍스트 내용을 강조하기 위해 볼드체로 바꿀때 strong 태그가 쓰인다.

  

* u 태그

  html 문서에서 어떤 텍스트 내용을 강조하기 위해 밑줄을 그을 때 u 태그가 쓰인다.

  ```html
<strong>좋아하는 동물은 <u>강아지와 고양이</u></strong>입니다.
  ```
  
  
  
  ![1564061296301](C:\Users\IMPlay\AppData\Roaming\Typora\typora-user-images\1564061296301.png)



* 단락 구분; p 태그와 br 태그

  1) **br 태그 **; 줄바꿈 태그

  새로운 줄을 표현할 때 쓰인다.  br 태그의 특이한 점은 다른 태그들과 달리 **닫는 태그가 필요하지 않다.**

  ``` html
  제 이름은 이연주이고 영어이름은 Joy입니다.<br>
  <strong>좋아하는 동물은 <u>강아지와 고양이</u></strong>입니다.<br>
  좋아하는 음식은 라면입니다. 라면 중에서 볶음 너구리를 가장 좋아합니다:) 
  
  ```

  2) **p 태그**; 단락 표현 태그

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

  