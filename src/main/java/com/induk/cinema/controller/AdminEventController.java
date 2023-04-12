package com.induk.cinema.controller;

import com.induk.cinema.domain.Event;
import com.induk.cinema.domain.Member;
import com.induk.cinema.dto.EventForm;
import com.induk.cinema.service.EventService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.net.MalformedURLException;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/events")
@RequiredArgsConstructor
public class AdminEventController {

    private final EventService eventService;
    private final FileStore fileStore;

    @GetMapping
    public String event(Model model) {
        model.addAttribute("events", eventService.eventList());
        return "admin/event/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("eventForm", new EventForm());
        return "admin/event/addForm";
    }

    @PostMapping("/add")
    public String addEvent(@Valid EventForm eventForm,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes) throws IOException {

        if(eventForm.getImageFile().isEmpty()) {
            bindingResult.addError(new FieldError("eventForm", "imageFile", "사진을 등록해주세요"));
            return "admin/event/addForm";
        }
        if(eventForm.getThum_imageFile().isEmpty()) {
            bindingResult.addError(new FieldError("eventForm", "thum_imageFile", "사진을 등록해주세요"));
            return "admin/event/addForm";
        }

        if(bindingResult.hasErrors()) {
            return "admin/event/addForm";
        }

        Long id = eventService.saveEvent(eventForm);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/events/{id}";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        model.addAttribute("event", eventService.findEvent(id));
        return "admin/event/detailForm";
    }

    @GetMapping("/{id}/delete")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/csmovie/admin/events";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("event", eventService.findEvent(id));
        return "admin/event/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateEvent(@RequestParam MultipartFile imageFile,
                              @RequestParam MultipartFile thum_imageFile,
                              @Valid Event event,
                              BindingResult bindingResult) throws IOException {
        if(bindingResult.hasErrors()) {
            return "admin/event/updateForm";
        }
        eventService.updateEvent(event, imageFile, thum_imageFile);

        return "redirect:/csmovie/admin/events/{id}";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("event", filename));
    }
}
