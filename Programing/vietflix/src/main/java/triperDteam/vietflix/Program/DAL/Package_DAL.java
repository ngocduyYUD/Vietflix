package triperDteam.vietflix.Program.DAL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Package.Package;

import javax.swing.tree.TreePath;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Repository
public class Package_DAL implements PackageRepository {
    private JdbcTemplate jdbcTemplate;
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    public List<Package> getListPackage()
    {
        String sql = "SELECT * FROM public.\"package\"\n" +
                "ORDER BY package_id ASC ";

        RowMapper<Package> mapper = new RowMapper<Package>() {
            @Override
            public Package mapRow(ResultSet rs, int rowNum) throws SQLException {
                Package pack = new Package();
                pack.setPack_id(rs.getInt(1));
                pack.setPack_name(rs.getString(2));
                pack.setPrice(rs.getInt(3));
                pack.setPack_time(rs.getInt(4));
                return pack;
            }
        };
        List<Package> packages = this.jdbcTemplate.query(sql, mapper);
        return packages;
    }

}
