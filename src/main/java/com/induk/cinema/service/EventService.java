package com.induk.cinema.service;

import com.induk.cinema.domain.Event;
import com.induk.cinema.domain.EventCode;
import com.induk.cinema.dto.EventForm;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.EventCodeRepository;
import com.induk.cinema.repository.EventRepository;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class EventService {

    private final EventRepository eventRepository;
    private final EventCodeRepository eventCodeRepository;
    private final FileStore fileStore;

    public List<Event> eventList() {
        return eventRepository.findAll();
    }

    public Event findEvent(Long id) {
        return eventRepository.findById(id);
    }

    public Long saveEvent(EventForm eventForm) throws IOException {

        UploadFile uploadFile = fileStore.storeFile(eventForm.getImageFile(), "event");
        UploadFile thum_uploadFile = fileStore.storeFile(eventForm.getThum_imageFile(), "event");

        Event event = new Event();
        event.setTitle(eventForm.getTitle());
        event.setUploadFilename(uploadFile.getUploadFilename());
        event.setStoreFilename(uploadFile.getStoreFilename());
        event.setPath(uploadFile.getPath());
        event.setContent(eventForm.getContent());
        event.setStartDate(eventForm.getStart_date());
        event.setEndDate(eventForm.getEnd_date());
        event.setReportingDate(eventForm.getReporting_date());
        event.setThumUploadFilename(thum_uploadFile.getUploadFilename());
        event.setThumStoreFilename(thum_uploadFile.getStoreFilename());
        event.setThumPath(thum_uploadFile.getPath());

        eventRepository.save(event);

        return event.getId();
    }

    public void updateEvent(Event event, MultipartFile file, MultipartFile file2) throws IOException  {

        if(!file.isEmpty()) {
            UploadFile uploadFile = fileStore.storeFile(file, "event");

            event.setStoreFilename(uploadFile.getStoreFilename());
            event.setUploadFilename(uploadFile.getUploadFilename());
            event.setPath(uploadFile.getPath());
        }
        if(!file2.isEmpty()) {
            UploadFile uploadFile = fileStore.storeFile(file2, "event");

            event.setThumStoreFilename(uploadFile.getStoreFilename());
            event.setThumUploadFilename(uploadFile.getUploadFilename());
            event.setThumPath(uploadFile.getPath());
        }

        eventRepository.update(event);
    }

    public void deleteEvent(Long id) {
        eventRepository.delete(id);
    }

    public List<Event> reportingDateEventList() {
        return eventRepository.findAllSortReportingDate();
    }

    public List<Event> searchEvent(String searchWord, int status, int sort, int code_status){

        HashMap<String, Object> map = new HashMap<>(); // key, value

        map.put("searchWord", searchWord);
        map.put("status", status);
        map.put("sort", sort);
        map.put("code_status", code_status);

        return eventRepository.findByTitleSort(map);
    }

    public void plusViewCount(Long id){
        eventRepository.updateViewCount(id);
    }

    public List<Event> pagination(int nowPage, List<Event> eventList){

        int recordNumPerPage = 6; // 한 페이지에 보일 레코드 개수
        List<Event> list = new ArrayList<>();

        for(int i = 0; i < eventList.size(); i++){
            if (i >= (nowPage - 1) * recordNumPerPage && i < nowPage * recordNumPerPage){
                list.add(eventList.get(i));
            }
        }
        return list;
    }

    public List<EventCode> findEventCodeByEventId(Long id){
        return eventCodeRepository.findEventCodeByEventId(id);
    }

    public void updateMemberIdOfEventCode(Long eventCodeId, Long memberId){
        eventCodeRepository.updateMemberIdOfEventCode(eventCodeId, memberId);
    }
}
