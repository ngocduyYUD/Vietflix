package triperDteam.vietflix.Program.DAL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Member.Member;
import triperDteam.vietflix.Program.Entity.Package.Package;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

@Repository
public class Member_DAL implements MemberRepository{

    private JdbcTemplate jdbcTemplate;
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public Member getMemberInfoById(int id)
    {
        System.out.println(id);
        String sql = "select * from \"Member\" where member_id = " + id;
        RowMapper<Member> mapper = new RowMapper<Member>() {
            @Override
            public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
                Member member = new Member();
                member.setMember_id(rs.getInt(1));
                member.setMember_name(rs.getString(4));
                member.setMail(rs.getString(2));
                member.setPass(rs.getString(3));
                member.setPackage_id(rs.getInt(5));
                member.setExp_package(rs.getString(6));
                return member;
            }
        };
        Member member = this.jdbcTemplate.query(sql, mapper).get(0);
        return member;
    }
    @Override
    public void updatePackageMember(int memberId, int packageId)
    {
        String sqlGetPackageInfo = "SELECT * FROM public.\"package\"\n" +
                "ORDER BY package_id ASC ";

        RowMapper<Package> mapperPackage = new RowMapper<Package>() {
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
        List<Package> packages = this.jdbcTemplate.query(sqlGetPackageInfo, mapperPackage);

        String sqlUpdatePackage = "update \"Member\" set package_id = ?, exp_package = ? where member_id = ?";
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        for (Package pack: packages)
        {
            if(packageId == pack.getPack_id())
            {
                currentTime.plusMonths(pack.getPack_time());
                break;
            }
        }
        String expPackage = currentTime.format(formatter);
        this.jdbcTemplate.update(sqlUpdatePackage, packageId, expPackage, memberId);
    }
    @Override
    public void updateHistory(int movieId, int memberId)
    {
        String sql = "insert into history(movie_id, member_id)\n" +
                "select ?,?\n" +
                "where not exists(select * from history where movie_id = ? and member_id = ?)";
        this.jdbcTemplate.update(sql, movieId, memberId, movieId, memberId);
    }
}
