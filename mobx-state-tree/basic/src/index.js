import React from "react";
import ReactDOM from "react-dom";
import { getSnapshot, addMiddleware } from 'mobx-state-tree';

import App from "./components/App";
// import {WishList} from './models/WishList'
import { Group } from "./models/Group";

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
  group:{
   users: {
    "a342": {
      id: "a342",
      name: "Homer",
      gender: "m"
      }
    ,
    "5fc2": {
      id: "5fc2",
      name: "Marge",
      gender: "f"
      }
    ,
    "663b": {
      id: "663b",
      name: "Bart",
      gender: "m"
      }
    ,
    "65aa": {
      id: "65aa",
      name: "Maggie",
      gender: "f"
      }
    ,
    "ba32": {
      id: "ba32",
      name: "Lisa",
      gender: "f"
      }
   }
  }
};


// 로컬 스토리지로 현재 state (state tree)를 보존
// 한계: 무언가를 변경할 때 마다 앱을 다시 로드해야 함
// 대책: hot module reloading 기술 적용
// ** hot module reloading 이란?
// webpack은 JS 파일을 수정이 되면 변경 사항을 
// 반환 application으로 보내고 메모리 모듈을 대체
const renderApp = (group) =>{
  ReactDOM.render(<App group={group}/>, document.getElementById("root"));
}

const group = window.group= Group.create(initialState.group);

/* 
addMiddleware를 사용하여 
group 모델에서 호출되는 액션 type과 name을 
콘솔 로그에 출력
*/
addMiddleware(group, (call, next) => {
  console.log(`[${call.type}] [${call.name}]`);
  next(call);
});

renderApp(group); 

if (module.hot){
  // 1) 컴포넌트가 변경되는 경우, 
  // 루트 /에서 application 재랜더링
  module.hot.accept(["./components/App"], ()=> {
   renderApp(group);
  })

  // 2) 모델이 변경된 경우, snapshot을 이용해서
  // 현재 state tree로 유지되게 한다.

  module.hot.accept(["./models/Group"], () => {
    const snapshot = getSnapshot(group);
    renderApp(group.create(snapshot));
  });
}

// setInterval(()=>{
//   wishList.items[0].changePrice(wishList.items[0].price + 1)
// },1000)