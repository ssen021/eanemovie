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

    <title>Event - Update Tables</title>

    <!-- Header -->
    <c:import url="../main/header.jsp" />

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
            <form method="post" action="/csmovie/admin/eventCodes/${eventCode.id}/edit" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-receipt"> EventCode Edit</i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/eventCodes/${eventCode.id}'"><i class="fas fa-undo"></i></a>
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
                                <input type="text" class="form-control" name="id" id="id" value="${eventCode.id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="eventCode.eventId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Event_id <font color="red">*</font></th>
                                <td width="80%">
                                    <select name="${status.expression}" id="${status.expression}" class="form-control">
                                        <c:forEach var="event" items="${events}">
                                            <c:choose>
                                                <c:when test="${event.id == eventCode.eventId}">
                                                    <option value="${event.id}" selected>[${event.id}] ${event.title}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${event.id}">[${event.id}] ${event.title}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCode.code">
                                <th scope="row" width="20%" style="vertical-align:middle;">Code <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression}"
                                              id="${status.expression }" value="${eventCode.code}" placeholder="코드를 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCode.issueDate">
                                <th scope="row" width="20%" style="vertical-align:middle;">Issue_date <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression}"
                                           id="datePicker" value="${eventCode.issueDate}" placeholder="발행 일을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCode.codeLimit">
                                <th scope="row" width="20%" style="vertical-align:middle;">Code_limit <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression}"
                                           id="datePicker" value="${eventCode.codeLimit}" placeholder="사용 기한을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="eventCode.discountRate">
                                <th scope="row" width="20%" style="vertical-align:middle;">Discount_rate <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="form-control" name="${status.expression}" value="${eventCode.discountRate}" placeholder="할인율을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Status <font color="red">*</font></th>
                            <td width="80%">
                                <c:choose>
                                    <c:when test="${eventCode.status == 0}">
                                        <input type="text" class="form-control" value="사용 가능" readonly>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" value="사용 불가능" readonly>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${status.error}">
                                    <div class="field-error">${status.errorMessage}</div>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Member_id <font color="red">*</font></th>
                            <td width="80%">
                                <c:choose>
                                    <c:when test="${eventCode.memberId == 0}">
                                        <input type="text" class="form-control" value="-" readonly>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" class="form-control" value="${eventCode.memberId}" readonly>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${status.error}">
                                    <div class="field-error">${status.errorMessage}</div>
                                </c:if>
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
