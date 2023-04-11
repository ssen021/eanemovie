package com.induk.cinema.repository;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.domain.Theater;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TheaterRepository {

    List<Theater> findAll();
    Theater findById(Long id);
    Long save(Theater theater);
    void update(Theater theater);
    void delete(Long id);

    String findByCinemaId(Long id);
    List<Cinema> findCinema();
}
