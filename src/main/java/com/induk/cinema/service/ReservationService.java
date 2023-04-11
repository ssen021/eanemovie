package com.induk.cinema.service;

import com.induk.cinema.domain.*;
import com.induk.cinema.dto.*;
import com.induk.cinema.repository.CityRepository;
import com.induk.cinema.repository.ReservationRepository;
import com.induk.cinema.repository.ScheduleRepository;
import com.induk.cinema.util.PaginationInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;

    public int countAll() { return reservationRepository.countAll(); }

    public List<MainSales> allSales() {
        return reservationRepository.findByAllSales();
    }

    public List<MainSales> findByYearSales(String year) {
        return reservationRepository.findByYearSales(year);
    }

    public List<Sales> movieSales(Long movieId, String year) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("movieId", movieId);
        map.put("year", year);

        return reservationRepository.findBySales(map);
    }

    public List<MoviesSale> movieListSale(String date1, String date2) {
        HashMap<String, String> map = new HashMap<>();
        map.put("date1", date1);
        map.put("date2", date2);

        return reservationRepository.findByMoviesSale(map);
    }

    public List<Sales> cinemaSales(Long cinemaId, String year) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("cinemaId", cinemaId);
        map.put("year", year);

        return reservationRepository.findByCSales(map);
    }

    public List<CinemasSale> cinemaListSale(String date1, String date2) {
        HashMap<String, String> map = new HashMap<>();
        map.put("date1", date1);
        map.put("date2", date2);

        return reservationRepository.findByCinemaSale(map);
    }

    public ReservationListPage reservationListBySort(ReservationListPage rlp)  {
        HashMap<String, Object> map = new HashMap<>();
        map.put("memberId", rlp.getMemberId());
        map.put("basehDate", "2021-07-13 00:00:00");
        map.put("sort", rlp.getSort());


        int reservationTotalCount = reservationRepository.findReservationByStatusCount(map);

        rlp.setRecordsPerPage(3); //한페이지당 데이터 갯수
        rlp.setPageSize(5); //페이지의 갯수
        PaginationInfo paginationInfo = new PaginationInfo(rlp);
        paginationInfo.setTotalRecordCount(reservationTotalCount);

        rlp.setPaginationInfo(paginationInfo);
        if (reservationTotalCount > 0) {
            map.put("firstRecordIndex", rlp.getPaginationInfo().getFirstRecordIndex());
            map.put("recordsPerPage", rlp.getRecordsPerPage());
            rlp.setReservationListForms(reservationRepository.findReservationByStatus(map));
            for(ReservationListForm rlf : rlp.getReservationListForms()){
                if(rlf.getSeatNumbers() == null) rlf.setSeatNumbers("");
            }
        }
        else rlp.setReservationListForms(new ArrayList<ReservationListForm>());

        return rlp;
    }

    public int cancelReservation(Long id){
        int result = reservationRepository.cancelReservation(id);
        return result;
    }

    public List<ReservationForm> reservationList() {
        return reservationRepository.findAll();
    }

    public HashMap<String, Object> findReservation(Long id) {
        return reservationRepository.findById(id);
    }

    public Long saveCity(Reservation reservation) {
        reservationRepository.save(reservation);
        return reservation.getId();
    }

    public void updateReservation(Long id, int status) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("status", status);

        reservationRepository.update(map);
    }

    public int deleteReservation(Long id) {
        reservationRepository.delete(id);
        return 0;
    }

    public EventCode findByCodeForEventCode(String code, Long member_id, String date) {
        return reservationRepository.findByCodeForEventCode(code, member_id, date);
    }

    public Long save(Reservation reservation) {
        reservationRepository.save(reservation);
        return reservation.getId();
    }

    public Long savePayment(Payment payment) {
        reservationRepository.savePayment(payment);
        return payment.getId();
    }

}
