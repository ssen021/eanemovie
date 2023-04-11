package com.induk.cinema.controller;

import com.induk.cinema.domain.Actor;
import com.induk.cinema.dto.ActorForm;
import com.induk.cinema.service.ActorService;
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
@RequestMapping("/csmovie/admin/actors")
@RequiredArgsConstructor
public class AdminActorController {

    private final ActorService actorService;
    private final FileStore fileStore;

    @GetMapping
    public String actors(Model model) {
        model.addAttribute("actors", actorService.actorList());
        return "admin/actor/listForm";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        model.addAttribute("actor", actorService.findActor(id));
        return "admin/actor/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("actorForm", new ActorForm());
        return "admin/actor/addForm";
    }

    @PostMapping("/add")
    public String addActor(@Valid ActorForm actorForm,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes) throws IOException {
        if(bindingResult.hasErrors()) {
            return "admin/actor/addForm";
        }

        Long id = actorService.saveActor(actorForm);
        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/actors/{id}";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("actor", actorService.findActor(id));
        return "admin/actor/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateActor(@PathVariable Long id,
                              @RequestParam MultipartFile imageFile,
                              @Valid Actor actor,
                              BindingResult bindingResult) throws IOException {
        if(bindingResult.hasErrors()) {
            return "admin/actor/updateForm";
        }

        actorService.updateActor(actor, imageFile);

        return "redirect:/csmovie/admin/actors/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteActor(@PathVariable Long id) {
        actorService.deleteActor(id);
        return "redirect:/csmovie/admin/actors";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("actor", filename));
    }
}
