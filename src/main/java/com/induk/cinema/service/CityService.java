package com.induk.cinema.service;

import com.induk.cinema.domain.City;
import com.induk.cinema.repository.CityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CityService {

    private final CityRepository cityRepository;

    public List<City> cityList() {
        return cityRepository.findAll();
    }

    public City findCity(Long id) {
        return cityRepository.findById(id);
    }

    public Long saveCity(City city) {
        cityRepository.save(city);
        return city.getId();
    }

    public void updateCity(City city) {
        cityRepository.update(city);
    }

    public void deleteCity(Long id) {
        cityRepository.delete(id);
    }
}
