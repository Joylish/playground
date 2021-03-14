import React from "react";

import RadioButtonContainer from "./container/RadioButtonContainer";

function App() {
  const initialColor = { name: "red", hexcode: "#e03131"};
  return (
    <div>
      <h1>색깔을 선택하세요!</h1>
      <RadioButtonContainer initialColor={initialColor} />
    </div>
  );
}

export default App;
