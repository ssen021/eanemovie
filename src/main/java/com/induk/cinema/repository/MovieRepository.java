package com.induk.cinema.repository;

import com.induk.cinema.domain.Movie;
import com.induk.cinema.dto.MovieDetailRank;
import com.induk.cinema.dto.MovieForm;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface MovieRepository {

    List<Movie> findAll();
    List<Movie> findByOption(Map<String, Object> map);
    List<Movie> findHighRank();
    HashMap<String, Object> findByIdMovieDetail(Long id);
    MovieDetailRank findByIdMovieDetailRank(Long id);
    int countAll(Map<String, Object> map);
    Movie findById(Long id);
    void save(MovieForm movieForm);
    void update(MovieForm movieForm);
    void delete(Long id);
}
