package com.induk.cinema.service;

import com.induk.cinema.domain.*;
import com.induk.cinema.dto.CinemaCity;
import com.induk.cinema.repository.CinemaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CinemaService {

    private final CinemaRepository cinemaRepository;

    public List<Cinema> cinemaList() {
        return cinemaRepository.findAll();
    }

    public List<Cinema> findCinemaByText(String searchText) {
        return cinemaRepository.findCinemaByText(searchText);
    }

    public Cinema findCinema(Long id) {
        return cinemaRepository.findById(id);
    }

    public List<Schedule> findByTheater(Long id, String date) {
        return cinemaRepository.findByTheater(id, date);
    }

    public List<Schedule> findMovie(Long id, String date) {
        return cinemaRepository.findMovie(id, date);
    }

    public List<Schedule> findSceduleByCinema(Long id) {
        return cinemaRepository.findSceduleByCinema(id);
    }

    public List<Cinema> findCinemaListByCityId(Long id) {
        return cinemaRepository.findCinemaListByCityId(id);
    }

    public Long saveCinema(Cinema cinema) {
        cinemaRepository.save(cinema);
        return cinema.getId();
    }

    public void updateCinema(Cinema cinema) {
        cinemaRepository.update(cinema);
    }

    public void deleteCinema(Long id) {
        cinemaRepository.delete(id);
    }

    public String findByCityId(Long id) {
        return cinemaRepository.findByCityId(id);
    }

    public List<City> findCity() {
        return cinemaRepository.findCity();
    }

    public List<Schedule> findScheduleForAjax(String date, Long cinemaId) {
        return cinemaRepository.findScheduleForAjax(date, cinemaId);
    }

    public List<Schedule> findByTheaterToSchedule(String title, Long id, String date) {
        return cinemaRepository.findByTheaterToSchedule(title, id, date);
    }

    public List<Schedule> findMovieToSchedule(String title, Long id, String date) {
        return cinemaRepository.findMovieToSchedule(title, id, date);
    }
}
