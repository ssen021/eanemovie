package com.induk.cinema.repository;

import com.induk.cinema.domain.MovieActor;
import com.induk.cinema.dto.MovieActorForm;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieActorRepository {
    List<MovieActor> findByMovieId(Long id);
    MovieActor findById(Long id);
    Long save(MovieActorForm movieActorForm);
    void delete(Long id);
    void update(MovieActorForm movieActorForm);
}
