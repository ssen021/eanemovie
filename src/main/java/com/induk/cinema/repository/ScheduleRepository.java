package com.induk.cinema.repository;

import com.induk.cinema.domain.City;
import com.induk.cinema.domain.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleRepository {

    List<Schedule> findAll();
    Schedule findById(Long id);
    Long save(Schedule schedule);
    void update(Schedule schedule);
    void delete(Long id);

    List<Schedule> findScheduleForAjax(String movieTitle, String date, Long cinemaId);
    List<Schedule> findScheduleToMovieTitle(String movieTitle);
}
