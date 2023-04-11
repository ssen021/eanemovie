package com.induk.cinema.service;

import com.induk.cinema.domain.Member;
import com.induk.cinema.dto.UploadFile;
import com.induk.cinema.repository.MemberRepository;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;
    private final FileStore fileStore;

    public List<Member> memberList() {
        return memberRepository.findAll();
    }

    public Member findMember(Long id) {
        return memberRepository.findById(id);
    }

    public Long saveMember(Member member) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(member.getImageForm(), "member");

        if(uploadFile == null) {
            member.setImage("user_image.png");
        }else{
            member.setImage(uploadFile.getStoreFilename());
        }

        memberRepository.save(member);
        return member.getId();
    }

    public int updateMember(Member member, String imageDel) throws IOException {
        if(imageDel == null){
            UploadFile uploadFile = fileStore.storeFile(member.getImageForm(), "member");

            if(uploadFile == null) {
                Member m = findMember(member.getId());
                member.setImage(m.getImage());
            }else{
                member.setImage(uploadFile.getStoreFilename());
            }
        }
        else member.setImage("user_image.png");

        return memberRepository.update(member);
    }

    public int checkDuplicateEmail(String email){
        return memberRepository.countByEmail(email);
    }

    public void deleteMember(Long id) {
        memberRepository.delete(id);
    }

    public Member login(Member member){
        return memberRepository.login(member);
    }
}
