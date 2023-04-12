package com.induk.cinema.service;

import com.induk.cinema.domain.MovieActor;
import com.induk.cinema.dto.MovieActorForm;
import com.induk.cinema.repository.MovieActorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MovieActorService {

    private final MovieActorRepository movieActorRepository;

    public List<MovieActor> movieActorList(Long movieId) {
        return movieActorRepository.findByMovieId(movieId);
    }

    public MovieActor findMovieActor(Long id) {
        return movieActorRepository.findById(id);
    }

    public Long saveMovieActor(MovieActorForm movieActorForm) {
        movieActorRepository.save(movieActorForm);
        return movieActorForm.getId();
    }

    public void updateMovieActor(MovieActorForm movieActorForm) {
        movieActorRepository.update(movieActorForm);
    }

    public void deleteMovieActor(Long id) {
        movieActorRepository.delete(id);
    }
}
