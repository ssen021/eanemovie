package com.induk.cinema.dto;

import lombok.Data;
import java.sql.Date;

@Data
public class EventCodeForm {

    private int event_id;
    private String code;
    private Date issue_date;
    private Date code_limit;
    private int discount_rate;
}
