<%@ page import="java.util.*" %>
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

    <title>Event - Detail Tables</title>

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
            <form name="updateForm" action="/csmovie/admin/eventCodes/${eventCode.id}/edit" method="GET">
            </form>
            <form name="deleteForm" action="/csmovie/admin/eventCodes/${eventCode.id}/delete" method="GET">
            </form>
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-receipt"> Event Detail</i>
                    <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/eventCodes'"><i class="fas fa-undo"></i></a>
                    <span class="float-right">&nbsp;</span>
                    <a class="btn btn-primary float-right" href="#"
                       onclick="javascript:confirm('삭제할까요 ?'); document.deleteForm.submit();"><i class="fas fa-trash-alt"></i></a>
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
                            <input type="text" class="form-control" name="id" value="${eventCode.id}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Event_id</th>
                        <td width="80%">
                            <c:forEach var="event" items="${events}">
                                <c:if test="${event.id == eventCode.eventId}">
                                    <input type="text" class="form-control" name="" value="[${event.id}] ${event.title}" readonly>
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Code</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="code"  value="${eventCode.code}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Issue_date</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="issue_date" value="${eventCode.issueDate}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Code_limit</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="code_limit" value="${eventCode.codeLimit}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Discount_rate</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="discount_rate" value="${eventCode.discountRate}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Status</th>
                        <td width="80%">
                            <c:choose>
                                <c:when test="${eventCode.status == 0}">
                                    <input type="text" class="form-control" value="사용 가능" readonly>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="form-control" value="사용 불가능" readonly>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Member_id</th>
                        <td width="80%">
                            <c:choose>
                                <c:when test="${eventCode.memberId == 0}">
                                    <input type="text" class="form-control" value="-" readonly>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" class="form-control" value="[${eventCode.memberId}]${memberName}" readonly>
                                </c:otherwise>
                            </c:choose>
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
