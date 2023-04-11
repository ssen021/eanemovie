package com.induk.cinema.service;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.Review;
import com.induk.cinema.repository.CommentRepository;
import com.induk.cinema.util.PaginationInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentRepository commentRepository;

    public List<Comment> commentList() {
        return commentRepository.findAll();
    }
    public List<Comment> findCommentByReviewId(Long id){
        return commentRepository.findByReviewId(id);
    }
    public List<Comment> findCommentByReviewIdPaging(Comment params) throws ParseException {
        List<Comment> commentList = Collections.emptyList();

        int commentTotalCount = commentRepository.findByReviewIdPagingCount(params);

        params.setRecordsPerPage(5); //한페이지당 데이터 갯수
        params.setPageSize(2); //페이지의 갯수
        PaginationInfo paginationInfo = new PaginationInfo(params);
        paginationInfo.setTotalRecordCount(commentTotalCount);

        params.setPaginationInfo(paginationInfo);
        if (commentTotalCount > 0) {
            commentList = commentRepository.findByReviewIdPaging(params);

            for(Comment comment : commentList){
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String nowString = format.format(new Date());
                Date now = format.parse(nowString);
                Date date = format.parse(comment.getReportingDate().substring(0,10));
                //일수 구하기
                long calDate = now.getTime() - date.getTime();
                long calDateDays = calDate / (1000*60*60*24);
                calDateDays = Math.abs(calDateDays);
                String calDateDaysString = (calDateDays == 0)? "today" : calDateDays + " days ago";
                comment.setCalDateDays(calDateDaysString);   //setCalDateDays 초기화

                String contentRepl = comment.getContent().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;");
                comment.setContentRepl(contentRepl);  //contentRepl 초기화화
            }
        }
       return commentList;
    }
    public Integer getCommentCountByReviewId(Comment comment){
        return commentRepository.findByReviewIdPagingCount(comment);
    }
    public Comment findComment(Long id) {
        return commentRepository.findById(id);
    }

    public Long saveComment(Comment comment) {
        commentRepository.save(comment);
        return comment.getId();
    }

    public Integer updateComment(Comment comment) {
        return commentRepository.update(comment);
    }

    public Integer deleteComment(Long id) {
        return commentRepository.delete(id);
    }

}
