export const people = [
  {
    id: 1,
    name: "Joylish",
    age: "27",
    gender: "female",
  },
  {
    id: 2,
    name: "ko",
    age: "28",
    gender: "male",
  },
  {
    id: 3,
    name: "park",
    age: "29",
    gender: "female",
  },
  {
    id: 4,
    name: "dong",
    age: "24",
    gender: "male",
  },
];

export const getById = (id) => {
  filteredPeople = () => people.filter((person) => person.id === id);
  return filteredPeople[0];
};
