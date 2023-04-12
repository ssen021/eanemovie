package com.induk.cinema.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.constraints.NotEmpty;
import java.sql.Date;

@Data
public class EventForm {

    @NotEmpty(message = "제목을 입력해주세요.")
    private String title;
    private MultipartFile imageFile;
    private String content;
    private Date start_date;
    private Date end_date;
    private Date reporting_date;
    private int view_count;
    private MultipartFile thum_imageFile;
}
