package com.induk.cinema.service;

import com.induk.cinema.domain.Appraisal;
import com.induk.cinema.dto.AppraisalForm;
import com.induk.cinema.dto.AppraisalUpdateForm;
import com.induk.cinema.repository.AppraisalRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class AppraisalService {

    private final AppraisalRepository appraisalRepository;

    public void appraisalSave(Appraisal appraisal) {
        appraisal.setLikeCount(0);
        appraisal.setHateCount(0);
        appraisal.setReportingDate(LocalDateTime.now());

        appraisalRepository.save(appraisal);
    }

    public List<AppraisalForm> appraisalMovieList(Long movieId) {
        return appraisalRepository.findByMovieId(movieId);
    }

    public void appraisalUpdate(AppraisalUpdateForm appraisal) {
        appraisalRepository.update(appraisal);
    }

    public Long appraisalDelete(Long id) {
        Appraisal appraisal = appraisalRepository.findById(id);
        appraisalRepository.delete(id);

        return appraisal.getMovieId();
    }

    public void likeInc(int count, Long id) {
        Map<String, Object> map = new HashMap<>();
        map.put("likeCount", count+1);
        map.put("id", id);

        appraisalRepository.likeInc(map);
    }

    public void hateInc(int count, Long id) {
        Map<String, Object> map = new HashMap<>();
        map.put("hateCount", count+1);
        map.put("id", id);

        appraisalRepository.hateInc(map);
    }
}
