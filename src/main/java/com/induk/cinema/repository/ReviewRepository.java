package com.induk.cinema.repository;

import com.induk.cinema.domain.Review;
import com.induk.cinema.dto.ReviewByMovie;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewRepository {

    List<Review> findAll();
    List<ReviewByMovie> findAllCountByMovie();
    List<Review> findAllByKeyword(Review review);
    int findAllByKeywordCount(Review review);
    Review findById(Long id);
    Long save(Review review);
    void viewCounting(Long id);
    void update(Review review);
    void delete(Long id);
}
