<%@ page import="com.induk.cinema.domain.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Header -->
    <c:import url="../main/header.jsp" />

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Navigation -->
    <c:import url="../main/nav.jsp" />

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <form method="post" action="/csmovie/admin/members/${member.id}/edit" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/members"><i class="fas fa-user-friends"> Member</i></a>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/members/${member.id}'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">ID <font color="red">*</font></th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${member.id}" name="id" readonly>
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="member.name">
                                <th scope="row" width="20%" style="vertical-align:middle;">Name <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" value="${member.name}" name="${status.expression}" id="${status.expression}" placeholder="이름을 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="member.email">
                                <th scope="row" width="20%" style="vertical-align:middle;">Email <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" name="${status.expression}" value="${member.email}" id="${status.expression}" class="form-control" placeholder="이메일을 입력해주세요">
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="member.password">
                                <th scope="row" width="20%" style="vertical-align:middle;">Password <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" name="${status.expression}" value="${member.password}"  id="${status.expression}" class="form-control" placeholder="비밀번호를 입력해주세요">
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="member.address">
                                <th scope="row" width="20%" style="vertical-align:middle;">Address <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" name="${status.expression}" value="${member.address}" id="${status.expression}" class="form-control" placeholder="주소를 입력해주세요">
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Subscription_date</th>
                            <td width="80%">
                                <input type="text" class="form-control" name="subscriptionDate" value="${member.subscriptionDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Admin <font color="red">*</font></th>
                            <td width="80%">
                                <c:if test="${member.admin == 1}">
                                    <input type="radio" name="admin" value="0">사용자 &emsp;&emsp;
                                    <input type="radio" name="admin" value="1" checked="checked">관리자
                                </c:if>
                                <c:if test="${member.admin == 0}">
                                    <input type="radio" name="admin" value="0" checked="checked" >사용자 &emsp;&emsp;
                                    <input type="radio" name="admin" value="1">관리자
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Image </th>
                            <td width="80%">
                                <input multiple="multiple" type="file" name="imageForm"/>
                                <br><br><img src="/csmovie/admin/members/images/${member.image}" style="max-height: 200px">
                                <br><font color="red">이미지 삭제 </font><input type="checkbox" name="imageDel" value="1"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<c:import url="../main/footer.jsp" />

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>

</html>