package com.induk.cinema.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class CheckoutData {

    private Long member_id;
    private Long schedule_id;

    private String payment;
    private Long cardNum;
    private String cardCom;
    private String cardDate;
    private Long CVC;
    private Long price;

    private Long adult;
    private Long youth;
    private String seat;

    private String useCode;
}
