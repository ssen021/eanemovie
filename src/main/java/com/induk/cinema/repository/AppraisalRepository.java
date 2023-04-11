package com.induk.cinema.repository;

import com.induk.cinema.domain.Appraisal;
import com.induk.cinema.dto.AppraisalForm;
import com.induk.cinema.dto.AppraisalUpdateForm;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AppraisalRepository {

    List<Appraisal> findAll();
    List<AppraisalForm> findByMovieId(Long id);
    Appraisal findById(Long id);
    Long save(Appraisal appraisal);
    void update(AppraisalUpdateForm appraisal);
    void delete(Long id);
    void likeInc(Map<String, Object> map);
    void hateInc(Map<String, Object> map);
}
