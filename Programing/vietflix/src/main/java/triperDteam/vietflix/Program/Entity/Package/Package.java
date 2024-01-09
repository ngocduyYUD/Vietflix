package triperDteam.vietflix.Program.Entity.Package;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Package {
    private int pack_id;
    private String pack_name;
    private int price;
    private int pack_time;
}
