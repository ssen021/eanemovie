package com.induk.cinema.domain;


import com.induk.cinema.util.CurrentPage;
import com.induk.cinema.util.PaginationInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Comment extends CurrentPage {
    private Long id;

    @NotNull(message = "게시글은 필수 선택입니다.")
    private Long reviewId;
    private Review review;

    @NotNull(message = "작성자는 필수 선택입니다.")
    private Long memberId;
    private Member member;

    @NotBlank(message = "내용은 필수 입력입니다.")
    @Length(max=1024)
    private String content;
    private String contentRepl;
    private String reportingDate;
    private String calDateDays;
    private PaginationInfo paginationInfo;
    private Integer countByReviewId;
}
