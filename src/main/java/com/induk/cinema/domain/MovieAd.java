package com.induk.cinema.domain;

import com.induk.cinema.dto.UploadFile;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Getter @Setter
@NoArgsConstructor
public class MovieAd {

    private Long id;
    private String storeFilename;
    private String uploadFilename;
    private String path;
    private String kind;
    private Movie movie;

    private List<MultipartFile> imageFiles;
}
