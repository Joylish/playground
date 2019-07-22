# ajou-dirtycode refactoring

> 이번 과제는 테스트 코드를 먼저 작성한 후, 리팩토링을 하는 순서로 진행되었다.

### 전체 코드 파악하기
#### 	1. 전체 흐름

DirtySample의 updateQuality() 메서드는 크게 3개의 if문으로 구성된다. 시간이 흐르면서 각 item의 quality와 sell In이 변하고 이에 따라 그 다음 item의 quality가 update된다. 

​	1) quality의 값을 증가하거나 감소  (또는 0)

​	2) quality의 값은 0 이상 50 이하이다.

​		- sellin의 값을 감소 

#### 	2. item 필드

​	1) **name**: item 종류

- Aged Brie
- Backstage passes to TAFKAL80ETC concert (*이하 Backstage로 생략*)
- Sulfuras, Hand of Ragnaros (*이하 Sulfuras로 생략*)
- 세가지 모두 아닌 경우

​	2) **quality**: item 품질

​	3) **sell In**: item 판매량



<hr/>
### 조건문 분석하기
#### 1. 첫째 if문
* `if` Aged Brie도 아니고, Backstage도 아닐 때
    - `if` quality가 0보다 크면
        + `if` Sulfuras가 아니면
            `item의 quality를 -1 감소`

* `else` Aged Brie이거나, Backstage 둘 중 하나 일 때
    - `if` quality가 50보다 작으면
        `item의 quality를 +1 증가`
        + `if` Backstage 일 때
            * `if` sellIn이 11보다 작으면
                - quality가 50보다 작으면 `item의 quality를 +1 증가`
            * `if` sellIn이 6보다 작으면
                - quality가 50보다 작으면 `item의 quality를 +1 증가`


> Aged Brie도 아니고, Backstage도 아니고, Sulfuras도 아닐 경우 <br>
`quality 가 0보다 크면 quality를 -1감소한다.`

> Aged Brie일 때 <br>
`quality가 50보다 작으면 quality를 +1 증가한다.` (Aged Brie, Backstage 공통)

> Backtage일 때 <br>
`quality가 50보다 작으면 quality를 +1 증가한다.` (Aged Brie, Backstage 공통) <br>
`sellIn이 11보다 작고 quality가 50보다 작으면 quality를 +1 증가한다.` <br>
`sellIn이 6보다 작고 quality가 50보다 작으면 quality를 +2 증가한다.`


#### 2. 둘째 if문
* `if` Sulfuars가 아닐 때
    `item의 sellIn을 -1 감소`

> Aged Brie일 때, Backstage 일 때, 또는 세가지 모두 아닌 경우 <br>
`sellIn을 -1 감소`


#### 3. 셋째 if문
* `if` sellIn이 0보다 작으면
    - `if` Aged Brie가 아닐 때
        + `if` Backstage가 아닐 때
            * `if` quality가 0보다 클 때
                `if` Sulfuras가 아닐 때
                    `item의 quality를 -1 감소`
        + `else` Backstage일 때
            `item의 quality는 0`
    - `else` Aged Brie일 때
        + `if` quality가 50보다 작으면
            `item의 quality +1 증가`
        
> Aged Brie도 아니고, Backstage도 아니고, Sulfuras도 아닐 경우 <br>
`sellIn이 0보다 작고 quality 가 0보다 크면 quality를 -1감소한다.`

> Backstage일 경우 <br>
`sellIn이 0보다 작으면 quality는 0`

> Aged Brie일 경우 <br>
`sellIn이 0보다 작고 quality가 50보다 작으면 quality를 +1 증가한다.`

<hr/>
### 테스트 method 구현하기

위에서 name은 크게 4가지로 나뉜다는 점을 다시 한 번 상기하자. <br>
그러므로 크게 4가지의 상황에서 quality와 sellIn의 값이 어떻게 변하는지 
hamcrest의 assertThat을 이용하여 확인해보면서 테스트 코드를 작성 하였다.    

* 첫번째 if문 부터 차근차근 내려오면서 살펴보자.

1. 모두 아닐 경우  ( ~~Aged Brie~~, ~~BackStage~~, ~~Sulfuras~~) <br>
    `quality 가 0보다 크면 quality를 -1감소한다.` <br>
    `sellIn을 -1 감소` <br>
    `sellIn이 0보다 작고 quality 가 0보다 크면 quality를 -1감소한다.`
    
2. Aged Brie인 경우 <br>
    `quality가 50보다 작으면 quality를 +1 증가한다.` <br>
    `sellIn을 -1 감소` <br>
    `sellIn이 0보다 작고 quality가 50보다 작으면 quality를 +1 증가한다.`
    
3. Backstage 인 경우 <br>
    `quality가 50보다 작으면 quality를 +1 증가한다.` <br>
    `sellIn이 11보다 작고 quality가 50보다 작으면 quality를 +1 증가한다.` <br>
    `sellIn이 6보다 작고 quality가 50보다 작으면 quality를 +1 증가한다.` <br>
    `sellIn을 -1 감소`
    `sellIn이 0보다 작으면 quality는 0`

4. Sulfuras 일 때 <br>
  ~~놀랍게도 아무일도 하지 않는다~~

  

<hr/>

### 리팩토링

1. 클래스 이름 변경

   시간이 흐르면서 각 item의 quality와 sell In이 변하고 이에 따라 그 다음 item의 quality를 update하는 코드의 전체 흐름을 반영하기 위해 클래스 이름은 DirtySample에서 조금 더 의미 있는 'ManageItem'으로 바꾸었다. 

2. updateItem() 메서드

   기존의 updateQuality() 메서드에서 item의 sell In이 변하기 때문에 포괄하기 위해 메서드 이름을 updateItem() 로 바꾸었다.

   - 가독성을 높이기 위해 for 문을 인덱스형식 for(int i=0; i<items.size();i++)에서 배열의 모든 요소를 출력하는 향상된 for문 형식 for(Item item : items)으로 바꾸어 표현했다.
   - 전체 코드 흐름 파악에서 미리 말했듯이 해당 메서드는 크게 if문 3개로 나누어졌다. 각 if문에 대해 updateQualityExceptForSulfuras(item), updateSellIn(item), updateQualityBasedOnSellInLowerThan0(item) 메서드로 extract하였다.

``` java
public void updateItem() {
	for (Item item :items) {
		updateQualityExceptForSulfuras(item);
		updateSellIn(item);
		updateQualityBasedOnSellInLowerThan0(item);
	}
}
```

3. updateQualityExceptForSulfuras(item)

   Sulfuras를 제외한 item에 대해서 quality를 update하는 메서드이다.

   * 

``` java
 private void updateQualityExceptForSulfuras(Item item) {
        if (isExceptForAgedBrieAndBackstage(item)) {
            manageQualityBasedOnNotSulfuras(item);
        } else {
            manageQualityBasedOnAgedBrieOrBackstage(item);
        }
    }
```