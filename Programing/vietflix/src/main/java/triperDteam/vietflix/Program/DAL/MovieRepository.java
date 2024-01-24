package triperDteam.vietflix.Program.DAL;

import triperDteam.vietflix.Program.Entity.Movie.Movie;
import triperDteam.vietflix.Program.Model.*;

import java.util.List;

public interface MovieRepository {
    List<Movie> getListMovie();
    List<MovieGenreModel> getListMovieGenreModel();
    List<MovieLanguageModel> getListMovieLanguageModel();
    Movie getMovieById(int id);
    List<Movie> getMemberHistory(int id);

    String saveNewMovie(MovieModel movieModel);

    String saveUpdateMovie(Movie movie);
    String deleteMovie(int id);
    void addMemberFavourite(int movieId, int memberId);

    List<GenreModel> getListGenre();
    List<LanguageModel> getListLanguage();

    List<Movie> getListFavourite(int id);
}
