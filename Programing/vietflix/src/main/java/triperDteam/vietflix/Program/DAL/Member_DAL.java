package triperDteam.vietflix.Program.DAL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Member.Member;

import java.sql.ResultSet;
import java.sql.SQLException;
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

}
