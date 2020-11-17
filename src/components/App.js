import React from 'react'

import GroupView from "./GroupView";
import WishListView from './WishListView'

const App = ({ group, wishList }) => (
  <>
    <h1>😍 WishList 🥰</h1>
    <GroupView group={group} />
    {console.log(`App-currentUser: ${group.currentUser}`)}
    {group.currentUser && (
      <WishListView wishList={group.currentUser.wishList} />
    )}
  </>
);

export default App;
