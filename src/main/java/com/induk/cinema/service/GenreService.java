package com.induk.cinema.service;

import com.induk.cinema.domain.Genre;
import com.induk.cinema.repository.GenreRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class GenreService {

    private final GenreRepository genreRepository;

    public List<Genre> genreList() {
        return genreRepository.findAll();
    }

    public Genre findGenre(Long id) {
        return genreRepository.findById(id);
    }

    public Long saveGenre(Genre genre) {
        genreRepository.save(genre);
        return genre.getId();
    }

    public void updateGenre(Genre genre) {
        genreRepository.update(genre);
    }

    public void deleteGenre(Long id) {
        genreRepository.delete(id);
    }
}
