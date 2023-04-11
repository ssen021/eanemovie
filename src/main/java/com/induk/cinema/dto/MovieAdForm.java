package com.induk.cinema.dto;

import com.induk.cinema.domain.Movie;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class MovieAdForm {
    private Long id;
    private String storeFilename;
    private String uploadFilename;
    private String path;
    private String kind;
    private Long movieId;

    private List<MultipartFile> imageFiles;
    private String video;

    public MovieAdForm() {
    }

    public MovieAdForm(UploadFile uploadFile, String kind, Long movieId) {
        this.storeFilename = uploadFile.getStoreFilename();
        this.uploadFilename = uploadFile.getUploadFilename();
        this.path = uploadFile.getPath();
        this.kind = kind;
        this.movieId = movieId;
    }
}
