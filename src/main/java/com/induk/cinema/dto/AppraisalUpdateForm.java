package com.induk.cinema.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

@Data
public class AppraisalUpdateForm {

    private Long id;
    private Long movieId;

    @NotEmpty(message = "제목을 입력해주세요.")
    private String titleUpdate;

    @NotEmpty(message = "내용을 입력해주세요.")
    private String contentUpdate;
    private Integer grade;
}
