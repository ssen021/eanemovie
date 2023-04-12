package com.induk.cinema.service;

import com.induk.cinema.domain.City;
import com.induk.cinema.domain.Schedule;
import com.induk.cinema.repository.CityRepository;
import com.induk.cinema.repository.ScheduleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleRepository scheduleRepository;

    public List<Schedule> scheduleList() {
        return scheduleRepository.findAll();
    }

    public Schedule findSchedule(Long id) {
        return scheduleRepository.findById(id);
    }

    public Long saveSchedule(Schedule schedule) {
        scheduleRepository.save(schedule);
        return schedule.getId();
    }

    public void updateSchedule(Schedule schedule) {
        scheduleRepository.update(schedule);
    }

    public void deleteschedule(Long id) {
        scheduleRepository.delete(id);
    }

    public List<Schedule> findScheduleForAjax(String movieTitle, String date, Long cinemaId) {
        return scheduleRepository.findScheduleForAjax(movieTitle, date, cinemaId);
    }

    public List<Schedule> findScheduleToMovieTitle(String movieTitle) {
        return scheduleRepository.findScheduleToMovieTitle(movieTitle);
    }
}
