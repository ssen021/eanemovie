package com.induk.cinema.service;

import com.induk.cinema.domain.Review;
import com.induk.cinema.dto.ReviewByMovie;
import com.induk.cinema.dto.SortType;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.ReviewRepository;
import com.induk.cinema.util.CurrentPage;
import com.induk.cinema.util.FileStore;
import com.induk.cinema.util.PaginationInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final FileStore fileStore;

    public List<Review> reviewList() {
        return reviewRepository.findAll();
    }

    public List<ReviewByMovie> reviewCountByMovie() {return  reviewRepository.findAllCountByMovie();}

    public List<Review> reviewListByKeyword(Review params)  {
        //검색된 값이 초기화
        if(params.getSearchText() == null)params.setSearchText("");
        if(params.getSearchMovieId() == null)params.setSearchMovieId(0);
        if(params.getSortType() == null)params.setSortType(SortType.Recent.getCode());

        List<Review> reviewList = Collections.emptyList();

        int reviewTotalCount = reviewRepository.findAllByKeywordCount(params);

        params.setRecordsPerPage(6); //한페이지당 데이터 갯수
        params.setPageSize(2); //페이지의 갯수
        PaginationInfo paginationInfo = new PaginationInfo(params);
        paginationInfo.setTotalRecordCount(reviewTotalCount);

        params.setPaginationInfo(paginationInfo);
        if (reviewTotalCount > 0) {
            reviewList = reviewRepository.findAllByKeyword(params);

            for(Review review : reviewList){
                //출력에 맞는 데이터 초기화
                review.setReportingDate( review.getReportingDate().substring(0, 10)); //시간 제거
                if(review.getCommentCount() == null)review.setCommentCount(0);
                if(review.getMember().getImage() == null)review.getMember().setImage("user_image.png");
            }
        }

        return reviewList;
    }

    public List<Review> reviewBySortType(SortType sortType){
        //인기있는/최신 리뷰 5개를 가져오기 위한 초기화
        Review review = new Review();
        review.setSearchText("");
        review.setSortType(sortType.getCode());
        review.setSearchMovieId(0);
        review.setPaginationInfo(new PaginationInfo(new CurrentPage()));
        review.getPaginationInfo().setFirstRecordIndex(0);
        review.setRecordsPerPage(5);

        List<Review> reviewList = reviewRepository.findAllByKeyword(review);

        for(Review r : reviewList){
            //출력에 맞는 데이터 초기화
            if(r.getCommentCount() == null)r.setCommentCount(0);
            r.setReportingDate( r.getReportingDate().substring(0, 10)); //시간 제거
        }

        return reviewList;
    }

    public Review findReview(Long id) {
        return reviewRepository.findById(id);
    }

    public Long saveReview(Review review) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(review.getImageForm(), "review");
        review.setImage(uploadFile.getStoreFilename());

        reviewRepository.save(review);
        return review.getId();
    }

    public void updateReview(Review review) throws IOException {
        UploadFile uploadFile;
        if(!review.getImageForm().isEmpty()){
            uploadFile = fileStore.storeFile(review.getImageForm(), "review");
            review.setImage(uploadFile.getStoreFilename());
        }

        reviewRepository.update(review);
    }

    public void viewCounting(Long id) {reviewRepository.viewCounting(id);}

    public void deleteReview(Long id) {
        reviewRepository.delete(id);
    }

}
