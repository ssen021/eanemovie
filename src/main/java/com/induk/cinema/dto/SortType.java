package com.induk.cinema.dto;

import lombok.Getter;

@Getter
public enum SortType {
    Recent("최신순"), Popularity("인기순");

    private String label;

    SortType(String label ) {
        this.label = label;
    }

    public String getCode() {
        return this.label;
    }
}
