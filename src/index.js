import React from "react";
import ReactDOM from "react-dom";
import { onSnapshot } from 'mobx-state-tree';

import App from "./components/App";
import {WishList} from './models/WishList'

let initialState = {
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
}

if(localStorage.getItem("wishListApp")){
  const json = JSON.parse(localStorage.getItem("wishListApp"));
  if(WishList.is(JSON)){
    initialState = json
  }
}
const wishList = WishList.create(initialState);

// 새 스냅샷이 발생하면 onSnapshot 함수에서 
// 현재 state를 가져와서 로컬 스토리지에 저장
onSnapshot(wishList, snapshot => {
  localStorage.setItem("wishListApp", JSON.stringify(snapshot));
});

ReactDOM.render(<App wishList={wishList}/>, document.getElementById("root"));

// setInterval(()=>{
//   wishList.items[0].changePrice(wishList.items[0].price + 1)
// },1000)