package com.induk.cinema.repository;

import com.induk.cinema.domain.Actor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ActorRepository {

    List<Actor> findAll();
    Actor findById(Long id);
    void save(Actor actor);
    void update(Actor actor);
    void delete(Long id);
}
