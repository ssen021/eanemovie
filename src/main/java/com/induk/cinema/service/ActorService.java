package com.induk.cinema.service;

import com.induk.cinema.domain.Actor;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.dto.ActorForm;
import com.induk.cinema.repository.ActorRepository;
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
public class ActorService {

    private final ActorRepository actorRepository;
    private final FileStore fileStore;

    public List<Actor> actorList() {
        return actorRepository.findAll();
    }

    public Actor findActor(Long id) {
        return actorRepository.findById(id);
    }

    public Long saveActor(ActorForm actorForm) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(actorForm.getImageFile(), "actor");

        if(uploadFile == null) {
            uploadFile = new UploadFile("default_actor.png", "default_actor.png", "actor");
        }

        Actor actor = new Actor();
        actor.setName(actorForm.getName());
        actor.setUploadFilename(uploadFile.getUploadFilename());
        actor.setStoreFilename(uploadFile.getStoreFilename());
        actor.setPath(uploadFile.getPath());

        actorRepository.save(actor);

        return actor.getId();
    }

    public void updateActor(Actor actor, MultipartFile file) throws IOException {
        if(!file.isEmpty()) {
            UploadFile uploadFile = fileStore.storeFile(file, "actor");
            actor.setStoreFilename(uploadFile.getStoreFilename());
            actor.setUploadFilename(uploadFile.getUploadFilename());
            actor.setPath(uploadFile.getPath());
        }

        actorRepository.update(actor);
    }

    public void deleteActor(Long id) {
        actorRepository.delete(id);
    }
}
