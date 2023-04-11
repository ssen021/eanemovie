package com.induk.cinema.controller;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.EventCode;
import com.induk.cinema.domain.Member;
import com.induk.cinema.domain.Review;
import com.induk.cinema.dto.HistoryUrl;
import com.induk.cinema.dto.ReservationListForm;
import com.induk.cinema.dto.ReservationListPage;
import com.induk.cinema.service.EventCodeService;
import com.induk.cinema.service.MemberService;
import com.induk.cinema.service.ReservationService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/csmovie/members")
public class MemberController {
    private final MemberService memberService;
    private final FileStore fileStore;
    private final ReservationService reservationService;
    private final EventCodeService eventCodeService;
    @GetMapping("/login")
    public String login(Model model, @ModelAttribute("historyUrl") HistoryUrl historyUrl){
        model.addAttribute("member", new Member());
        return "/cinema/member/sign-in";
    }
    @PostMapping("/login")
    public String login(@Valid Member member, BindingResult bindingResult,
                        @RequestParam(value = "remember", required = false)String remember,
                        @ModelAttribute("historyUrl") HistoryUrl historyUrl,
                        HttpSession session, HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        Member m = memberService.login(member);

        Cookie cookie = new Cookie("email", member.getEmail());
        if(remember == null) cookie.setMaxAge(0);
        response.addCookie(cookie);

        if(bindingResult.hasFieldErrors("email")) {
            return "/cinema/member/sign-in";
        }

        if(m == null){
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer;
            writer = response.getWriter();
            writer.print("<script language='JavaScript' charset='UTF-8'>");
            writer.print("alert('이메일과 비밀번호를 확인해주세요');");
            writer.print("location.href='/csmovie/members/login?" + historyUrl.getParam() + "';");
            writer.print("</script>");
            writer.close();
        }

        session.setAttribute("member", m);
        if(!historyUrl.getHistoryUrl().isEmpty() && historyUrl.getHistoryUrl() != ""){
            return "redirect:" + historyUrl.getURL();
        }
        return "redirect:/csmovie";
    }
    @GetMapping("/signup")
    public String signupForm(Model model){
        model.addAttribute("member", new Member());
        return "/cinema/member/sign-up";
    }

    @PostMapping("/signup")
    public String addMember(@Valid Member member,
                            BindingResult bindingResult) throws IOException {
        //형식
        if(bindingResult.hasErrors()) {
            return "/cinema/member/sign-up";
        }

        memberService.saveMember(member);
        return "redirect:/csmovie/members/login";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/csmovie";
    }

    @GetMapping("/edit")
    public String updateForm(HttpSession session, Model model){
        Member m = (Member)session.getAttribute("member");
        model.addAttribute("member", memberService.findMember(m.getId()));
        return "/cinema/member/updateForm";
    }

    @PostMapping("/edit")
    public String updateForm(HttpSession session, @Valid Member member,
                         BindingResult bindingResult, HttpServletResponse response,
                         @RequestParam(value = "imageDel", required = false) String imageDel) throws IOException {

        Member sessionMember = (Member)session.getAttribute("member");
        Member m = memberService.findMember(sessionMember.getId());

        member.setEmail(m.getEmail());
        member.setImage(m.getImage());
        member.setId(m.getId());
        member.setAdmin(m.getAdmin());
        //형식 검사
        if(bindingResult.hasFieldErrors("address") || bindingResult.hasFieldErrors("name")) {
            return "cinema/member/updateForm";
        }
        if(member.getPassword() == null || member.getPassword().equals("")) member.setPassword(m.getPassword());
        System.out.println("\n\n\n mp:"+member.getPassword());
        System.out.println("\n\n\n m.p:"+m.getPassword());

        int result = memberService.updateMember(member, imageDel);

        if(result >0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정되었습니다'); location.href='/csmovie/members/edit';</script>");
            out.flush();
        }
        else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정에 실패하였습니다.'); location.href=/csmovie/members/edit;</script>");
            out.flush();
        }
        return "redirect:/csmovie/members/edit";
    }

    @GetMapping("/reservationList")
    public String reservationListForm(HttpSession session, Model model){
        Member m = (Member)session.getAttribute("member");

        ReservationListPage rlp1 = new ReservationListPage();
        rlp1.setMemberId(m.getId());
        rlp1.setSort(1);
        ReservationListPage rlp2 = new ReservationListPage();
        rlp2.setMemberId(m.getId());
        rlp2.setSort(2);

        model.addAttribute("reserveMovies", reservationService.reservationListBySort(rlp1));
        model.addAttribute("seenMovies", reservationService.reservationListBySort(rlp2));
        return "/cinema/member/reservationListForm";
    }

    @PostMapping("/reservationListAjax")
    @ResponseBody
    public ReservationListPage reservationListAjax(@RequestBody ReservationListPage rlp){
        return reservationService.reservationListBySort(rlp);
    }

    @PostMapping("/reservationCancelAjax")
    @ResponseBody
    public Integer delAjax(@RequestBody ReservationListForm rlf){
        return reservationService.deleteReservation(rlf.getId());
    }

    @PostMapping("/couponListAjax")
    @ResponseBody
    public List<EventCode> couponListAjax(@RequestParam("memberId") long memberId){
        return eventCodeService.eventCodeListByMemberId(memberId);
    }

    @PostMapping("/checkEmailAjax")
    @ResponseBody
    public int checkDuplicateEmail(@RequestParam("email") String email){
        return memberService.checkDuplicateEmail(email);
    }


    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("member", filename));
    }
}
