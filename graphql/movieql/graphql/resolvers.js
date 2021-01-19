import { getMany, getOneById, createOne, removeOne } from "./db";
const resolvers = {
  Query: {
    movies: () => getMany(),
    movie: (_, { id }) => getOneById(id),
  },
  Mutation: {
    addMovie: (_, { title, rating }) => createOne(title, rating),
    removeMovie: (_, { id }) => removeOne(id),
  },
};

export default resolvers;
