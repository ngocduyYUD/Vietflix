package triperDteam.vietflix.Program.Model;

import triperDteam.vietflix.Program.Entity.Movie.Movie;

import java.util.List;

public class MovieModel {
    public String name;
    public int length;
    public String language;
    public String source;
    public String description;
    public String director;
    public String thumbnail;
    public String background;
    public String actor;
    public List<String> genre;
    public int year;
    public String imdbID;
    public MovieModel(Movie movie)
    {
        this.name = movie.getName();
        this.length = movie.getLength();
        this.language = movie.getLanguage();
        this.source = movie.getSource();
        this.description = movie.getDescription();
        this.director = movie.getDirector();
        this.thumbnail = movie.getThumbnail();
        this.background = movie.getBackground();
        this.actor = movie.getActor();
        this.genre = movie.getGenre();
        this.year = movie.getYear();
        this.imdbID = movie.getImdbID();
    }
}
