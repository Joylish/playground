import React, {useState} from "react";
import {values} from 'mobx';
import {observer} from 'mobx-react'


const GroupView = ({ group }) => {
  const onSelectUser = event => {
    group.select(event.target.value);
  }

  return (
    <select onChange={onSelectUser}>
      <option>👦 Select user 👧</option>
      {values(group.users).map((user) => (
        <option key={user.id} value={user.id}>
          {user.name}
        </option>
      ))}
    </select>
  );
}

export default observer(GroupView);
