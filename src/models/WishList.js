import {types} from 'mobx-state-tree'

const data = {
  name: "Happy Box",
  price: 2000,
  image:
    "https://i.pinimg.com/474x/aa/a6/81/aaa681b77b7ea856e706b904cdb49d20.jpg",
};

export const WishListItem = types.model({
  name: types.string,
  price: types.number,
  image: "",
});

export const WishList = types.model({
  items: types.optional(types.array(WishListItem),[])
})