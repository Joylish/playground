import styled from "styled-components";

const S = {
  Button: styled.input`
    width: 200px;
    height: 200px;
    background-color: ${(props) =>
      (props.isChecked && props.color) || "#ffffff"};
    color: ${(props) => (props.isChecked && "#ffffff") || "#000000"};
    font-size: 20px;
  `,
};

export default S;
