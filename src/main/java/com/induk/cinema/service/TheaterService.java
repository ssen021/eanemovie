package com.induk.cinema.service;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.domain.Theater;
import com.induk.cinema.repository.TheaterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TheaterService {

    private final TheaterRepository theaterRepository;

    public List<Theater> theaterList() {
        return theaterRepository.findAll();
    }

    public Theater findTheater(Long id) {
        return theaterRepository.findById(id);
    }

    public Long saveTheater(Theater theater) {
        theaterRepository.save(theater);
        return theater.getId();
    }

    public void updateTheater(Theater theater) {
        theaterRepository.update(theater);
    }

    public void deleteTheater(Long id) {
        theaterRepository.delete(id);
    }

    public String findByCinemaId(Long id) {
        return theaterRepository.findByCinemaId(id);
    }

    public List<Cinema> findCinema() {
        return theaterRepository.findCinema();
    }

}
