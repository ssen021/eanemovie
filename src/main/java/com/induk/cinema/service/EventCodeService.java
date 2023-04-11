package com.induk.cinema.service;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.Event;
import com.induk.cinema.domain.EventCode;
import com.induk.cinema.dto.EventCodeForm;
import com.induk.cinema.dto.EventForm;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.EventCodeRepository;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class EventCodeService {

    private final EventCodeRepository eventCodeRepository;

    public List<EventCode> eventCodeList() {
        return eventCodeRepository.findAll();
    }

    public List<EventCode> eventCodeListByMemberId(Long memberId) {
        return eventCodeRepository.findByMemberId(memberId);
    }

    public EventCode findEventCode(Long id) {
        return eventCodeRepository.findById(id);
    }

    public Long saveEventCode(EventCodeForm eventCodeForm) {

        EventCode eventCode = new EventCode();
        eventCode.setEventId(eventCodeForm.getEvent_id());
        eventCode.setCode(eventCodeForm.getCode());
        eventCode.setIssueDate(eventCodeForm.getIssue_date());
        eventCode.setCodeLimit(eventCodeForm.getCode_limit());
        eventCode.setDiscountRate(eventCodeForm.getDiscount_rate());

        eventCodeRepository.save(eventCode);
        return eventCode.getId();
    }

    public void updateEventCode(EventCode eventCode) { eventCodeRepository.update(eventCode); }

    public void deleteEventCode(Long id) {
        eventCodeRepository.delete(id);
    }

    public void changeStatus(EventCode eventCode) {
        eventCodeRepository.changeStatus(eventCode);
    }
}

