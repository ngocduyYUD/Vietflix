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

    private void loadGenreLanguageData()
    {
        movieGenreModels = movieDal.getListMovieGenreModel();
        movieLanguageModels = movieDal.getListMovieLanguageModel();
    }


    private void getMachedLang(List<Movie> movies, String language)
    {
        for (int i = 0; i < movies.size(); i++) {
            if(!movies.get(i).getLanguages().contains(language))
            {
                movies.remove(i);
            }
        }
    }
    private void getMachedGenre(List<Movie> movies, String genre)
    {
        for (int i = 0; i < movies.size(); i++) {
            if(!movies.get(i).getGenres().contains(genre))
            {
                movies.remove(i);
            }
        }
    }
    private void getMachedYear(List<Movie> movies, int year)
    {
        System.out.println(Arrays.toString(movies.toArray()));
        System.out.println(year);
        for (int i = 0; i < movies.size(); i++) {
            if(movies.get(i).getYear() != year)
            {
                movies.remove(i);
            }
        }
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

    public List<Movie> machingMovieByName(String name)
    {
        loadGenreLanguageData();
        List<Movie> allMovies = movieDal.getListMovie();
        for(Movie movie: allMovies)
        {
            addGenreAndLanguage(movie);
        }
        List<Movie> movies = new ArrayList<>();
        for(Movie movie: allMovies)
        {
            if(movie.getName().toLowerCase().contains(name.toLowerCase()))
            {
                movies.add(movie);
            }
        }
        return movies;
    }
    public List<Movie> setListFilterMovie(String conditions)
    {
        //conditions = language-genre-year-sort
        String[] filters = conditions.split("-");
        String language = filters[0];
        String genre = filters[1];
        String year = filters[2];

        loadGenreLanguageData();
        List<Movie> movies = movieDal.getListMovie();
        for(Movie movie: movies)
        {
            addGenreAndLanguage(movie);
        }
        if(!language.equals("All"))
        {
            getMachedLang(movies, language);
        }
        if(!genre.equals("All"))
        {
            getMachedGenre(movies, genre);
        }
        if(!year.equals("All"))
        {
            int intYear = Integer.parseInt(year);
            getMachedYear(movies, intYear);
        }
        return movies;
    }
    public String setAddMovie(Movie movie)
    {
        return movieDal.saveNewMovie(movie);
    }

    public String setUpdateMovie(Movie movie)
    {
        return movieDal.saveUpdateMovie(movie);
    }
    public String deleteMovieById(int id)
    {
        return movieDal.deleteMovie(id);
    }

}
