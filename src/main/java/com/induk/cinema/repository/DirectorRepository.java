package com.induk.cinema.repository;

import com.induk.cinema.domain.Director;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DirectorRepository {

    List<Director> findAll();
    Director findById(Long id);
    void save(Director director);
    void update(Director director);
    void delete(Long id);
}
