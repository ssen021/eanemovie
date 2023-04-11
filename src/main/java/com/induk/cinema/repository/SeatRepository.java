package com.induk.cinema.repository;

import com.induk.cinema.domain.Seat;
import com.induk.cinema.domain.Theater;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SeatRepository {

    List<Seat> findAll();
    Seat findById(Long id);
    Long save(Seat seat);
    void update(Seat seat);
    void delete(Long id);

    List<Theater> findTheaterById(Long id);
    List<Seat> findSeatByTheaterId(Long id);
    List<Theater> findTheater();

    List<Seat> findBySchedule(Long id);
}
