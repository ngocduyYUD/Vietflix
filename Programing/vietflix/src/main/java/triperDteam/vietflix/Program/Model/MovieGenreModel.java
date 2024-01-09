package triperDteam.vietflix.Program.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MovieGenreModel {
    private int movie_id;
    private int genre_id;
    private String genre_name;
}
