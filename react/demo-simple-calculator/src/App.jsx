import React, { useState } from 'react';

import Calculator from './Calculator';

const App = () => {
  const [state, setState] = useState({
    input: 0,
    operator: '',
    accumulator: 0,
  });

  const operation = {
    '': (x, y) => x || y,
    '=': (x, y) => x || y,
    '+': (x, y) => x + y,
    '-': (x, y) => x - y,
    '*': (x, y) => x * y,
    '/': (x, y) => x / y,
  };

  const calculation = (operator, accumulator, number) => operation[operator](accumulator, number);

  const { input, operator, accumulator } = state;

  const clickNumberHandler = (number) => {
    setState({ input: (input * 10) + number, operator, accumulator });
  };

  const clickOperatorhandler = (value) => {
    setState({
      input: 0,
      operator: value,
      accumulator: calculation(operator, accumulator, input),
    });
  };

  return (
    <Calculator
      {...state}
      clickNumberHandler={clickNumberHandler}
      clickOperatorhandler={clickOperatorhandler}
    />
  );
};

export default App;
