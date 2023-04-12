package com.induk.cinema.controller;

import com.induk.cinema.domain.*;
import com.induk.cinema.dto.CheckoutData;
import com.induk.cinema.service.EventCodeService;
import com.induk.cinema.service.ReservationService;
import com.induk.cinema.service.ScheduleService;
import com.induk.cinema.service.SeatService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/csmovie/reservations")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;
    private final ScheduleService scheduleService;
    private final SeatService seatService;
    private final EventCodeService eventCodeService;

    @GetMapping
    public String home(@RequestParam(required=false) Long scheduleId, Model model) {
        model.addAttribute("scheduleId", scheduleId);

        Schedule schedule = scheduleService.findSchedule(scheduleId);
        model.addAttribute("schedule", schedule);

        model.addAttribute("seats", seatService.findBySchedule(scheduleId));

        return "cinema/reservation/movie-seat";
    }

    @GetMapping("/checkout")
    public String checkout(@RequestParam(required=false) String price, @RequestParam(required=false) String seat,
                           @RequestParam(required=false) Long scheduleId, @RequestParam(required=false) String adult,
                           @RequestParam(required=false) String youth, Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("schedule", scheduleService.findSchedule(scheduleId));

        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");

        model.addAttribute("member", member);
        model.addAttribute("seat", seat);
        model.addAttribute("price", price);
        model.addAttribute("adult", adult);
        model.addAttribute("youth", youth);

        return "cinema/reservation/movie-checkout";

    }

    @PostMapping("/eventCodeAjax")
    @ResponseBody
    public EventCode scheduleAjax(@RequestParam(value = "code") String code,
                                  @RequestParam(value = "memberId") Long member_id,
                                  @RequestParam(value = "date") String date){

        EventCode eventCode = reservationService.findByCodeForEventCode(code, member_id, date);

        return eventCode;
    }

    @PostMapping("/checkout")
    public String checkout(@ModelAttribute("checkoutData") CheckoutData checkoutData, Model model) {

        Payment payment = new Payment();
        payment.setMethod(checkoutData.getPayment());
        payment.setPrice(checkoutData.getPrice());
        Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
        SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        payment.setDate(fourteen_format.format(date_now));

        Long payment_id = reservationService.savePayment(payment);

        Reservation reservation = new Reservation();
        reservation.setMember_id(checkoutData.getMember_id());
        reservation.setSchedule_id(checkoutData.getSchedule_id());
        reservation.setPayment_id(payment_id);
        reservation.setAdult(checkoutData.getAdult());
        reservation.setYouth(checkoutData.getYouth());
        reservation.setDate(fourteen_format.format(date_now));
        reservation.setStatus("1");

        Long reservation_id = reservationService.save(reservation);

        String temp = checkoutData.getSeat();

        String[] seatArray = temp.split(" ");

        for(int i=0;i<seatArray.length;i++){
            Seat seat = new Seat();
            seat.setNumber(seatArray[i]);
            seat.setScheduleId(checkoutData.getSchedule_id());
            seat.setReservationId(reservation_id);
            seatService.saveSeat(seat);
        }

        if(checkoutData.getUseCode() != " " || checkoutData.getUseCode() != "") {
            EventCode eventCode = new EventCode();
            eventCode.setCode(checkoutData.getUseCode());
            eventCode.setStatus(Long.parseLong("1"));
            eventCodeService.changeStatus(eventCode);
        }

        return  "redirect:/csmovie/members/reservationList";
    }


}
