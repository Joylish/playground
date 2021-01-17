import { values } from "mobx";
import { flow, types, applySnapshot } from "mobx-state-tree";
import api from 'axios';

import { WishList } from "./WishList";
/* 
// #1 literal && union 사용
const User = types.model({
  id: types.string,
  name: types.string,
  // gender 값은 반드시 m 또는 f 여야 함
  gender: types.union(types.literal("m"), types.literal("f")),
}); 
*/

/*
// #2 union 사용
const Man = types.model({
	id: types.string,
  name: types.string,
  // ** literal 타입이란
  // single value types
	gender: types.literal('m')
})

const Woman = types.model({
  id: types.string,
  name: types.string,
  gender: types.literal("f")
});

const Human = types.union(Man, Woman); 
*/

const Options = (headers) => ({
  mode: "cors",
  headers,
  // withCredentials: true,
  // credentials: 'same-origin',
  timeout: 3000,
  validateStatus: function (status) {
    return status >= 200 && status < 300; // default
  },
});

// Config for endpoint that is accepting and returning only text.
const configText = Options({
  "Content-Type": "text/plain;charset=UTF-8",
  Accept: "text/plain",
});

// // Config for endpoint that is accepting and returning only json.
const configJson = Options({
  "Content-Type": "application/json;charset=UTF-8",
  Accept: "application/json",
});

// #3 enumeration 사용 
const User = types
  .model("User", {
    id: types.identifier,
    name: types.string,
    // gender 값은 반드시 m 또는 f 여야 함
    gender: types.enumeration("gender", ["m", "f"]),

    // WishList는 항상 object이고,
    //제공되지 않으면 {}임을 의미
    wishList: types.optional(WishList, {}),

    // User를 참조하도록 정의
    // 일종의 재귀 모델의 형태
    // User 상수가 아직 할당 되지 않았다는 오류가 발생
    // types.late를 사용하면 유형 참조를 연기
    recipient: types.maybe(types.reference(types.late(() => User))),
  })
  .actions((self) => ({
    // ** flow(function*()) === async function()
    // ** yield === await
    getSuggestions: flow(function* () {
      try {
        const response = yield api.get(
          `http://localhost:3001/suggestions_${self.gender}`
        );
        const suggestion = response.data.filter((item) => {
          return values(self.wishList).indexOf(item) === -1;
        });
        self.wishList.items.push(...suggestion);
      } catch (e) {
        console.log(e);
      }
      // const suggestions = yield response.json();
    }),
  }));

export const Group = types
  .model({
    users: types.map(User),
    currentUser: types.maybe(types.reference(User)),
  })
  .actions((self) => {
    let _cancelToken;
    let controller;
    return {
      select(userId) {
        self.currentUser = values(self.users).filter(
          (user) => user.id === userId
        )[0];
      },
      afterCreate() {
        self.load();
      },
      // load: function(){
      //   const p = myFlow.apply(null, arguments)
      //   pendingPromises.push(p)
      //   return p
      // },
      // load: flow(function*() {
      //   // 리로드 버튼을 많이 클릭하면 많은 요청이 진행
      //   // 다시 요청할 때 이전 요청 취소
      //   // 즉, 새로운 요청이 들어오면 현재 요청 중단
      //   _cancelToken = yield api.CancelToken.source().token
      //   yield api.get("http://localhost:3001/users",{
      //     cancelToken: _cancelToken
      //   })
      //   }).then(response=>{
      //     applySnapshot(self.users, response.data);
      //     console.log("success");
      //   })
      //   .catch(error=> {
      //       if (api.isCancel(error)) {
      //       console.log('Request canceled', error);
      //     } else {
      //       console.log(error);
      //     }
      //   });
      // }),
      // reload(){
      //   if (_cancelToken) self.load();
      // },
      // beforeDestory() {
      //   // pendingPromises.forEach((p) => p.cancel());
      //   if (_cancelToken) _cancelToken().abort();
      // },
      load: flow(function* () {
        controller = window.AbortController && new window.AbortController();
        try {
          const response = yield window.fetch(
            `http://localhost:3001/initial_state`,
            {
              signal: controller.signal,
            }
          );
          const group = yield response.json();
          applySnapshot(self, group);
          console.log("success");
        } catch (error) {
          console.log("failed: ", error);
        }
      }),
      reload() {
        console.log("reload");
        console.log(controller);
        if (controller) controller.abort();
        self.load();
      },
      beforeDestroy() {
        if (controller) controller.abort();
      },
      drawLots() {
        const allUsers = Array.from(self.users.values());
        // 사용자가 1명 이하일 때 랜덤으로 뽑을 인원 없다
        if (allUsers.length <= 1) return;

        // allUsers 복제
        let remaining = allUsers.slice();

        allUsers.forEach((user) => {
          // edge case: the only person without recipient
          // is the same as the only remaining lot
          // swap lot's with some random other person
          if (remaining.length === 1 && remaining[0] === user) {
            const swapWith =
              allUsers[Math.floor(Math.random() * (allUsers.length - 1))];
            user.recipients = swapWith.recipient;
            swapWith.recipient = self;
          } else
            while (!user.recipient) {
              // random하게 1명을 뽑기 (인덱스)
              let recipientIdx = Math.floor(Math.random() * remaining.length);

              // 현재 user가 아니면,
              // 1) assign it as recipient
              // 2) remove the lot
              if (remaining[recipientIdx] !== user) {
                user.recipient = remaining[recipientIdx];
                remaining.splice(recipientIdx, 1);
              }
            }
        });
      },
    };
});


