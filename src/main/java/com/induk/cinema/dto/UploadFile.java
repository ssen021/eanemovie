package com.induk.cinema.dto;

import lombok.Data;

@Data
public class UploadFile {

    private String uploadFilename;
    private String storeFilename;
    private String path;

    public UploadFile(String uploadFilename, String storeFilename, String path) {
        this.uploadFilename = uploadFilename;
        this.storeFilename = storeFilename;
        this.path = path;
    }
}
