package triperDteam.vietflix.Program.Service;

import triperDteam.vietflix.Program.DAL.Movie_DAL;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import triperDteam.vietflix.Program.Model.*;

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


    private List<Movie> getMachedLang(List<Movie> movies, String language)
    {
        List<Movie> returnMovies = new ArrayList<>();
        for (int i = 0; i < movies.size(); ) {
            if(movies.get(i).getLanguages().get(0).equals(language))
            {
                returnMovies.add(movies.get(i));
            }
        }
        return returnMovies;
    }
    private List<Movie> getMachedGenre(List<Movie> movies, String genre)
    {
        List<Movie> returnMovies = new ArrayList<>();
        for (int i = 0; i < movies.size(); i++) {
            if(movies.get(i).getGenres().contains(genre))
            {
                returnMovies.add(movies.get(i));
            }
        }
        return returnMovies;
    }
    private List<Movie>  getMachedYear(List<Movie> movies, int year)
    {
        List<Movie> returnMovies = new ArrayList<>();
        for (int i = 0; i < movies.size(); i++) {
            if(movies.get(i).getYear() == year)
            {
                returnMovies.add(movies.get(i));
            }
        }
        return returnMovies;
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
            movies = getMachedLang(movies, language);
        }
        if(!genre.equals("All"))
        {
            movies = getMachedGenre(movies, genre);
        }
        if(!year.equals("All"))
        {
            int intYear = Integer.parseInt(year);
            movies = getMachedYear(movies, intYear);
        }
        return movies;
    }
    public String setAddMovie(MovieModel movie)
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
    public String getMovieSouceById(String id)
    {
        String[] allId = id.split("-");
        int movieId = Integer.parseInt(allId[0]);
        Movie movie = movieDal.getMovieById(movieId);
        return movie.getSource();
    }

    public void addFavouriteMovie(String id)
    {
        String[] allId = id.split("-");
        int movieId = Integer.parseInt(allId[0]);
        int memberId = Integer.parseInt(allId[1]);
        movieDal.addMemberFavourite(movieId, memberId);
    }
    public List<LanguageModel> setListLanguage()
    {
        return movieDal.getListLanguage();
    }

    public List<GenreModel> setListGenre()
    {
        return movieDal.getListGenre();
    }

    public List<Movie> setFavouriteMovie(int id)
    {
        loadGenreLanguageData();
        List<Movie> movies = movieDal.getListFavourite(id);
        for(Movie movie: movies)
        {
            addGenreAndLanguage(movie);
        }
        return movies;
    }

}
