package com.induk.cinema.service;

import com.induk.cinema.domain.Movie;
import com.induk.cinema.dto.MovieDetailRank;
import com.induk.cinema.dto.MovieForm;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.MovieRepository;
import com.induk.cinema.util.Criteria;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class MovieService {

    private final MovieRepository movieRepository;
    private final FileStore fileStore;

    // 어드민 페이지 활용
    public List<Movie> movieList() {
        return movieRepository.findAll();
    }

    // 사용자 페이지 활용
    public List<Movie> movieListOpt(List<String> genreChBox, List<String> formatChBox, int sort, Criteria criteria) {
        Map<String, Object> map = new HashMap<>();
        map.put("genres", genreChBox);
        map.put("sort", sort);
        map.put("startPage", criteria.getPageStart());
        map.put("perPageNum", criteria.getPerPageNum());

        if (formatChBox == null) {
            map.put("format", "");
        } else {
            String format = String.join(",", formatChBox);
            map.put("format", format);
        }

        return movieRepository.findByOption(map);
    }

    public List<Movie> movieListHighRank() {
        return movieRepository.findHighRank();
    }

    // 페이지 처리 활용
    public int movieCounts(List<String> genreChBox, List<String> formatChBox, int sort) {
        Map<String, Object> map = new HashMap<>();
        map.put("genres", genreChBox);
        map.put("sort", sort);

        if (formatChBox == null) {
            map.put("format", "");
        } else {
            String format = String.join(",", formatChBox);
            map.put("format", format);
        }

        return movieRepository.countAll(map);
    }

    // 어드민 페이지 활용
    public Movie findMovie(Long id) {
        return movieRepository.findById(id);
    }

    // 사용자 페이지 활용
    public HashMap<String, Object> findMovieDetail(Long id) { return movieRepository.findByIdMovieDetail(id); }

    public MovieDetailRank findMovieDetailRank(Long id) { return movieRepository.findByIdMovieDetailRank(id); }

    public Long saveMovie(MovieForm movieForm, MultipartFile multipartFile) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(multipartFile, "movie");
        if(uploadFile == null) {
            uploadFile = new UploadFile("movie_default.png", "movie_default.png", "movie");
        }

        String joinFormat = String.join(",", movieForm.getScreeningFormats());
        movieForm.setPoster(uploadFile.getStoreFilename());
        movieForm.setJoinFormat(joinFormat);
        movieRepository.save(movieForm);

        return movieForm.getId();
    }

    public void updateMovie(MovieForm movieForm, MultipartFile multipartFile) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(multipartFile, "movie");
        if (uploadFile != null) {
            movieForm.setPoster(uploadFile.getStoreFilename());
        }

        log.info("poster = {}", movieForm.getPoster());

        String joinFormat = String.join(",", movieForm.getScreeningFormats());
        movieForm.setJoinFormat(joinFormat);

        movieRepository.update(movieForm);
    }

    public void deleteMovie(Long id) {
        movieRepository.delete(id);
    }
}
