package com.induk.cinema.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;

@Data
public class DirectorForm {

    @NotEmpty(message = "이름을 입력해주세요.")
    private String name;

    private MultipartFile imageFile;
}
