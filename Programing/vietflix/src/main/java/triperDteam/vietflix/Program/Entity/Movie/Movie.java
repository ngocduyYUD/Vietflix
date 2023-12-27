package triperDteam.vietflix.Program.Entity.Movie;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Movie {
    private int id;
    private String name;
    private int length;
    private String language;
    private String source;
    private String description;
    private String director;
    private String thumbnail;
    private String background;
    private String actor;
    private List<String> genre;
    private int year;
    private String imdbID;
}
