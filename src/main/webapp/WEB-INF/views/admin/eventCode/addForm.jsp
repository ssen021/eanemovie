<%@ page import="com.induk.cinema.domain.EventCode" %>
<%@ page import="com.induk.cinema.domain.Event" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Event - Add Table</title>

    <!-- Header -->
    <c:import url="../main/header.jsp" />

    <style>
        .field-error {
            border-color: #dc3545;
            color: #dc3545;
        }
    </style>
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
            <form method="post" action="/csmovie/admin/eventCodes/add" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-receipt"> EventCode Add</i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/eventCodes'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <spring:bind path="eventCodeForm.event_id">
                                <th scope="row" width="20%" style="vertical-align:middle;">Event_id <font color="red">*</font></th>
                                <td width="80%">
                                    <select name="${status.expression}" id="${status.expression}" class="form-control">
                                        <option value="" selected>이벤트를 선택해주세요</option>
                                        <c:forEach var="event" items="${events}">
                                            <option value="${event.id}">[${event.id}] ${event.title}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCodeForm.code">
                                <th scope="row" width="20%" style="vertical-align:middle;">Code <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}"
                                           id="${status.expression }" placeholder="코드를 입력해주세요"></textarea>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCodeForm.issue_date">
                                <th scope="row" width="20%" style="vertical-align:middle;">Issue_date <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="datePicker" value="${status.value}" placeholder="발급 일을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCodeForm.code_limit">
                                <th scope="row" width="20%" style="vertical-align:middle;">code_limit <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="datePicker" value="${status.value}" placeholder="사용 기한를 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCodeForm.discount_rate">
                                <th scope="row" width="20%" style="vertical-align:middle;">Discount_rate <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression}" value="${status.value}" placeholder="할인율을 입력해주세요">
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