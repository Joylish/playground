import React from 'react'
import WishListView from './WishListView'

const App = ({wishList}) => (
  <>
    <h1>😍 WishList 🥰</h1>
    <WishListView wishList={wishList}/>
  </>
);

export default App;
