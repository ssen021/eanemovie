package com.induk.cinema.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EventCode {

    private Long id;
    private int eventId;
    private String code;
    private Date issueDate;
    private Date codeLimit;
    private int discountRate;
    private Long status;
    private Long memberId;

    private Event event;
}
