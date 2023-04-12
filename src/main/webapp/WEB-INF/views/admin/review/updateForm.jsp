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
            <form method="post" action="/csmovie/admin/reviews/${review.id}/edit" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/reviews"><i class="fas fa-leaf"> Review</i></a>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/reviews/${review.id}'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">ID</th>
                            <td width="80%">
                                <input type="text" class="form-control" name="id" value="${review.id}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="review.movieId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Movie_id <font color="red">*</font></th>
                                <td width="80%">
                                    <select name="${status.expression}" id="select2" class="form-control">
                                        <c:forEach var="movie" items="${movies}">
                                            <c:choose>
                                                <c:when test="${movie.id == review.movieId}">
                                                    <option value="${movie.id}" selected>(${movie.id})${movie.title}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${movie.id}">(${movie.id})${movie.title}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="review.memberId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Member_id <font color="red">*</font></th>
                                <td width="80%">
                                    <select name="${status.expression}" id="select3" class="form-control">
                                        <c:forEach var="member" items="${members}">
                                            <c:choose>
                                                <c:when test="${member.id == review.memberId}">
                                                    <option value="${member.id}" selected>(${member.id}) ${member.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${member.id}">(${member.id}) ${member.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <!-- 해당 속성의 오류 message를 출력 -->
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="review.title">
                                <th scope="row" width="20%" style="vertical-align:middle;">Title <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" name="${status.expression}" id="${status.expression}" value="${status.value}" class="form-control" placeholder="제목을 입력해주세요">
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="review.content">
                                <th scope="row" width="20%" style="vertical-align:middle;">Content <font color="red">*</font></th>
                                <td width="80%">
                                    <textarea type="text" name="${status.expression}" id="${status.expression}" class="form-control" rows="9" placeholder="내용을 입력해주세요">${status.value}</textarea>
                                        ${status.errorMessage }
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">View</th>
                            <td width="80%">
                                <input type="text" class="form-control" name="view" value="${review.view}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Subscription_date</th>
                            <td width="80%">
                                <input type="text" class="form-control" name="subscription_date" value="${review.reportingDate}" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Image <font color="red">*</font></th>
                            <td width="80%">
                                <input multiple="multiple" type="file" name="imageForm" style="width: 100%"/>
                                <br><br><img src="/csmovie/admin/reviews/images/${review.image}" style="max-height: 200px;max-width: 100%">
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