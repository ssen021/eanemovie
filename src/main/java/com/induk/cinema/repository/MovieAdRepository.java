package com.induk.cinema.repository;

import com.induk.cinema.domain.MovieAd;
import com.induk.cinema.dto.MovieAdForm;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieAdRepository {

    List<MovieAd> findByMovieId(Long id);
    MovieAd findById(Long id);
    List<MovieAd> findByImage(Long id);
    void save(List<MovieAdForm> movieAds);
    void delete(Long id);
    void update(MovieAdForm movieAdForm);
}
