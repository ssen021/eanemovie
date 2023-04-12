<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-06-30
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Custom fonts for this template-->
<%--<link href="/csmovie/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
<link href="/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template-->
<%--<link href="/csmovie/admin/css/sb-admin-2.min.css" rel="stylesheet">--%>
<link href="/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script>
    function del() {
        var con_test = confirm("삭제할까요 ?");
        if (con_test == true) {
            document.deleteForm.submit();
        } else if (con_test == false) {
            return 0;
        }
    }
</script>