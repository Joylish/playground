import React from 'react'
import {observer} from 'mobx-react'

import WishListItemView from './WishListItemView'
import WishListItemEntry from './WishListItemEntry';

const WishListView = ({wishList}) => (
  <div className="list">
    <WishListItemEntry wishList={wishList} />
    <h3>Total: $ {wishList.totalPrice}</h3>
    <ul>
      {wishList.items.map((item, idx)=><WishListItemView key={idx} item={item}/>)}
    </ul>
  </div>
)
export default observer(WishListView);