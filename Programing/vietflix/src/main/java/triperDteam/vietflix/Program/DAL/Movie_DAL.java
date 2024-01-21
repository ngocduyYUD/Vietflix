package triperDteam.vietflix.Program.DAL;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import triperDteam.vietflix.Program.Entity.Movie.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import triperDteam.vietflix.Program.Model.*;


import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
                movie.setImdbID(rs.getFloat(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                movie.setTrailer(rs.getString(10));
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
                movie.setImdbID(rs.getFloat(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                movie.setTrailer(rs.getString(10));
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
                movie.setImdbID(rs.getFloat(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                movie.setTrailer(rs.getString(10));
                return movie;
            }
        };
        List<Movie> movies = this.jdbcTemplate.query(sql, mapper);
        return movies;
    }

    @Override
    public String saveNewMovie(MovieModel movieModel) {
        String sql = "INSERT INTO movie(movie_name, movie_actor, movie_director, movie_des, movie_point, movie_length, movie_thumb, movie_source, movie_year, trailer_source)\n" +
                "VALUES (?, ?, ?, ? ,? ,? ,? ,? ,?, ?);";
        Timestamp movie_length = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
            Date parsedDate = dateFormat.parse(movieModel.getLength());
            movie_length = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
        }
        this.jdbcTemplate.update(sql, movieModel.getName(),
                movieModel.getActor(),
                movieModel.getDirector(),
                movieModel.getDescription(),
                movieModel.getImdbID(),
                movie_length,
                movieModel.getThumbnail(),
                movieModel.getSource(),
                movieModel.getYear(),
                movieModel.getTrailer()
        );
        String getLastMovie = "SELECT * FROM movie WHERE movie_id=(SELECT max(movie_id) FROM movie);\n";
        RowMapper<Movie> mapper = new RowMapper<Movie>() {
            @Override
            public Movie mapRow(ResultSet rs, int rowNum) throws SQLException {
                Movie movie = new Movie();
                movie.setId(rs.getInt(1));
                movie.setName(rs.getString(2));
                movie.setActor(rs.getString(7));
                movie.setDirector(rs.getString(11));
                movie.setDescription(rs.getString(5));
                movie.setImdbID(rs.getFloat(9));
                movie.setLength(rs.getString(3));
                movie.setThumbnail(rs.getString(6));
                movie.setSource(rs.getString(4));
                movie.setYear(rs.getInt(8));
                movie.setTrailer(rs.getString(10));
                return movie;
            }
        };
        String getGenre = "select * from genre";
        RowMapper<GenreModel> genreMapper = new RowMapper<GenreModel>() {
            @Override
            public GenreModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                GenreModel genre = new GenreModel();
                genre.setGenre_id(rs.getInt(1));
                genre.setGenre_name(rs.getString(2));
                return genre;
            }
        };
        String getLanguage = "select * from \"Language\"";
        RowMapper<LanguageModel> langMapper = new RowMapper<LanguageModel>() {
            @Override
            public LanguageModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                LanguageModel language = new LanguageModel();
                language.setLanguage_id(rs.getInt(1));
                language.setLanguage(rs.getString(2));
                return language;
            }
        };
        List<LanguageModel> languages = this.jdbcTemplate.query(getLanguage, langMapper);
        List<GenreModel> genres = this.jdbcTemplate.query(getGenre, genreMapper);
        Movie movie = this.jdbcTemplate.query(getLastMovie, mapper).get(0);
        movie.setGenres(movieModel.getGenres());
        movie.setLanguages(movieModel.getLanguages());
        String sqlGenreUpdate = "insert into mov_genre(movie_id, genre_id) values(?,?);";
        String sqlLanguageUpdate = "insert into mov_language(movie_id, language_id) values(?,?);";
        for (GenreModel genre : genres) {
            if (movie.getGenres().contains(genre.getGenre_name())) {
                this.jdbcTemplate.update(sqlGenreUpdate, movie.getId(), genre.getGenre_id());
            }
        }
        for (LanguageModel language : languages) {
            if (movie.getLanguages().contains(language.getLanguage())) {
                this.jdbcTemplate.update(sqlLanguageUpdate, movie.getId(), language.getLanguage_id());
            }
        }
        return "Successful";
    }
    @Override
    public String saveUpdateMovie(Movie movie)
    {
        String sql = "update movie set movie_name = ?, movie_length = ?, \n" +
                    "movie_source = ?, movie_des = ?, movie_thumb = ?, movie_actor = ?, movie_year = ?, movie_point = ?,\n" +
                "trailer_source = ?, movie_director = ? where movie_id = ?";
        Timestamp movie_length = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
            Date parsedDate = dateFormat.parse(movie.getLength());
            movie_length = new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
        }
        this.jdbcTemplate.update(sql, movie.getName(),
                movie_length,
                movie.getSource(),
                movie.getDescription(),
                movie.getThumbnail(),
                movie.getActor(),
                movie.getYear(),
                movie.getImdbID(),
                movie.getTrailer(),
                movie.getDirector(),
                movie.getId()
        );
        String getGenre = "select * from genre";
        RowMapper<GenreModel> genreMapper = new RowMapper<GenreModel>() {
            @Override
            public GenreModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                GenreModel genre = new GenreModel();
                genre.setGenre_id(rs.getInt(1));
                genre.setGenre_name(rs.getString(2));
                return genre;
            }
        };
        String getLanguage = "select * from \"Language\"";
        RowMapper<LanguageModel> langMapper = new RowMapper<LanguageModel>() {
            @Override
            public LanguageModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                LanguageModel language = new LanguageModel();
                language.setLanguage_id(rs.getInt(1));
                language.setLanguage(rs.getString(2));
                return language;
            }
        };
        List<LanguageModel> languages = this.jdbcTemplate.query(getLanguage, langMapper);
        List<GenreModel> genres = this.jdbcTemplate.query(getGenre,genreMapper);
        String languageUpdate = "insert into mov_language(movie_id, language_id)\n" +
                "select ?,?\n" +
                "where not exists(select * from mov_language where movie_id = ? and language_id = ?)";
        String genreUpdate = "insert into mov_genre(movie_id, genre_id)\n" +
                "select ?,?\n" +
                "where not exists(select * from mov_genre where movie_id = ? and genre_id = ?)";
        String deleteGenre = "delete from mov_genre where movie_id =?";
        String deleteLanguage = "delete from mov_language where movie_id =?";
        this.jdbcTemplate.update(deleteGenre, movie.getId());
        this.jdbcTemplate.update(deleteLanguage, movie.getId());
        for(LanguageModel language: languages)
        {
            if(movie.getLanguages().contains(language.getLanguage()))
            {
                this.jdbcTemplate.update(languageUpdate, movie.getId(), language.getLanguage_id(), movie.getId(), language.getLanguage_id());
            }
        }
        for(GenreModel genre: genres)
        {
            if(movie.getGenres().contains(genre.getGenre_name()))
            {
                this.jdbcTemplate.update(genreUpdate, movie.getId(), genre.getGenre_id(), movie.getId(), genre.getGenre_id());
            }
        }
        return "update successful";
    }

    @Override
    public String deleteMovie(int id)
    {
        String sql = "delete from movie where movie_id = ?";
        String deleteGenre = "delete from mov_genre where movie_id =?";
        String deleteLanguage = "delete from mov_language where movie_id =?";
        String deleteFavourite = "delete from favourite where movie_id = ?";
        String deleteHistory = "delete from history where movie_id = ?";
        this.jdbcTemplate.update(deleteGenre, id);
        this.jdbcTemplate.update(deleteLanguage, id);
        this.jdbcTemplate.update(deleteFavourite, id);
        this.jdbcTemplate.update(deleteHistory, id);
        this.jdbcTemplate.update(sql, id);
        return "delete successful";
    }

    @Override
    public void addMemberFavourite(int movieId, int memberId)
    {
        String favouriteUpdate = "insert into favourite(movie_id, member_id)\n" +
                "select ?,?\n" +
                "where not exists(select * from favourite where movie_id = ? and member_id = ?)";
        this.jdbcTemplate.update(favouriteUpdate, movieId, memberId, movieId, memberId);
    }
    @Override
    public List<LanguageModel> getListLanguage()
    {
        String getLanguage = "select * from \"Language\"";
        RowMapper<LanguageModel> langMapper = new RowMapper<LanguageModel>() {
            @Override
            public LanguageModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                LanguageModel language = new LanguageModel();
                language.setLanguage_id(rs.getInt(1));
                language.setLanguage(rs.getString(2));
                return language;
            }
        };
        List<LanguageModel> languages = this.jdbcTemplate.query(getLanguage, langMapper);
        return languages;
    }
    @Override
    public List<GenreModel> getListGenre()
    {
        String getGenre = "select * from genre";
        RowMapper<GenreModel> genreMapper = new RowMapper<GenreModel>() {
            @Override
            public GenreModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                GenreModel genre = new GenreModel();
                genre.setGenre_id(rs.getInt(1));
                genre.setGenre_name(rs.getString(2));
                return genre;
            }
        };
        List<GenreModel> genres = this.jdbcTemplate.query(getGenre, genreMapper);
        return genres;
    }

}


