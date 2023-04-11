package com.induk.cinema.dto;

import com.induk.cinema.util.CurrentPage;
import com.induk.cinema.util.PaginationInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationListPage extends CurrentPage {
    private List<ReservationListForm> reservationListForms;
    private PaginationInfo paginationInfo;
    private Long memberId;
    private Integer sort;
}
