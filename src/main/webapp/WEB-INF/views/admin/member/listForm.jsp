<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <c:import url="../main/header.jsp" />

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="../main/nav.jsp" />
        <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/members"><i class="fas fa-user-friends"> Member DataTables</i></a>
                                <button type="submit" class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/members/add'">추가</button>
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th width="20%">Name</th>
                                            <th width="30%">Email</th>
                                            <th width="20%">Password</th>
                                            <th width="20%">Admin</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th width="20%">Name</th>
                                            <th width="30%">Email</th>
                                            <th width="20%">Password</th>
                                            <th width="20%">Admin</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="member" items="${members}">
                                        <tr>
                                            <td><a href="/csmovie/admin/members/${member.id}">${member.id}</a></td>
                                            <td>${member.name}</td>
                                            <td>${member.email}</td>
                                            <td>${member.password}</td>
                                            <td><c:out value="${member.admin == 1 ? '관리자' : '사용자'}" /></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <c:import url="../main/footer.jsp" />

</body>

</html>