package triperDteam.vietflix.Program.DAL;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import triperDteam.vietflix.Program.Model.MovieGenreModel;
import triperDteam.vietflix.Program.Model.MovieLanguageModel;


import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
@Repository
public  class Movie_DAL implements MovieRepository{
    private JdbcTemplate jdbcTemplate;
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Movie> getListMovie() {
        String sql = "SELECT * FROM public.movie ORDER BY movie_id ASC";
        RowMapper<Movie> mapper = new RowMapper<Movie>() {
            @Override
            public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
                Movie movie = new Movie();
                movie.setId(rs.getInt(1));
                movie.setName(rs.getString(2));
                movie.setActor(rs.getString(7));
                movie.setDirector(rs.getString(11));
                movie.setDescription(rs.getString(5));
                movie.setImdbID(rs.getString(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                return movie;
            }
        };
        List<Movie> movies = this.jdbcTemplate.query(sql, mapper);
        return movies;
    }
    @Override
    public List<MovieGenreModel> getListMovieGenreModel()
    {
        String sql = "select movie_id, mov_genre.genre_id, genre_name from mov_genre, genre\n" +
                "where mov_genre.genre_id = genre.genre_id;";
        RowMapper<MovieGenreModel> genreMapper = new RowMapper<MovieGenreModel>() {
            @Override
            public MovieGenreModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                MovieGenreModel movieGenreModel = new MovieGenreModel();
                movieGenreModel.setMovie_id(rs.getInt(1));
                movieGenreModel.setGenre_id(rs.getInt(2));
                movieGenreModel.setGenre_name(rs.getString(3));
                return movieGenreModel;
            }
        };
        List<MovieGenreModel> movieGenreModels = this.jdbcTemplate.query(sql, genreMapper);
        return movieGenreModels;
    }
    @Override
    public List<MovieLanguageModel> getListMovieLanguageModel()
    {
        String sql = "select movie_id, mov_language.language_id, language_name from mov_language, \"Language\"\n" +
                "where mov_language.language_id = \"Language\".language_id;";
        RowMapper<MovieLanguageModel> languageMapper = new RowMapper<MovieLanguageModel>() {
            @Override
            public MovieLanguageModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                MovieLanguageModel movieLanguageModel = new MovieLanguageModel();
                movieLanguageModel.setMovie_id(rs.getInt(1));
                movieLanguageModel.setLang_id(rs.getInt(2));
                movieLanguageModel.setLanguage(rs.getString(3));
                return movieLanguageModel;
            }
        };
        List<MovieLanguageModel> movieLanguageModels = this.jdbcTemplate.query(sql, languageMapper);
        return movieLanguageModels;
    }

    @Override
    public Movie getMovieById(int id)
    {
        String sql = "select * from Movie where movie_id = " + id;
        RowMapper<Movie> mapper = new RowMapper<Movie>() {
            @Override
            public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
                Movie movie = new Movie();
                movie.setId(rs.getInt(1));
                movie.setName(rs.getString(2));
                movie.setActor(rs.getString(7));
                movie.setDirector(rs.getString(11));
                movie.setDescription(rs.getString(5));
                movie.setImdbID(rs.getString(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                return movie;
            }
        };
        Movie movie = this.jdbcTemplate.query(sql, mapper).get(0);
        return movie;
    }
    @Override
    public List<Movie> getMemberHistory(int id)
    {
        String sql = "select movie.* from movie, history where movie.movie_id = history.movie_id and history.member_id = " + id;
        RowMapper<Movie> mapper = new RowMapper<Movie>() {
            @Override
            public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
                Movie movie = new Movie();
                movie.setId(rs.getInt(1));
                movie.setName(rs.getString(2));
                movie.setActor(rs.getString(7));
                movie.setDirector(rs.getString(11));
                movie.setDescription(rs.getString(5));
                movie.setImdbID(rs.getString(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                return movie;
            }
        };
        List<Movie> movies = this.jdbcTemplate.query(sql, mapper);
        return movies;
    }

    @Override
    public String updateGenre(int movie_id, int genre_id) {
        return null;
    }
}


