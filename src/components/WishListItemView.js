import React, { useState } from 'react'
import {observer} from 'mobx-react'
import {clone, getSnapshot, applySnapshot, getParent} from 'mobx-state-tree'

import WishListItemEdit from './WishListItemEdit'

const WishListItemView = ({item, readonly}) => {
  const [state, setState] = useState({
    edit: false,
    clone: null
  })
  
  const onToggleEdit = () => {
    // clone을 사용하여 
    // 원본 데이터가 변경되지 않도록 하기
    setState({edit: true, clone: clone(item)});
  }

  const onCancelEdit = () => {
    // ** applySnapshot()
    // 스냅샷에 제공된 모델 인스턴스의 상태
    // (the state of a model instance)를
    // 업데이트하는데 사용
    // 즉 clone 스냅샷을 만들고(getSnapshot)
    // 그 스냅샷을 모델에 적용(applySnapshot)
    applySnapshot(item, getSnapshot(state.clone));
    setState({ ...state, edit: false });
  }

  const onSaveEdit = () => {
    setState({clone: null, edit: false})
  };

  const onRemove = () => {
    item.remove()
  }

  return state.edit ? (
    <li className="item" style={{ display: "flex" }}>
      <WishListItemEdit item={item} />
      <button onClick={onSaveEdit}>💾</button>
      <button onClick={onCancelEdit}>❌</button>
    </li>
  ) : (
    <li className="item" style={{ display: "flex" }}>
      {item.image && (
        <img
          src={item.image}
          style={{ width: "150px", height: "150px" }}
          alt=""
        />
      )}
      <h3>{item.name}</h3>
      <span>$ {item.price}</span>
      {
      !readonly 
      &&
      <span style={{ display: "flex" }}>
        <button onClick={onToggleEdit}>✏️</button>
        <button onClick={onRemove}>🗑</button>
      </span>
      }
    </li>
  );
}

export default observer(WishListItemView);