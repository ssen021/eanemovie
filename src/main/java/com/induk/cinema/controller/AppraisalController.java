package com.induk.cinema.controller;

import com.induk.cinema.domain.Appraisal;
import com.induk.cinema.dto.AppraisalForm;
import com.induk.cinema.dto.AppraisalUpdateForm;
import com.induk.cinema.service.AppraisalService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.MalformedURLException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/csmovie/appraisals")
@RequiredArgsConstructor
public class AppraisalController {

    private final FileStore fileStore;
    private final AppraisalService appraisalService;

    @PostMapping
    public List<AppraisalForm> appraisalForms(@RequestParam(value = "movieId") Long moiveId) {
        log.info("movie_id : {}", moiveId);
        return appraisalService.appraisalMovieList(moiveId);
    }

    @PostMapping("/add")
    public Long appraisalAdd(@Valid Appraisal appraisal) {
        appraisalService.appraisalSave(appraisal);
        return appraisal.getMovieId();
    }

    @PostMapping("/update")
    public Long appraisalUpdate(@Valid AppraisalUpdateForm appraisal) {
        appraisalService.appraisalUpdate(appraisal);
        return appraisal.getMovieId();
    }

    @PostMapping("/delete")
    public Long appraisalDelete(@RequestParam(value = "id") Long id) {
        Long movieId = appraisalService.appraisalDelete(id);
        return movieId;
    }

    @PostMapping("/like")
    public void like(@RequestParam(value = "count") int count, @RequestParam(value = "id") Long id) {
        appraisalService.likeInc(count, id);
    }

    @PostMapping("/hate")
    public void hate(@RequestParam(value = "count") int count, @RequestParam(value = "id") Long id) {
        appraisalService.hateInc(count, id);
    }

    @GetMapping("/images/{filename}")
    public Resource movieImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("member", filename));
    }

}
