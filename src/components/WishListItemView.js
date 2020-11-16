import React, { useState } from 'react'
import {observer} from 'mobx-react'
import {clone, getSnapshot, applySnapshot} from 'mobx-state-tree'

import WishListItemEdit from './WishListItemEdit'

const WishListItemView = ({item}) => {
  const [edit, setEdit] = useState(false)
  const [clonnedItem, setclonnedItem] = useState(null);

  const renderEditable = () => (
    <li className="item">
      <WishListItemEdit item={item} />
      <button onClick={onSaveEdit}>⭕</button>
      <button onClick={onCancelEdit}>❌</button>
    </li>
  );

  const onToggleEdit = () => {
    setclonnedItem(clone(item));
    setEdit(true);
  }

  const onCancelEdit = () => {
    setEdit(false);
  }

  const onSaveEdit = () => {
    applySnapshot(item, getSnapshot(clonnedItem));
    setclonnedItem(null);
    setEdit(false);
  };

  return edit ? (
    renderEditable()
  ) : (
    <li className="item">
      {item.image && <img src={item.image} />}
      <h3>{item.name}</h3>
      <span>{item.price}</span>
      <span>
        <button onClick={onToggleEdit}>🍴</button>
      </span>
    </li>
  );
}

export default observer(WishListItemView);