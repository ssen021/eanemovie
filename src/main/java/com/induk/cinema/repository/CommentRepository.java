package com.induk.cinema.repository;

import com.induk.cinema.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentRepository {

    List<Comment> findAll();
    List<Comment> findByReviewId(Long id);
    List<Comment> findByReviewIdPaging(Comment commnet);
    Integer findByReviewIdPagingCount(Comment comment);
    Comment findById(Long id);
    Long save(Comment comment);
    Integer update(Comment comment);
    Integer delete(Long id);
}
