package com.induk.cinema.repository;

import com.induk.cinema.domain.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CinemaRepository {
    List<Cinema> findAll();
    List<Cinema> findCinemaByText(String searchText);
    Cinema findById(Long id);
    List<Schedule> findByTheater(Long id, String date);
    List<Schedule> findMovie(Long id, String date);
    List<Schedule> findSceduleByCinema(Long id);
    List<Cinema> findCinemaListByCityId(Long id);
    Long save(Cinema cinema);
    void update(Cinema cinema);
    void delete(Long id);

    String findByCityId(Long id);
    List<City> findCity();

    List<Schedule> findScheduleForAjax(String date, Long cinemaId);
    List<Schedule> findByTheaterToSchedule(String title, Long id, String date);
    List<Schedule> findMovieToSchedule(String title, Long id, String date);
}
