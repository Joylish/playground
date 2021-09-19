import fetch from "node-fetch";

const Fetch = ({
  url,
  methodType = "get",
  data,
  headers = {
    "Content-Type": "application/json",
  },
}) => {
  console.log(url);

  return fetch(url, {
    method: methodType,
    headers,
    body: JSON.stringify(data),
  }).then((res) => res.json());
};

// GET 방식 여러번 호출
const FetchAll = (urls) => {
  const result = [];

  console.log(urls);

  Promise.all(
    urls.map((url) =>
      Fetch({ url })
        .then((res) => res.json())
        .then((data) => {
          return data;
        })
    )
  )
    .then(
      (res) => {
        console.log(res);
      }
      // Promise.all(
      //   responses.map((res) => {
      //     console.log(res);

      //     // const ret = res.json();

      //     return res;
      //   })
      // )
    )
    .then((resps) => {
      console.log("texts: " + resps);
    })
    .catch((err) => {
      console.log(err);
    });
  return result;
};

export { Fetch, FetchAll };
