import axios from "./CustomizeAxios";

const getListMovies = () => {
  return axios.get("movies/viewAllMovie");
};

const getSearch = (message) => {
  const api = "movies/searchMovie/" + message;
  return axios.get(api);
};

const getFilterMovies = (message) => {
  const api = "movies/filterMovie/" + message;
  return axios.get(api);
};

const getUserMovieDetailByID = (id) => {
  const api = `/movies/viewMovieInfo/${id}`;
  return axios.get(api);
};

const addFavMovie = (movieId, memberId) => {
  const api = `movies/favourite/${movieId}-${memberId}`;
  return axios.post(api);
};

const addHistoryMovie = (movieId, memberId) => {
  const api = `/movies/watch/${movieId}-${memberId}`;
  return axios.get(api);
};

const getMemberHistory = (id) => {
  const api = `movies/viewMovieHistory/${id}`;
  return axios.get(api);
};

const getMemberFavorite = (id) => {
  const api = `movies/memberfavourite/${id}`;
  return axios.get(api);
};
//Admin service
const addMovie = (movieData) => {
  return axios.post("/admin/add", movieData);
};

const deleteMovie = (id) => {
  const api = `admin/delete/${id}`;
  return axios.post(api);
};

const getAdminMovieDetailByID = (id) => {
  const api = `/admin/viewMovieInfo/${id}`;
  return axios.get(api);
};

const updateMovie = (movieData) => {
  return axios.post("/admin/update", movieData);
};

export {
  getListMovies,
  getSearch,
  getFilterMovies,
  addMovie,
  deleteMovie,
  getAdminMovieDetailByID,
  updateMovie,
  getUserMovieDetailByID,
  addFavMovie,
  getMemberHistory,
  getMemberFavorite,
  addHistoryMovie,
};
