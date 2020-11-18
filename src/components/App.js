import React from 'react'
import { observer } from "mobx-react";

import GroupView from "./GroupView";
import WishListView from './WishListView'

const App = ({ group, wishList }) => (
  <>
    <h1>😍 WishList 🥰</h1>
    <GroupView group={group} />
    {group.currentUser && (
      <WishListView wishList={group.currentUser.wishList} />
    )}
  </>
);

export default observer(App);
