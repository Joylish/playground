import {reaction} from 'mobx'
import {getSnapshot, onSnapshot, onPatch} from 'mobx-state-tree'

import {WishList, WishListItem} from './WishList'


it('can create a instance of a model "WishListItem"', ()=>{
  const item = WishListItem.create({
    name: "Happy Box",
    price: 2000,
  });
  expect(item.price).toBe(2000);
  expect(item.image).toBe("")
  item.changeName("Mong Mong")
  expect(item.name).toBe("Mong Mong");
})


it("can create a wishList", ()=>{
  const list = WishList.create({
    items: [
      {
        name: "Happy Box",
        price: 2000,
      },
    ],
  });

  expect(list.items.length).toBe(1)
  expect(list.items[0].price).toBe(2000)
})

it("can add new items", ()=>{
  const list = WishList.create()
  const states = []
  const patches = []

  onSnapshot(list, snapshot => {
    states.push(snapshot)
  })

  onPatch(list, patch=>{
    patches.push(patch)
  })

  list.add(WishListItem.create({
    name: "Snow",
    price: 10
  }))

  expect(list.items.length).toBe(1)
  expect(list.items[0].name).toBe("Snow")
  list.items[0].changeName("White")
  expect(list.items[0].name).toBe("White");

  expect(getSnapshot(list)).toEqual({
    items: [
      {
        name: "White",
        price: 10,
        image: ""
      },
    ],
  });

  // __snapshots 폴더에 기록됨
  // expect(getSnapshot).toMatchSnapshot()
  // expect(states).toMatchSnapshot()
  // expect(patches).toMatchSnapshot()
  
})

it("can calculate the total price of a wishList", ()=>{
  const list = WishList.create({
    items: [
      {
        name: "Happy Box",
        price: 2000,
      },
      {
        name: "White",
        price: 10,
        image: "",
      },
    ],
  });
  
  expect(list.totalPrice).toBe(2010)

  let changed = 0
  reaction(()=> list.totalPrice, () => changed++)
  expect(changed).toBe(0)
  list.items[0].changePrice(2010)
  expect(changed).toBe(1)
})