package triperDteam.vietflix.Program.Entity.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private int id;
    private String mail;
    private String name;
    private String password;
}
