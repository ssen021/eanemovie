package com.induk.cinema.controller;

import com.induk.cinema.domain.Actor;
import com.induk.cinema.domain.City;
import com.induk.cinema.service.CityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/csmovie/admin/citys")
@RequiredArgsConstructor
public class AdminCityController {

    private final CityService cityService;

    @GetMapping
    public String citys(Model model) {
        model.addAttribute("citys", cityService.cityList());
        return "admin/city/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        //비어있는 객체를 넘겨야 오류가 발생하지 않음
        model.addAttribute("city", new City());
        return "admin/city/addForm";
    }

    @PostMapping("/add")
    public String addCity(@Valid City city,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes) {

        if(bindingResult.hasErrors()) {
            return "admin/city/addForm";
        }

        Long id = cityService.saveCity(city);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/citys/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("city", cityService.findCity(id));
        return "admin/city/detailForm";
    }

    @DeleteMapping("/del/{id}")
    public String deleteCity(@PathVariable Long id) {
        cityService.deleteCity(id);
        return "redirect:/csmovie/admin/citys";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("city", cityService.findCity(id));
        return "admin/city/updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateCity(@Valid City city,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             @PathVariable("id") Long id,
                             Model model) {

        if(bindingResult.hasErrors()) {
            return "admin/city/updateForm";
        }

        cityService.updateCity(city);

        model.addAttribute("city", city);
        return "admin/city/detailForm";
    }
}
