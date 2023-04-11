<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.induk.cinema.domain.Member" %>
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
            <form name="updateForm" action="/csmovie/admin/members/${member.id}/edit" method="GET">
            </form>
            <form name="deleteForm" action="/csmovie/admin/members/${member.id}/del" method="POST">
                <input type="hidden" name="_method" value="delete" />
            </form>
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/members"><i class="fas fa-user-friends"> Member</i></a>
                    <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/members'"><i class="fas fa-undo"></i></a>
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
                        <th scope="row" width="20%" style="vertical-align:middle;">ID <font color="red">*</font></th>
                        <td width="80%">
                            <input type="text" class="form-control" value="${member.id}" name="id" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Name</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="name" value="${member.name}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Email</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="email" value="${member.email}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">password</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="password" value="${member.password}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Address</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="address" value="${member.address}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Subscription_date</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="subscription_date" value="${member.subscriptionDate}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Admin</th>
                        <td width="80%">
                            <input type="text" class="form-control" name="admin" value="${member.admin == 1 ? '관리자' : '사용자'}" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" width="20%" style="vertical-align:middle;">Image</th>
                        <td width="80%">
                            <c:if test="${not empty member.image}">
                                <img src="/csmovie/admin/members/images/${member.image}" style="max-height: 200px">
                            </c:if>
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