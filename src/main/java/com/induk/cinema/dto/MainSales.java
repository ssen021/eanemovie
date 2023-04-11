package com.induk.cinema.dto;

import lombok.Data;

@Data
public class MainSales {
    private int price;
    private int reservationCount;
    private int peopleCount;
    private String date;
}
