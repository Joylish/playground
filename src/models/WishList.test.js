import {WishList, WishListItem} from './WishList'

it('can create a instance of a model "WishListItem"', ()=>{
  const item = WishListItem.create({
    name: "Happy Box",
    price: 2000,
  });
  expect(item.price).toBe(2000);
  expect(item.image).toBe("")
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

  expect(list.items.length).toBe([])
})