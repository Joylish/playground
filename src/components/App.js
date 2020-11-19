import React from 'react'
import { observer } from "mobx-react";

import GroupView from "./GroupView";
import User from './User';

const App = ({ group }) => (
  <>
    <h1>😍 WishList 🥰</h1>
    <p>
      <button onClick={group.reload}>Reload From Server</button>
      <button onClick={group.drawLots}>Draw lots</button>
    </p>
    <GroupView group={group} />
    {group.currentUser && <User user={group.currentUser} />}
  </>
);

export default observer(App);
