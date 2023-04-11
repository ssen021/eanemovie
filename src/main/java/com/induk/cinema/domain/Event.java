package com.induk.cinema.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Event {

    private Long id;
    @NotBlank(message = "제목을 입력해주세요")
    private String title;
    private String storeFilename;
    private String uploadFilename;
    private String path;
    private String content;
    private Date startDate;
    private Date endDate;
    private Date reportingDate;
    private int viewCount;
    private String thumStoreFilename;
    private String thumUploadFilename;
    private String thumPath;
}
