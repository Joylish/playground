import { values } from "mobx";
import { types } from 'mobx-state-tree';

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

// #3 enumeration 사용 
const User = types.model({
  id: types.string,
  name: types.string,
  // gender 값은 반드시 m 또는 f 여야 함
  gender: types.enumeration("gender", ["m", "f"]),
  wishList: types.maybe(WishList),
});

export const Group = types
  .model({
    users: types.map(User),
    currentUser: types.maybe(User),
  })
  .actions((self) => ({
    select(userId) {
      console.log(values(self.users).filter(
        (user) => user.id === userId
      )[0])
      self.currentUser = values(self.users).filter(
        (user) => user.id === userId
      )[0];
    },
  }));


