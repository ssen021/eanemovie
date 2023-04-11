package com.induk.cinema.util;

import com.induk.cinema.dto.UploadFile;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class FileStore {

    private String path = System.getProperty("user.dir");
    private String fileDir = path + "\\src\\main\\webapp\\WEB-INF\\views\\image\\";
    //private String fileDir = path + "/webapps/csmovie/WEB-INF/views/image/";

    public String getFullPath(String directory, String filename) {
        return fileDir + directory + "\\" + filename;
    }

    public List<UploadFile> storeFiles(List<MultipartFile> multipartFiles, String directory) throws IOException {
        List<UploadFile> storeFileResult = new ArrayList<>();

        for (MultipartFile multipartFile : multipartFiles) {
            if(!multipartFile.isEmpty()) {
                storeFileResult.add(storeFile(multipartFile, directory));
            }
        }

        return storeFileResult;
    }

    public UploadFile storeFile(MultipartFile multipartFile, String directory) throws IOException {
        if(multipartFile.isEmpty()) {
            return null;
        }

        String originalFilename = multipartFile.getOriginalFilename();
        String storeFilename = createStoreFilename(originalFilename);
        multipartFile.transferTo(new File(getFullPath(directory, storeFilename)));

        return new UploadFile(originalFilename, storeFilename, directory);
    }

    private String createStoreFilename(String originFilename) {
        // 서버에 저장하는 랜덤 파일명 만들기
        String uuid = UUID.randomUUID().toString();
        String ext = extractExt(originFilename);
        return uuid + "." + ext;
    }

    private String extractExt(String originFilename) {
        // imageForm.jpg -> . 의 위치 가져오기
        int pos = originFilename.lastIndexOf(".");

        // 위치 + 1 에서 확장자만 리턴
        return originFilename.substring(pos + 1);
    }
}
