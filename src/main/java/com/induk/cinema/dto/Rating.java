package com.induk.cinema.dto;

public enum Rating {
    ALL("전체 관람가"), AGE12("12세 관람가"), AGE15("15세 관람가"), AGE19("청소년 관람불가");

    private final String rating;

    Rating(String rating) {
        this.rating = rating;
    }

    public String getRating() {
        return rating;
    }
}
