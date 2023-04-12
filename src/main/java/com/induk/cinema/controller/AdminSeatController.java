package com.induk.cinema.controller;

import com.induk.cinema.domain.Seat;
import com.induk.cinema.domain.Theater;
import com.induk.cinema.service.SeatService;
import com.induk.cinema.service.TheaterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/csmovie/admin/seats")
@RequiredArgsConstructor
public class AdminSeatController {

    private final SeatService seatService;
    //private final ReservationService reservationService;

    @GetMapping
    public String home(Model model) {
        List<Seat> seat = seatService.seatList();
        model.addAttribute("seats", seatService.seatList());

        return "admin/seat/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        //비어있는 객체를 넘겨야 오류가 발생하지 않음
        model.addAttribute("seat", new Seat());
        return "admin/seat/addForm";
    }

    @PostMapping("/add")
    public String addTheater(@Valid Seat seat,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             Model model) {

        if(bindingResult.hasErrors()) {
            return "admin/seat/addForm";
        }

        Long id = seatService.saveSeat(seat);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/seats/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("seat", seatService.findSeat(id));
        return "admin/seat/detailForm";
    }

    @DeleteMapping("/del/{id}")
    public String deleteTheater(@PathVariable Long id) {
        seatService.deleteSeat(id);
        return "redirect:/csmovie/admin/seats";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Long id, Model model) {

        //model.addAttribute("reservations", reservationService.findReservation());
        model.addAttribute("seat", seatService.findSeat(id));
        return "admin/seat/updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateTheater(@Valid Seat seat,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model,
                                @PathVariable("id") Long id) {

        if(bindingResult.hasErrors()) {
            //model.addAttribute("reservations", reservationService.findReservation());
            return "admin/seat/updateForm";
        }

        seatService.updateSeat(seat);
        model.addAttribute("seat", seat);

        return "redirect:/csmovie/admin/seats/{id}";
    }

}
