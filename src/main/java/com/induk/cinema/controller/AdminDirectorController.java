package com.induk.cinema.controller;

import com.induk.cinema.domain.Actor;
import com.induk.cinema.domain.Director;
import com.induk.cinema.dto.ActorForm;
import com.induk.cinema.dto.DirectorForm;
import com.induk.cinema.service.ActorService;
import com.induk.cinema.service.DirectorService;
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
@RequestMapping("/csmovie/admin/directors")
@RequiredArgsConstructor
public class AdminDirectorController {

    private final DirectorService directorService;
    private final FileStore fileStore;

    @GetMapping
    public String directors(Model model) {
        model.addAttribute("directors", directorService.directorList());
        return "admin/director/listForm";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        model.addAttribute("director", directorService.findDirector(id));
        return "admin/director/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("directorForm", new DirectorForm());
        return "admin/director/addForm";
    }

    @PostMapping("/add")
    public String addDirector(@Valid DirectorForm directorForm,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes) throws IOException {
        if(bindingResult.hasErrors()) {
            return "admin/director/addForm";
        }

        Long id = directorService.saveDirector(directorForm);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/directors/{id}";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("director", directorService.findDirector(id));
        return "admin/director/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateDirector(@PathVariable Long id,
                              @RequestParam MultipartFile imageFile,
                              @Valid Director director,
                              BindingResult bindingResult) throws IOException {
        if(bindingResult.hasErrors()) {
            return "admin/director/updateForm";
        }

        directorService.updateDirector(director, imageFile);

        return "redirect:/csmovie/admin/directors/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteDirector(@PathVariable Long id) {
        directorService.deleteDirector(id);
        return "redirect:/csmovie/admin/directors";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("director", filename));
    }
}
