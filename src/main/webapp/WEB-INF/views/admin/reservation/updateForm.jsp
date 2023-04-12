<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: 201712029@office.induk.ac.kr
  Date: 2021-07-02
  Time: 오전 3:06
  To change this template use File | Settings | File Templates.
--%>
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
    <%
        NumberFormat nf = NumberFormat.getNumberInstance();
        pageContext.setAttribute("nf", nf);
    %>

    <style>
        .field-error {
            border-color: #dc3545;
            color: #dc3545;
        }

        img {
            max-width: 100%;
            height: auto;
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
            <form method="post" action="/csmovie/admin/reservations/${reservation.id}/edit" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="far fa-check-square"> Reservation</i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/reservations/${reservation.id}'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">ID
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" name="id" id="id" value="${reservation.id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Cinema
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" name="cinemaName" id="cinemaName" value="${reservation.cinemaName}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Theater
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" name="theaterName" id="theaterName" value="${reservation.theaterName}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Seat
                            </th>
                            <td width="80%">
                                <c:forEach var="seat" items="${reservation.seatList}">
                                    <c:set var="seats" value="${seats += seat.number += ' '}" />
                                </c:forEach>
                                <input type="text" class="form-control" name="theaterName" id="theaterName" value="${seats}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Screening Date
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.screeningDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Screening Format
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.screeningFormat}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Movie
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.movieTitle}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Member
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.memberName}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Reservation Date
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.date}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Adult
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.adult}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Youth
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.youth}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Payment method
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${reservation.method}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Price
                            </th>
                            <td width="80%">
                                <input type="text" class="form-control" value="${nf.format(reservation.price)}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Status
                            </th>
                            <td width="80%">
                                <select class="form-control" name="status" id="status">
                                    <c:choose>
                                        <c:when test="${reservation.status == 1}">
                                            <option value="1" selected>예매 완료</option>
                                            <option value="0">예매 취소</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">예매 완료</option>
                                            <option value="0"selected>예매 취소</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
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
