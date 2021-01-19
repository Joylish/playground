export let movies = [
  {
    id: 1,
    title: "About Time",
    rating: "9.2",
  },
  {
    id: 2,
    title: "Charlie and the Chocolate Factory",
    rating: "8.8",
  },
  {
    id: 3,
    title: "Tenet",
    rating: "6.8",
  },
  {
    id: 4,
    title: "Joje",
    rating: "6.8",
  },
];

export const getMany = () => movies;

export const getOneById = (id) => {
  selectedMovies = () => movies.filter((movie) => movie.id === id);
  return selectedMovies[0];
};

export const createOne = (title, rating) => {
  const movie = {
    id: movies.length + 1,
    title,
    rating,
  };
  movies = [...movies, movie];
  return movie;
};

export const removeOne = (id) => {
  const filteredMovies = movies.filter((movie) => movie.id !== id);
  if (filteredMovies.length < movies.length) {
    movies = filteredMovies;
    return true;
  }
  return false;
};
