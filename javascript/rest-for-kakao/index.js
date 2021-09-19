import { start, onCalls, action, testFetchAll } from "./api/index.js";

const simulator = async () => {
  const user = "tester";
  const problem = 0;
  const count = 2;

  const ret = await start(user, problem, count);
  const token = ret["token"];

  const calls = await onCalls(token);
  console.log(calls);

  const result = await action(token, [
    { elevator_id: 0, command: "UP" },
    { elevator_id: 1, command: "STOP" },
  ]);
  console.log(result);

  /*
   * Todo : fix testFetchAll
   */
  // const resultForTest = await testFetchAll(user, count);
  // console.log(resultForTest);
};

simulator();
