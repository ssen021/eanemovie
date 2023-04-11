package com.induk.cinema.repository;

import com.induk.cinema.domain.City;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CityRepository {

    List<City> findAll();
    City findById(Long id);
    Long save(City city);
    void update(City city);
    void delete(Long id);
}
