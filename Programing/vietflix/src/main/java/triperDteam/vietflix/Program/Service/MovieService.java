package triperDteam.vietflix.Program.Service;

import triperDteam.vietflix.Program.DAL.Movie_DAL;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieService {
    Movie_DAL movieDal = new Movie_DAL();
    public List<Movie> setListMovie()
    {
        return movieDal.getListMovie();
    }
}
