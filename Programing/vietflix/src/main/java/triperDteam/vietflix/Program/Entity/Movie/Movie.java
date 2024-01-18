package triperDteam.vietflix.Program.Entity.Movie;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Movie {
    private int id;
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

    public void addNewGenre(String genre)
    {
        genres.add(genre);
    }
    public void addNewLanguage(String language)
    {
        languages.add(language);
    }


}
