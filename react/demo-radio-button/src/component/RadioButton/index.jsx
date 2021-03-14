import React from "react";
import S from './style';

const RadioButton = ({isChecked, value, color, changeColorHandler}) => {
  return <S.Button 
      type="button"
      value={value}
      isChecked={isChecked}
      color={color}
      onClick ={changeColorHandler}
    />;
};

export default RadioButton;
