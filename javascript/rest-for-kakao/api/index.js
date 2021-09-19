import { Fetch, FetchAll } from "../util/index.js";

const origin = "http://localhost:8000";

const start = (user, problem, count) => {
  const url = origin + "/start" + "/" + user + "/" + problem + "/" + count;

  return Fetch({ url, methodType: "post" });
};

const onCalls = (token) => {
  const url = origin + "/oncalls";

  return Fetch({
    url,
    headers: {
      "X-Auth-Token": token,
      "Content-Type": "application/x-www-form-urlencoded",
    },
  });
};

const action = (token, cmds) => {
  const url = origin + "/action";

  return Fetch({
    url,
    methodType: "post",
    headers: {
      "X-Auth-Token": token,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    data: { commands: cmds },
  });
};

const testFetchAll = (user, count) => {
  const url1 = origin + "/start" + "/tester-1/0/" + count;
  const url2 = origin + "/start" + "/tester-2/0/" + count;
  const url3 = origin + "/start" + "/tester-3/0/" + count;

  return FetchAll([url1, url2, url3]);
};

export { start, onCalls, action, testFetchAll };
