$(function () {
  "use strict";

  let state = {
    input: 0,
    operator: "",
    accumulator: 0,
  };

  const operation = {
    "": (x, y) => x || y,
    equal: (x, y) => x || y,
    plus: (x, y) => x + y,
    minus: (x, y) => x - y,
    multiply: (x, y) => x * y,
    divide: (x, y) => x / y,
    percent: (x, _) => x / 100,
  };

  const calculation = (operator, accumulator, number) =>
    operation[operator](accumulator, number);

  const clickNumberHandler = (value, isNumber) => {
    state = { ...state, input: state.input * 10 + value };
    $(".resultdisplay").text(state.input);
  };

  const clickOperatorhandler = (value) => {
    const { input, operator, accumulator } = state;
    state = {
      input: 0,
      operator: value === "equal" ? "" : value,
      accumulator: calculation(operator, accumulator, input),
    };
    $(".resultdisplay").text(state.accumulator || state.input);
  };

  const clickClearhandler = () => {
    state = {
      input: 0,
      operator: "",
      accumulator: 0,
    };
    $(".resultdisplay").text(state.input);
  };

  $(".number").click(function () {
    const value = $(this).data("number");
    clickNumberHandler(value);
  });

  $(".operator").click(function () {
    clickOperatorhandler($(this).data("operator"));
  });

  $(".clear").click(function () {
    clickClearhandler();
  });
});
