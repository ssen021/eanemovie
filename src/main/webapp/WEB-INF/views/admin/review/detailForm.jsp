<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.induk.cinema.domain.Review" %>
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
            <form name="updateForm" action="/csmovie/admin/reviews/${review.id}/edit" method="GET">
            </form>
            <form name="deleteForm" action="/csmovie/admin/reviews/${review.id}/del" method="POST">
                <input type="hidden" name="_method" value="delete" />
            </form>
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/reviews"><a href="/csmovie/admin/reviews"><i class="fas fa-leaf"> Review</i></a>
                    <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/reviews'"><i class="fas fa-undo"></i></a>
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
                            <input type="text" class="form-control" name="id" value="${review.id}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Movie_id</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="id" value="(${review.movie.id})${review.movie.title}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Member_id</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="" value="(${review.member.id})${review.member.name}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Title</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="title" value="${review.title}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Content <font color="red">*</font></th>
                        <td width="80%">
                            <textarea type="text" name="content"class="form-control" rows="9" disabled>${review.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">View</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="view" value="${review.view}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Subscription_date</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="subscription_date" value="${review.reportingDate}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Image</th>
                        <td width="80%">
                            <img src="/csmovie/admin/reviews/images/${review.image}" style="max-height: 200px;max-width: 100%">
                        </td>
                    </tr>
                    </tbody>
                </table>


                <div class="card shadow mb-4" style="margin-top: 50px">
                    <!-- Card Header - Accordion -->
                    <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                        <h6 class="m-0 font-weight-bold text-primary" style="text-align: center">댓글 목록</h6>
                    </a>
                    <!-- Card Content - Collapse -->
                    <div class="collapse show" id="collapseCardExample">
                        <div class="card-body">
                            <table class="table table-bordered"  width="100%" cellspacing="0">
                                <thead>
                                <tr style="text-align: center">
                                    <th width="20%">작성자</th>
                                    <th width="60%">댓글</th>
                                    <th width="20%">작성시간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${empty comments}">
                                    <tr align="center">
                                        <th scope="row" colspan="3" style="vertical-align:middle;color: red">댓글 없음...</th>
                                    </tr>
                                </c:if>
                                <c:forEach var="comment" items="${comments}">
                                    <tr>
                                        <td scope="row" width="20%" style="vertical-align:middle;">
                                            <a href="/csmovie/admin/comments/${comment.id}">(${comment.member.id}) ${comment.member.name}
                                        </td>
                                        <td width="60%">
                                            <input type="text" class="form-control" value="${comment.content}" disabled>
                                        </td>
                                        <td scope="row" width="20%" style="vertical-align:middle;">${comment.reportingDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


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