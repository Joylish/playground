import React from 'react';

const Calculator = ({
  input, accumulator, clickNumberHandler, clickOperatorhandler,
}) => (
  <>
    <h1>저는 계산기에요</h1>
    <h2 className="display">{input || accumulator}</h2>
    <p>
      {[...Array(10)].map((_, number) => (
        <button type="button" onClick={() => clickNumberHandler(number)}>{number}</button>
      ))}
    </p>
    <p>
      {['+', '-', '*', '/', '='].map((operator) => (
        <button type="button" onClick={() => clickOperatorhandler(operator)}>{operator}</button>
      ))}
    </p>
  </>
);

export default Calculator;
