package com.induk.cinema.controller;

import com.induk.cinema.dto.ReservationForm;
import com.induk.cinema.service.ReservationService;
import com.induk.cinema.service.SeatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/reservations")
@RequiredArgsConstructor
public class AdminReservationController {

    private final ReservationService reservationService;
    private final SeatService seatService;

    @GetMapping
    public String listForm(Model model) {
        List<ReservationForm> reservationForms = reservationService.reservationList();
        model.addAttribute("reservations", reservationForms);
        return "admin/reservation/listForm";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        HashMap<String, Object> reservation = reservationService.findReservation(id);

        model.addAttribute("reservation", reservation);
        return "admin/reservation/detailForm";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        HashMap<String, Object> reservation = reservationService.findReservation(id);

        model.addAttribute("reservation", reservation);
        return "admin/reservation/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String editReservation(@PathVariable Long id, @RequestParam int status) {
        reservationService.updateReservation(id, status);
        return "redirect:/csmovie/admin/reservations/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/csmovie/admin/reservations";
    }
}
