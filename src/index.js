import React from "react";
import ReactDOM from "react-dom";
import { onSnapshot, getSnapshot } from 'mobx-state-tree';

import App from "./components/App";
import {WishList} from './models/WishList'

// if(localStorage.getItem("wishListApp")){
//   const json = JSON.parse(localStorage.getItem("wishListApp"));
//   if(WishList.is(JSON)){
//     initialState = json
//   }
// }

// 새 스냅샷이 발생하면 onSnapshot 함수에서 
// 현재 state를 가져와서 로컬 스토리지에 저장
// onSnapshot(wishList, snapshot => {
//   localStorage.setItem("wishListApp", JSON.stringify(snapshot));
// });

const initialState = {
  items: [
    {
      name: "Happy Box",
      price: 2000,
      image:
        "https://i.pinimg.com/474x/aa/a6/81/aaa681b77b7ea856e706b904cdb49d20.jpg",
    },
    {
      name: "White",
      price: 10,
      image:
        "https://st2.depositphotos.com/1000336/8268/i/950/depositphotos_82683780-stock-photo-white-christmas-cake-with-decorations.jpg",
    },
  ],
};

// 로컬 스토리지로 현재 state (state tree)를 보존
// 한계: 무언가를 변경할 때 마다 앱을 다시 로드해야 함
// 대책: hot module reloading 기술 적용
// ** hot module reloading 이란?
// webpack은 JS 파일을 수정이 되면 변경 사항을 
// 반환 application으로 보내고 메모리 모듈을 대체
const renderApp = wishList =>{
  ReactDOM.render(<App wishList={wishList}/>, document.getElementById("root"));
}

const wishList = WishList.create(initialState); 

renderApp(wishList); 

if (module.hot){
  
  // 1) 컴포넌트가 변경되는 경우, 
  // 루트 /에서 application 재랜더링
  module.hot.accept(["./components/App"], ()=> {
  console.log("component re-rendering");
   renderApp(wishList);
  })

  // 2) 모델이 변경된 경우, snapshot을 이용해서
  // 현재 state tree로 유지되게 한다.
   module.hot.accept(["./models/WishList"], () => {
    console.log('new model')
    const snapshot = getSnapshot(wishList);
    renderApp(WishList.create(snapshot));
   });
}

// setInterval(()=>{
//   wishList.items[0].changePrice(wishList.items[0].price + 1)
// },1000)