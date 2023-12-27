package triperDteam.vietflix.Program.Controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import triperDteam.vietflix.Program.Model.MovieModel;
import triperDteam.vietflix.Program.Service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/movies")
public class MovieController {
    @Autowired
    private MovieService movieService;

    @GetMapping("/viewAllMovie")
    public ResponseEntity<List<MovieModel>> viewAllMovie(){
        //try{
            List<Movie> movies = movieService.setListMovie();
            if(movies.isEmpty())
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            List<MovieModel> movieModels = null;
            for(Movie movie : movies)
            {
                movieModels.add(new MovieModel(movie));
            }
            return new ResponseEntity<>(movieModels, HttpStatus.OK);
        //}catch (Exception e){
          //  return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        //}
    }
//    @GetMapping("/hello")
//    ResponseEntity<String> hello() {
//        return new ResponseEntity<>("Hello World!", HttpStatus.OK);
//    }
}
