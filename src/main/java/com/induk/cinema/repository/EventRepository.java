package com.induk.cinema.repository;

import com.induk.cinema.domain.Event;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EventRepository {

    List<Event> findAll();
    Event findById(Long id);
    Long save(Event event);
    void update(Event event);
    void delete(Long id);

    List<Event> findByTitleSort(Map<String, Object> map);
    void updateViewCount(Long id);

    List<Event> findAllSortReportingDate();
}
