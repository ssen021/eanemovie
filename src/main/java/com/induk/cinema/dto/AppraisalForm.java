package com.induk.cinema.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AppraisalForm {
    private Long id;
    private Long movieId;
    private Long memberId;
    private String title;
    private String content;
    private Integer grade;
    private Integer likeCount;
    private Integer hateCount;
    private LocalDateTime reportingDate;
    private String memberName;
    private String memberImage;
}
