package triperDteam.vietflix.Program.DAL;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.SQLException;
import java.util.List;
@Repository
public class Movie_DAL implements MovieRepository{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public List<Movie> getListMovie()
    {
        String sql = "SELECT movie_name FROM public.movie ORDER BY movie_id ASC";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Movie.class));
    }
}


