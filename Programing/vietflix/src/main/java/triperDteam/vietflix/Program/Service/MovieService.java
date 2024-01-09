package triperDteam.vietflix.Program.Service;

import triperDteam.vietflix.Program.DAL.Movie_DAL;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.Model.MovieGenreModel;
import triperDteam.vietflix.Program.Model.MovieLanguageModel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class MovieService {

    @Autowired
    Movie_DAL movieDal;
    private List<MovieGenreModel> movieGenreModels = new ArrayList<>();
    private List<MovieLanguageModel> movieLanguageModels = new ArrayList<>();

    public List<Movie> setListMovie()
    {
        loadGenreLanguageData();
        List<Movie> movies = movieDal.getListMovie();
        for(Movie movie: movies)
        {
            addGenreAndLanguage(movie);
        }
        System.out.println(Arrays.toString(movies.toArray()));
        return movies;
    }

    public Movie setMovieInfo(int id) {
        Movie movie = movieDal.getMovieById(id);
        loadGenreLanguageData();
        addGenreAndLanguage(movie);
        return movie;
    }
    private void addGenreAndLanguage(Movie movie)
    {
        for(MovieLanguageModel movieLanguageModel: movieLanguageModels)
        {
            if(movie.getId() == movieLanguageModel.getMovie_id())
            {
                movie.addNewLanguage(movieLanguageModel.getLanguage());
            }
        }
        for(MovieGenreModel movieGenreModel: movieGenreModels)
        {
            if(movie.getId() == movieGenreModel.getMovie_id())
            {
                movie.addNewGenre(movieGenreModel.getGenre_name());
            }
        }
    }
    private void loadGenreLanguageData()
    {
        movieGenreModels = movieDal.getListMovieGenreModel();
        movieLanguageModels = movieDal.getListMovieLanguageModel();
    }

    public List<Movie> setMovieHistory(int id)
    {
        loadGenreLanguageData();
        List<Movie> movies = movieDal.getMemberHistory(id);
        for(Movie movie: movies)
        {
            addGenreAndLanguage(movie);
        }
        System.out.println(Arrays.toString(movies.toArray()));
        return movies;

    }


}
