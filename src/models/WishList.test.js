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
  list.add(WishListItem.create({
    name: "Snow",
    price: 10
  }))

  expect(list.items.length).toBe(1)
  expect(list.items[0].name).toBe("Snow")
  list.items[0].changeName("White")
  expect(list.items[0].name).toBe("White");
  
})