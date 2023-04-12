package com.induk.cinema.dto;

public enum Format {
    FORMAT_2D("2D"), FORMAT_3D("3D"), FORMAT_4D("4DX"), FORMAT_IMAX("IMAX");

    private final String format;

    Format(String format) {
        this.format = format;
    }

    public String getFormat() {
        return format;
    }
}
