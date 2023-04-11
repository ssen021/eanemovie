package com.induk.cinema.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Director {
    private Long id;

    @NotEmpty(message = "이름을 입력해주세요.")
    private String name;
    private String storeFilename;
    private String uploadFilename;
    private String path;
}
