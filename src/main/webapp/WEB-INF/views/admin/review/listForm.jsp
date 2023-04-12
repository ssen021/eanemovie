<%@ page import="com.induk.cinema.domain.Review" %>
<%@ page import="java.util.List" %>
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
                            <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/reviews"><i class="fas fa-leaf"> Review DataTables</i></a>
                                <button type="submit" class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/reviews/add'">추가</button>
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="7%">ID</th>
                                            <th width="14%">Movie_id</th>
                                            <th width="14%">Member_id</th>
                                            <th width="20%">Title</th>
                                            <th width="35%">Content</th>
                                            <th width="10%">View</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th width="7%">ID</th>
                                            <th width="14%">Movie_id</th>
                                            <th width="14%">Member_id</th>
                                            <th width="20%">Title</th>
                                            <th width="35%">Content</th>
                                            <th width="10%">View</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%
                                        List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                                        for(Review review : reviews){
                                            String content = review.getContent();
                                            content = (content.length() > 20)? content.substring(0,20) + "..."  : content;
                                    %>
                                        <tr>
                                            <td><a href="/csmovie/admin/reviews/<%=review.getId()%>"><%=review.getId()%></a></td>
                                            <td>(<%=review.getMovie().getId()%>)<%=review.getMovie().getTitle()%></td>
                                            <td>(<%=review.getMember().getId()%>)<%=review.getMember().getName()%></td>
                                            <td><%=review.getTitle()%></td>
                                            <td><%=content%></td>
                                            <td><%=review.getView()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
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