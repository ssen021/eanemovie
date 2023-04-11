package com.induk.cinema.controller;

import com.induk.cinema.dto.MainSales;
import com.induk.cinema.dto.Sales;
import com.induk.cinema.service.ReservationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin")
@RequiredArgsConstructor
public class AdminController {

    private final ReservationService reservationService;

    @GetMapping
    public String home(Model model) {
        List<MainSales> mainSales = reservationService.allSales();
        int totalReservation = 0, totalPeople = 0, totalPrice = 0;

        for (MainSales sale : mainSales) {
            totalPrice += sale.getPrice();
            totalReservation += sale.getReservationCount();
            totalPeople += sale.getPeopleCount();
        }

        model.addAttribute("avgPrice", totalPrice/mainSales.size());
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("reservationCount", totalReservation);
        model.addAttribute("peopleCount", totalPeople);

        return "admin/main/index";
    }

    @ResponseBody
    @PostMapping("/chart")
    public List<Integer> chart() {
        String year = Integer.toString(LocalDate.now().getYear());
        List<MainSales> mainSales = reservationService.findByYearSales(year);
        Map<String, Integer> dateMap = getDateMap(year);

        for (MainSales sale : mainSales) {
            dateMap.replace(sale.getDate(), sale.getPrice());
        }

        return dateMap.values().stream().collect(Collectors.toList());
    }

    private Map<String, Integer> getDateMap(String year) {
        Map<String, Integer> map = new LinkedHashMap<>();
        for(int i = 1; i <= 12; i++) {
            String date;
            if (i < 10) date = year + "-0" + i;
            else date = year + "-" + i;
            map.put(date, 0);
        }
        return map;
    }
}
