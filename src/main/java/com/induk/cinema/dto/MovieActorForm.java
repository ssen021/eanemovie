package com.induk.cinema.dto;

import com.induk.cinema.domain.MovieActor;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
public class MovieActorForm {

    private Long id;
    private Long movieId;

    @NotNull(message = "배우를 선택해주세요.")
    private Long actorId;

    @NotEmpty(message = "배역을 입력해주세요.")
    private String role;

    public MovieActorForm() {
    }

    public MovieActorForm(MovieActor movieActor) {
        this.id = movieActor.getId();
        this.movieId = movieActor.getMovie().getId();
        this.actorId = movieActor.getActor().getId();
        this.role = movieActor.getRole();
    }
}
