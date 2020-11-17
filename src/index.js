import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App";

import {WishList} from './models/WishList'

const wishList = WishList.create({
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
});
ReactDOM.render(<App wishList={wishList}/>, document.getElementById("root"));

// setInterval(()=>{
//   wishList.items[0].changePrice(wishList.items[0].price + 1)
// },1000)