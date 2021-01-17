import {types, getParent, destroy} from 'mobx-state-tree'

export const WishListItem = types
  .model({
    name: types.string,
    price: types.number,
    image: "",
  })
  .actions(self => ({
    // changeName: changeName(newName) {
    //   self.name = newName;
    // }
    changeName(newName) {
      self.name = newName;
    },
    changePrice(newPrice){
      self.price = newPrice
    },
    remove(){
      // 현재 모델 인스턴스의 부모 찾기
      getParent(self, 2).remove(self);
      // WishList: ｛ items: [｛ self ｝] ｝
      // getParent(getParent(self))라는 의미
      // 즉, WishList에 접근하는 것
    }
  }))

export const WishList = types.model({
  items: types.optional(types.array(WishListItem),[]),
  // recomputed 필요
  // totalPrice: types.number
}).actions(self=>({
  add(item){
    self.items.push(item)
  },
  
  // remove(item){
  //   self.items.splice(self.items.indexOf(item), 1)
  // }
  remove(item){
    destroy(item);
  }
})).views(self=>({
  get totalPrice(){
    return self.items.reduce((sum, entry) => sum + entry.price, 0)
  }
}))