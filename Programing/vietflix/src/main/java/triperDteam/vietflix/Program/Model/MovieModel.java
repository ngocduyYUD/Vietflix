package triperDteam.vietflix.Program.Model;

import triperDteam.vietflix.Program.Entity.Movie.Movie;

import java.util.List;

public class MovieModel {
    public int id;
    public String name;
    public String length;
    public List<String> languages;
    public String source;
    public String description;
    public String director;
    public String thumbnail;
    public String actor;
    public List<String> genres;
    public int year;
    public Float imdbID;
    public MovieModel(Movie movie)
    {
        this.id = movie.getId();
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
    }
}
