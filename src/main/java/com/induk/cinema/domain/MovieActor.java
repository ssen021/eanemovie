package com.induk.cinema.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MovieActor {

    private Long id;
    private String role;
    private Movie movie;
    private Actor actor;
}
