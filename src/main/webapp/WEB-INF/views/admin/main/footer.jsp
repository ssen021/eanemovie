<%--
  Created by IntelliJ IDEA.
  User: 201712035@office.induk.ac.kr
  Date: 2021-06-30
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2021</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->


<!-- Bootstrap core JavaScript-->
<%--<script src="/csmovie/admin/vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="/csmovie/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<script src="/admin/vendor/jquery/jquery.min.js"></script>
<script src="/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<%--<script src="/csmovie/admin/vendor/jquery-easing/jquery.easing.min.js"></script>--%>
<script src="/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<%--<script src="/csmovie/admin/js/sb-admin-2.min.js"></script>--%>
<script src="/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<%--<script src="/csmovie/admin/vendor/chart.js/Chart.min.js"></script>--%>
<script src="/admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<%--<script src="/csmovie/admin/js/demo/chart-area-demo.js"></script>--%>
<%--<script src="/csmovie/admin/js/demo/chart-pie-demo.js"></script>--%>

<!-- Date Picker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

<!-- select2 css cdn -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css" rel="stylesheet" />
<!-- select2 javascript cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>

<!-- Page level plugins -->
<script src="/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/admin/js/demo/datatables-demo.js"></script>

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
                <a class="btn btn-primary" href="/csmovie/admin/members/logout">Logout</a>
            </div>
        </div>
    </div>
</div>



<script>
    $('#datePicker').datepicker({
        format : "yyyy-mm-dd",
        language : "kr",
        todayHighlight : true
    });

    $('#datePicker2').datepicker({
        minViewMode: 'years',
        format : "yyyy",
        language : "kr",
        todayHighlight : true
    });

    $('#datePicker3_1').datepicker({
        minViewMode: 'months',
        format : "yyyy-mm",
        language : "kr",
        todayHighlight : true
    });

    $('#datePicker3_2').datepicker({
        minViewMode: 'months',
        format : "yyyy-mm",
        language : "kr",
        todayHighlight : true
    });

    $(document).ready(function () {
        $("#select2").select2({
            theme: "bootstrap",
            width: null
        });

        $("#select2_1").select2({
            theme: "bootstrap",
            width: null
        });

        $("#select2_2").select2({
            theme: "bootstrap",
            width: null
        });
    });
    $(document).ready(function () {
        $("#select3").select2({
            theme: "bootstrap",
            width: null
        });
    });
</script>
