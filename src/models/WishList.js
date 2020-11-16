import {types} from 'mobx-state-tree'

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
    }
  }))

export const WishList = types.model({
  items: types.optional(types.array(WishListItem),[]),
  // recomputed 필요
  // totalPrice: types.number
}).actions(self=>({
  add(item){
    self.items.push(item)
  }
})).views(self=>({
  get totalPrice(){
    return self.items.reduce((sum, entry) => sum + entry.price, 0)
  }
}))