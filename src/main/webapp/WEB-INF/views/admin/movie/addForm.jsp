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
    </style>
</head>

<body id="page-top" onload="javascript:checkBox();">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Navigation -->
    <c:import url="../main/nav.jsp" />

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <form method="post" action="/csmovie/admin/movies/add" enctype="multipart/form-data">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary"><i class="fas fa-film"> Movie</i>
                        <a href='#' class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/movies'"><i class="fas fa-undo"></i></a>
                        <span class="float-right">&nbsp;</span>
                        <button class="btn btn-primary float-right"><i class="fas fa-check"></i></button>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <tbody>
                        <tr>
                            <th scope="row" width="20%" style="vertical-align:middle;">Poster </th>
                            <td width="80%">
                                <input type="file" class="form-control" name="imageFile" id="imageFile" accept="image/*">
                            </td>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.title">
                                <th scope="row" width="20%" style="vertical-align:middle;">Title <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }" value="${status.value}" placeholder="제목을 입력해 주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.summary">
                                <th scope="row" width="20%" style="vertical-align:middle;">Summary <font color="red">*</font></th>
                                <td width="80%">
                                    <textarea class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }" rows="5" placeholder="소개를 입력해 주세요">${status.value}</textarea>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.directorId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Director <font color="red">*</font></th>
                                <td width="80%">
                                    <select class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="select2">
                                        <option value="">==감독 선택==</option>
                                        <c:forEach var="director" items="${directors}">
                                            <c:choose>
                                                <c:when test="${status.value == director.id}">
                                                    <option value="${director.id}" selected>${director.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${director.id}">${director.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.genreId">
                                <th scope="row" width="20%" style="vertical-align:middle;">Genre <font color="red">*</font></th>
                                <td width="80%">
                                    <select class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }">
                                        <option value="">==장르 선택==</option>
                                        <c:forEach var="genre" items="${genres}">
                                            <c:choose>
                                                <c:when test="${status.value == genre.id}">
                                                    <option value="${genre.id}" selected>${genre.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${genre.id}">${genre.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.language">
                                <th scope="row" width="20%" style="vertical-align:middle;">Language <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }" value="${status.value}" placeholder="언어를 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.releaseDate">
                                <th scope="row" width="20%" style="vertical-align:middle;">ReleaseDate <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="text" autocomplete="off" id="datePicker" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" value="${status.value}" placeholder="개봉일을 입력해주세요">
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.showTimes">
                                <th scope="row" width="20%" style="vertical-align:middle;">ShowTimes <font color="red">*</font></th>
                                <td width="80%">
                                    <input type="number" class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }" value="${status.value}" placeholder="상영 시간을 입력해주세요." >
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.rating">
                                <th scope="row" width="20%" style="vertical-align:middle;">Rating <font color="red">*</font></th>
                                <td width="80%">
                                    <select class="${status.error ? "form-control field-error" : "form-control"}" name="${status.expression}" id="${status.expression }">
                                        <option value="">==상영 등급 선택==</option>
                                        <c:forEach var="rating" items="${ratings}">
                                            <c:choose>
                                                <c:when test="${status.value eq rating.rating}">
                                                    <option value="${rating.rating}" selected>${rating.rating}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${rating.rating}">${rating.rating}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
                                </td>
                            </spring:bind>
                        </tr>
                        <tr>
                            <spring:bind path="movieForm.screeningFormats">
                                <script>
                                    function checkBox() {
                                        $("input[name='screeningFormats']").each(function(){
                                            <c:forEach var="f" items="${status.actualValue}" >
                                            var f = "<c:out value="${f}"/>";
                                            if(this.value == f) {
                                                this.checked = true;
                                            }
                                            </c:forEach>
                                        });
                                    }
                                </script>

                                <th scope="row" width="20%" style="vertical-align:middle;">Format <font color="red">*</font></th>
                                <td width="80%">
                                    <div class="form-check form-check-inline">
                                        <c:forEach var="format" items="${formats}">
                                            <label class="${status.error ? "form-check-label field-error" : "form-check-label"}">
                                                <input type="checkbox" name="${status.expression}" id="${status.expression}"
                                                       value="${format.format}" class="form-check-input">${format.format} &nbsp;&nbsp;
                                            </label>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${status.error}">
                                        <div class="field-error">${status.errorMessage}</div>
                                    </c:if>
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
