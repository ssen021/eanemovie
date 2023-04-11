package com.induk.cinema.service;

import com.induk.cinema.domain.MovieAd;
import com.induk.cinema.dto.MovieAdForm;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.MovieAdRepository;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MovieAdService {

    private final MovieAdRepository movieAdRepository;
    private final FileStore fileStore;

    public List<MovieAd> movieAdList(Long id) {
        return movieAdRepository.findByMovieId(id);
    }

    public MovieAd findMovieAd(Long id) { return movieAdRepository.findById(id); }

    public List<MovieAd> findMovieImage(Long id) { return movieAdRepository.findByImage(id); }

    public void addMovieAd(MovieAdForm movieAdForm) throws IOException {
        List<MovieAdForm> movieAdForms = new ArrayList<>();

        if(movieAdForm.getKind().equals("image")) {
            List<UploadFile> uploadFiles = fileStore.storeFiles(movieAdForm.getImageFiles(), "movie_ad");
            for (UploadFile uploadFile : uploadFiles) {
                movieAdForms.add(new MovieAdForm(uploadFile, movieAdForm.getKind(), movieAdForm.getMovieId()));
            }
        } else {
            movieAdForm.setStoreFilename(movieAdForm.getVideo());
            movieAdForm.setUploadFilename("Video_Upload");
            movieAdForm.setPath("movie_ad");
            movieAdForms.add(movieAdForm);
        }

        movieAdRepository.save(movieAdForms);
    }

    public void updateMovieAd(MovieAdForm movieAdForm) throws IOException {
        if(movieAdForm.getKind().equals("image")) {
            if(!movieAdForm.getImageFiles().get(0).isEmpty()) {
                UploadFile uploadFile = fileStore.storeFile(movieAdForm.getImageFiles().get(0), "movie_ad");
                movieAdForm.setStoreFilename(uploadFile.getStoreFilename());
                movieAdForm.setUploadFilename(uploadFile.getUploadFilename());
                movieAdForm.setPath(uploadFile.getPath());
            }
        } else {
            if(!movieAdForm.getVideo().isEmpty()) {
                movieAdForm.setStoreFilename(movieAdForm.getVideo());
            }
        }

        movieAdRepository.update(movieAdForm);
    }

    public void deleteMovieAd(Long id) {
        movieAdRepository.delete(id);
    }
}
