package triperDteam.vietflix.Program.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import triperDteam.vietflix.Program.Service.MovieService;

@RestController
@RequestMapping("admin")
public class AdminMovieController {

    @Autowired
    MovieService movieService;
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
    @PostMapping("/add")
    public ResponseEntity<String> addNewMovie(@RequestBody Movie movie)
    {
        try{
            String result = movieService.setAddMovie(movie);
            if(!result.equals("Successful"))
            {
                return new ResponseEntity<>(result, HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(result, HttpStatus.CREATED);
        }
        catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateMovie(@RequestBody Movie movie)
    {
        try{
            String result = movieService.setUpdateMovie(movie);
            if(!result.equals("Successful"))
            {
                return new ResponseEntity<>(result, HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(result, HttpStatus.CREATED);
        }
        catch (Exception e)
        {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/delete/{id}")
    public ResponseEntity<String> deleteMovie(@PathVariable int id)
    {
        try {
            String result = movieService.deleteMovieById(id);
            if(!result.equals("Successful"))
            {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(result, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
