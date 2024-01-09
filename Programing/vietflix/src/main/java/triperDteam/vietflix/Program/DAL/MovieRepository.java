package triperDteam.vietflix.Program.DAL;

import triperDteam.vietflix.Program.Entity.Movie.Movie;
import triperDteam.vietflix.Program.Model.MovieGenreModel;
import triperDteam.vietflix.Program.Model.MovieLanguageModel;

import java.util.List;

public interface MovieRepository {
    List<Movie> getListMovie();
    String updateGenre(int movie_id, int genre_id);
    List<MovieGenreModel> getListMovieGenreModel();
    List<MovieLanguageModel> getListMovieLanguageModel();
    Movie getMovieById(int id);
    List<Movie> getMemberHistory(int id);
}
