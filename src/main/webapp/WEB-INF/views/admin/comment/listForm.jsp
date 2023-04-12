<%@ page import="com.induk.cinema.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
                            <h4 class="m-0 font-weight-bold text-primary"><a href="/csmovie/admin/comments"><i class="fas fa-comments"> Comment DataTables</i></a>
                                <button type="submit" class="btn btn-primary float-right" onclick="location.href='/csmovie/admin/comments/add'">추가</button>
                            </h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th width="18%">Review_id</th>
                                            <th width="18%">Member_id</th>
                                            <th width="35%">Content</th>
                                            <th width="19%">reporting_date</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th width="18%">Review_id</th>
                                            <th width="18%">Member_id</th>
                                            <th width="35%">Content</th>
                                            <th width="19%">reporting_date</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%
                                        List<Comment> comments =  (List<Comment>)request.getAttribute("comments");
                                        for (Comment comment : comments){
                                            String subscriptionDate = comment.getReportingDate().substring(0,10);
                                            String content = (comment.getContent().length() > 20)? comment.getContent().substring(0,20) + "..."
                                                    : comment.getContent();
                                    %>
                                        <tr>
                                            <td><a href="/csmovie/admin/comments/<%=comment.getId()%>"><%=comment.getId()%></a></td>
                                            <td>(<%=comment.getReview().getId()%>) <%=comment.getReview().getTitle()%></td>
                                            <td>(<%=comment.getMember().getId()%>) <%=comment.getMember().getName()%></td>
                                            <td><%=content%></td>
                                            <td><%=subscriptionDate%></td>
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