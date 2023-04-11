<%@ page import="com.induk.cinema.domain.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <form method="post" action="/csmovie/admin/cinemas/update/${cinema.id}">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-theater-masks"><a href="/csmovie/admin/cinemas" style="text-decoration:none"> Cinema</a></i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/cinemas/${cinema.id}'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">ID <font color="red">*</font></th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${cinema.id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.city_id">
                                <th scope="row" width="20%" style="vertical-align:middle;">City <font color="red">*</font></th>
                                <td width="80%">
                                    <select name="${status.expression }" id="${status.expression }" class="form-control">
                                        <option value="">시/도를 선택해주세요</option>
                                        <c:forEach var="city" items="${citys}">
                                            <c:if test="${city.id == cinema.city_id}">
                                                <option value="${city.id}" selected>${city.name}</option>
                                            </c:if>
                                            <c:if test="${city.id != cinema.city_id}">
                                                <option value="${city.id}">${city.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.name">
                                <th scope="row" width="20%" style="vertical-align:middle;">Name <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" value="${cinema.name}" name="${status.expression }"
                                           id="${status.expression }" placeholder="극장명을 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.introduction">
                                <th scope="row" width="20%" style="vertical-align:middle;">Introduction <font color="red">*</font></th>
                                <td width="80%">
                                    <textarea name="${status.expression }" id="${status.expression }" style="width:100%; resize:none;"
                                              rows="9" placeholder="극장 소개를 입력해주세요">${cinema.introduction}</textarea>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.subtitle">
                                <th scope="row" width="20%" style="vertical-align:middle;">SubTitle </th>
                                <td width="80%">
                                    <textarea name="${status.expression }" id="${status.expression }" style="width:100%; resize:none;"
                                              rows="4" placeholder="소제목를 입력해주세요">${cinema.subtitle}</textarea>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.facility">
                                <th scope="row" width="20%" style="vertical-align:middle;">Facility <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" value="${cinema.facility}" name="${status.expression }"
                                           id="${status.expression }" placeholder=",로 구분하여 시설명을 입력해주세요(ex : 일반상영관,장애인석)">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.parking">
                                <th scope="row" width="20%" style="vertical-align:middle;">Parking <font color="red">*</font></th>
                                <td width="80%">
                                    <textarea name="${status.expression }" id="${status.expression }" style="width:100%; resize:none;"
                                              rows="4" placeholder="주차안내를 입력해주세요">${cinema.parking}</textarea>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.address">
                                <th scope="row" width="20%" style="vertical-align:middle;">Address <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" value="${cinema.address}" name="${status.expression }"
                                           id="${status.expression }" placeholder="주소를 입력해주세요">
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                    ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="cinema.mapAddress">
                                <th scope="row" width="20%" style="vertical-align:middle;">MapAddress <font color="red">*</font></th>
                                <td width="80%">
                                    <textarea name="${status.expression }" id="${status.expression }" style="width:100%; resize:none;"
                                              rows="9" placeholder="구글맵 주소를 입력해주세요">${cinema.mapAddress}</textarea>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
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