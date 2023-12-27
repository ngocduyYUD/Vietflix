package triperDteam.vietflix.Program.DAL;

import triperDteam.vietflix.Program.Entity.Movie.Movie;

import java.util.List;

public interface MovieRepository {
    List<Movie> getListMovie();
}
