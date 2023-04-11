package com.induk.cinema.domain;


import com.induk.cinema.util.CurrentPage;
import com.induk.cinema.util.PaginationInfo;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Review extends CurrentPage {
    private Long id;

    @NotNull(message = "작성자는 필수 선택입니다.")
    private Long memberId;

    @NotNull(message = "영화는 필수 선택입니다.")
    private Long movieId;

    @NotBlank(message = "제목은 필수 입력입니다.")
    @Length(max=30)
    private String title;

    @NotBlank(message = "내용은 필수 입력입니다.")
    @Length(max=1024)
    private String content;

    private MultipartFile imageForm;
    private String image;
    private Integer view;
    private String reportingDate;
    private Member member;
    private Movie movie;
    private Integer commentCount;
    private List<Comment> commentList;
    private String searchText;
    private Integer searchMovieId;
    private PaginationInfo paginationInfo;
    private String sortType;

    @Override
    public String makeQueryString(int pageNo) {

        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("searchText", searchText)
                .queryParam("searchMovieId", searchMovieId)
                .queryParam("currentPageNo", pageNo)
                .queryParam("sortType", sortType)
                .build()
                .encode();

        return uriComponents.toUriString();
    }

}
