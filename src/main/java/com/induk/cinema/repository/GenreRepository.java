package com.induk.cinema.repository;

import com.induk.cinema.domain.Genre;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GenreRepository {

    List<Genre> findAll();
    Genre findById(Long id);
    void save(Genre genre);
    void update(Genre genre);
    void delete(Long id);
}
