package com.induk.cinema.controller;

import com.induk.cinema.domain.EventCode;
import com.induk.cinema.domain.Review;
import com.induk.cinema.dto.EventCodeForm;
import com.induk.cinema.service.EventCodeService;
import com.induk.cinema.service.EventService;
import com.induk.cinema.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/eventCodes")
@RequiredArgsConstructor
public class AdminEventCodeController {

    private final EventCodeService eventCodeService;
    private final EventService eventService;
    private final MemberService memberService;

    @GetMapping
    public String eventCode(Model model) {
        model.addAttribute("events", eventService.eventList());
        model.addAttribute("eventCodes", eventCodeService.eventCodeList());
        return "admin/eventCode/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("events", eventService.eventList());
        model.addAttribute("eventCodeForm", new EventCodeForm());
        return "admin/eventCode/addForm";
    }

    @PostMapping("/add")
    public String addEventCode(@Valid EventCodeForm eventCodeForm,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                               Model model) throws IOException {

        if(bindingResult.hasErrors()) {
            model.addAttribute("events", eventService.eventList());
            return "admin/eventCode/addForm";
        }

        Long id = eventCodeService.saveEventCode(eventCodeForm);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/eventCodes/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {

        EventCode eventCode = eventCodeService.findEventCode(id);
        model.addAttribute("events", eventService.eventList());
        model.addAttribute("eventCode", eventCode);
        if(eventCode.getMemberId() != 0){
            model.addAttribute("memberName", memberService.findMember(eventCode.getMemberId()).getName());
        }

        return "admin/eventCode/detailForm";
    }

    @GetMapping("/{id}/delete")
    public String deleteEventCode(@PathVariable Long id) {
        eventCodeService.deleteEventCode(id);
        return "redirect:/csmovie/admin/eventCodes";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        EventCode eventCode = eventCodeService.findEventCode(id);
        model.addAttribute("events", eventService.eventList());
        model.addAttribute("eventCode", eventCode);
        return "admin/eventCode/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateEventCode(@PathVariable Long id,
                              @Valid EventCode eventCode,
                              BindingResult bindingResult,
                                  Model model) throws IOException {

        if(bindingResult.hasErrors()) {
            model.addAttribute("events", eventService.eventList());
            return "admin/eventCode/updateForm";
        }

        eventCodeService.updateEventCode(eventCode);

        return "redirect:/csmovie/admin/eventCodes/{id}";
    }

}