<%--
  Created by IntelliJ IDEA.
  User: 201712029@office.induk.ac.kr
  Date: 2021-07-01
  Time: 오후 10:08
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
    <script>
        function radioCheck() {
            if ($("input[name=kind]:checked").val() == 'image') {
                $("input:text[name=video]").attr("disabled", true);
                $("input:file[name=imageFiles]").attr("disabled", false);
            } else if ($("input[name=kind]:checked").val() == 'video') {
                $("input:text[name=video]").attr("disabled", false);
                $("input:file[name=imageFiles]").attr("disabled", true);
            }

            $(document).ready(function() {
                $("input:radio[name=kind]").click(function() {
                    if($("input[name=kind]:checked").val() == 'image') {
                        $("input:text[name=video]").attr("disabled", true);
                        $("input:file[name=imageFiles]").attr("disabled", false);
                    } else if($("input[name=kind]:checked").val() == 'video') {
                        $("input:text[name=video]").attr("disabled", false);
                        $("input:file[name=imageFiles]").attr("disabled", true);
                    }
                });
            });
        }
    </script>
</head>

<body id="page-top" onload="javascript:radioCheck();">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Navigation -->
    <c:import url="../main/nav.jsp" />

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <form method="post" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-images"> Movie AD</i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/movie_ad?movieId=${param.get("movieId")}'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Title </th>
                            <td width="80%">
                                <input type="text" class="form-control" name="title" id="title" value="${movie.title}" readonly>
                                <input type="hidden" name="movieId" id="movieId" value="${movie.id}">
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="movieAdForm.imageFiles">
                                <th scope="row" width="20%" style="vertical-align:middle;">Images</th>
                                <td width="80%">
                                    <input type="file" multiple="multiple" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }" value="${status.value}">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieAdForm.video">
                                <th scope="row" width="20%" style="vertical-align:middle;">Video </th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression}" disabled>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieAdForm.kind">
                                <th scope="row" width="20%" style="vertical-align:middle;">Title </th>
                                <td width="80%">
                                    <c:choose>
                                        <c:when test="${status.value eq 'video'}">
                                            <input type="radio" name="kind" id="k1" value="image">
                                            <label for="k1">사진</label>
                                            <input type="radio" name="kind" id="k2" value="video" checked="checked">
                                            <label for="k2">동영상</label>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="radio" name="kind" id="k1" value="image" checked="checked">
                                            <label for="k1">사진</label>
                                            <input type="radio" name="kind" id="k2" value="video">
                                            <label for="k2">동영상</label>
                                        </c:otherwise>
                                    </c:choose>
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
