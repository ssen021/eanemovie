package com.induk.cinema.repository;

import com.induk.cinema.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MemberRepository {

    List<Member> findAll();
    Member findById(Long id);
    Long save(Member member);
    int update(Member member);
    void delete(Long id);
    Member login(Member member);
    int countByEmail(String email);
}
