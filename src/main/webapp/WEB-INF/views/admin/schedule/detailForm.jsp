<%@ page import="com.induk.cinema.domain.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <form name="updateForm" action="/csmovie/admin/schedules/update/${schedule.id}" method="GET">
            </form>
            <form name="deleteForm" action="/csmovie/admin/schedules/del/${schedule.id}" method="POST">
                <input type="hidden" name="_method" value="delete" />
            </form>
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-calendar-week"><a href="/csmovie/admin/schedules" style="text-decoration:none"> Schedule</a></i>
                    <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/schedules'"><i class="fas fa-undo"></i></a>
                    <span class="float-right">&nbsp;</span>
                    <a class="btn btn-primary float-right" href="#"
                       onclick="javascript:del();"><i class="fas fa-trash-alt"></i></a>
                    <span class="float-right">&nbsp;</span>
                    <a class="btn btn-primary float-right" href="#"
                       onclick="javascript:document.updateForm.submit();"><i class="fas fa-pen"></i></a>
                </h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                    <tbody>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">ID</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="id" value="${schedule.id}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Movie</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="movie" value="${schedule.scheduleForm.movie_title}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Theater</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="theater" value="${schedule.scheduleForm.cinema_name}/${schedule.scheduleForm.theater_name}" disabled>
                        </td>
                    </tr>
                    <c:set var="start_time" value="${schedule.start_time}"/>
                    <%
                        String start_time = (String)pageContext.getAttribute("start_time");
                        start_time = start_time.substring(0,5);
                        pageContext.setAttribute("start_time", start_time) ;
                    %>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Start_Time</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="start_time" value="${start_time}" disabled>
                        </td>
                    </tr>
                    <c:set var="end_time" value="${schedule.end_time}"/>
                    <%
                        String end_time = (String)pageContext.getAttribute("end_time");
                        end_time = end_time.substring(0,5);
                        pageContext.setAttribute("end_time", end_time) ;
                    %>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">End_Time</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="end_time" value="${end_time}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Screening_date</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="screening_date" value="${schedule.screening_date}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Screening_Format</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="screening_format" value="${schedule.screening_format}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Price</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="price" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${schedule.price}"/>원" disabled>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
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