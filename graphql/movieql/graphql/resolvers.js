const joylish = {
  name: "Joylish",
  age: "27",
  gender: "female",
};

const resolvers = {
  Query: {
    person: () => joylish,
  },
};

export default resolvers;
