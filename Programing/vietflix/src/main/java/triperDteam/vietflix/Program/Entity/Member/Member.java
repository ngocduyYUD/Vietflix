package triperDteam.vietflix.Program.Entity.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private int member_id;
    private String mail;
    private String pass;
    private String member_name;
    private int package_id;
    private String exp_package;
}
