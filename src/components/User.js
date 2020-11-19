import React from 'react'
import {observer} from 'mobx-react'

import WishListView from './WishListView'


const User = ({user}) => {
  return (
    <>
      <h3>{user.recipient && user.recipient.name}</h3>
      <button onClick={user.getSuggestions}>Suggestions</button>
      {user.recipient && <WishListView wishList={user.wishList} readonly />}
    </>
  );
}

export default observer(User);