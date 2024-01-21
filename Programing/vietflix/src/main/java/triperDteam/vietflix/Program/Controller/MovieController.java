package triperDteam.vietflix.Program.Controller;

import org.springframework.web.bind.annotation.*;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import triperDteam.vietflix.Program.Model.GenreModel;
import triperDteam.vietflix.Program.Model.LanguageModel;
import triperDteam.vietflix.Program.Model.MovieModel;
import triperDteam.vietflix.Program.Service.AccountService;
import triperDteam.vietflix.Program.Service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("api/movies")
public class MovieController {
    @Autowired
    MovieService movieService;
    @Autowired
    AccountService accountService;
    @GetMapping("/viewAllMovie")
    public ResponseEntity<List<Movie>> viewAllMovie(){
        try{
            List<Movie> movies = movieService.setListMovie();
            if(movies.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(movies, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/viewMovieInfo/{id}")
    public ResponseEntity<Movie> viewMovieInfoById(@PathVariable int id)
    {
        try {
            Movie movie = movieService.setMovieInfo(id);
            if(movie == null)
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(movie, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/viewMovieHistory/{id}")
    public ResponseEntity<List<Movie>> viewMovieHistory(@PathVariable int id)
    {
        try{
            List<Movie> movies = movieService.setMovieHistory(id);
            if(movies.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(movies, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/searchMovie/{name}")
    public ResponseEntity<List<Movie>> viewSearhMovieList(@PathVariable String name)
    {
        try{
            List<Movie> movies = movieService.machingMovieByName(name);
            if(movies.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(movies, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/filterMovie/{conditions}")   //conditions = language-genre-year-sort
    public ResponseEntity<List<Movie>> viewFilterMovieList(@PathVariable String conditions)
    {
        try{
            List<Movie> movies = movieService.setListFilterMovie(conditions);
            if(movies.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(movies, HttpStatus.OK);
        }catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/watch/{id}")
    public ResponseEntity<String> getMovieSource(@PathVariable String id)
    {
        String source = movieService.getMovieSouceById(id);
        accountService.saveMovieToHistory(id);
        return new ResponseEntity<>(source, HttpStatus.OK);
    }

    @PostMapping("/favourite/{id}")
    public ResponseEntity<String> addMovieToFavourite(@PathVariable String id)
    {
        movieService.addFavouriteMovie(id);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
    @GetMapping("/getListLanguage")
    public ResponseEntity<List<LanguageModel>> viewListLanguage()
    {
        List<LanguageModel> languageModel = movieService.setListLanguage();
        return new ResponseEntity<>(languageModel, HttpStatus.OK);
    }

    @GetMapping("/getListGenre")
    public ResponseEntity<List<GenreModel>> viewListGenre()
    {
        List<GenreModel> genreModels = movieService.setListGenre();
        return new ResponseEntity<>(genreModels, HttpStatus.OK);
    }
}
