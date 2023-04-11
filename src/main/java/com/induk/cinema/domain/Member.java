package com.induk.cinema.domain;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private Long id;

    @NotBlank(message = "이름은 필수 입력입니다.")
    @Length(max=20)
    private String name;

    @NotBlank(message = "이메일은 필수 입력입니다.")
    @Email(message = "이메일 형식에 맞지 않습니다.")
    @Length(max=30)
    private String email;

    @NotBlank(message = "비밀번호는 필수 입력입니다.")
    @Length(max=20)
    private String password;

    @NotBlank(message = "주소는 필수 입력입니다.")
    @Length(max=50)
    private String address;

    private String image;
    private MultipartFile imageForm;

    private String subscriptionDate;
    private int admin;       //0=사용자,    1=관리자
}
