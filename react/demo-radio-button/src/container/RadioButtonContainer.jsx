import React, { useState } from "react";

import RadioButton from "../component/RadioButton/index";

import colors from "../util/colors";

const RadioButtonContainer = ({ initialColor }) => {
  const [selectedColor, setSelectedColor] = useState(initialColor);

  const onChangeColor = (e) => {
    const {value} = e.target;
    const selected = colors.filter((color) => color.name === value);
    if (selected) setSelectedColor(selected[0]);
  };

  return (
    <>
      {colors.map((color) => (
        <RadioButton
          id={color.hexcode}
          value={color.name}
          color={color.hexcode}
          isChecked={color.name === selectedColor.name}
          changeColorHandler={onChangeColor}
        />
      ))}
    </>
  );
};

export default RadioButtonContainer;
