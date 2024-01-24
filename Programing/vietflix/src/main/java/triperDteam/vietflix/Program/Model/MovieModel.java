package triperDteam.vietflix.Program.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import triperDteam.vietflix.Program.Entity.Movie.Movie;

import java.util.ArrayList;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieModel {
    private String name;
    private String length;
    private List<String> languages = new ArrayList<>();
    private String source;
    private String description;
    private String director;
    private String thumbnail;
    private String actor;
    private List<String> genres = new ArrayList<>();
    private int year;
    private float imdbID;
    private String trailer;
    public MovieModel(Movie movie)
    {
        this.name = movie.getName();
        this.length = movie.getLength();
        this.languages = movie.getLanguages();
        this.source = movie.getSource();
        this.description = movie.getDescription();
        this.director = movie.getDirector();
        this.thumbnail = movie.getThumbnail();
        this.actor = movie.getActor();
        this.genres = movie.getGenres();
        this.year = movie.getYear();
        this.imdbID = movie.getImdbID();
        this.trailer = movie.getTrailer();
    }
}
