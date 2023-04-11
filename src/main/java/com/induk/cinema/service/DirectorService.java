package com.induk.cinema.service;

import com.induk.cinema.domain.Director;
import com.induk.cinema.dto.DirectorForm;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.DirectorRepository;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class DirectorService {

    private final DirectorRepository directorRepository;
    private final FileStore fileStore;

    public List<Director> directorList() {
        return directorRepository.findAll();
    }

    public Director findDirector(Long id) {
        return directorRepository.findById(id);
    }

    public Long saveDirector(DirectorForm directorForm) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(directorForm.getImageFile(), "director");

        if(uploadFile == null) {
            uploadFile = new UploadFile("default_director.png", "default_director.png", "director");
        }

        Director director = new Director();
        director.setName(directorForm.getName());
        director.setUploadFilename(uploadFile.getUploadFilename());
        director.setStoreFilename(uploadFile.getStoreFilename());
        director.setPath(uploadFile.getPath());

        directorRepository.save(director);

        return director.getId();
    }

    public void updateDirector(Director director, MultipartFile file) throws IOException {
        if(!file.isEmpty()) {
            UploadFile uploadFile = fileStore.storeFile(file, "director");
            director.setStoreFilename(uploadFile.getStoreFilename());
            director.setUploadFilename(uploadFile.getUploadFilename());
            director.setPath(uploadFile.getPath());
        }

        directorRepository.update(director);
    }

    public void deleteDirector(Long id) {
        directorRepository.delete(id);
    }
}
