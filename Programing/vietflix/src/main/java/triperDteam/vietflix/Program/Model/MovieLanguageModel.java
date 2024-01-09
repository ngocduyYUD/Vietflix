package triperDteam.vietflix.Program.Model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieLanguageModel {
    private int movie_id;
    private int lang_id;
    private String language;
}
