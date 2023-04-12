<%--
  Created by IntelliJ IDEA.
  User: 201712029@office.induk.ac.kr
  Date: 2021-07-23
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Charts</title>

    <c:import url="../main/header.jsp"/>

</head>

<body id="page-top" onload="chart('', '');">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Navigation -->
    <c:import url="../main/nav.jsp"/>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">영화별 매출</h1>

        <!-- Content Row -->
        <div class="row">

            <div class="col-xl-12 col-lg-7">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">검색</h6>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th scope="row" width="20%" style="vertical-align:middle;">시작 날짜</th>
                                <td width="30%">
                                    <input type="text" onchange="changeChart()" name="date1" autocomplete="off" id="datePicker3_1" class="form-control" placeholder="날짜를 입력해주세요"/>
                                </td>
                                <th scope="row" width="20%" style="vertical-align:middle;">끝 날짜</th>
                                <td width="30%">
                                    <input type="text" onchange="changeChart()" name="date2" autocomplete="off" id="datePicker3_2" class="form-control" placeholder="날짜를 입력해주세요"/>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>

            <div class="col-xl-8 col-lg-7">

                <!-- Bar Chart -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">영화별 매출 (막대)</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-bar">
                            <canvas id="myBarChart"></canvas>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">영화별 매출 (원)</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="chart-pie pt-4">
                            <canvas id="myPieChart"></canvas>
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
<c:import url="../main/footer.jsp"/>

<script>
    var myBarChart;
    var myPieChart;

    function chart(date1, date2) {
        $(function() {
            $.ajax({
                type: "post",
                url: "/csmovie/admin/chart/movies",
                data: {
                    date1: date1,
                    date2: date2
                },
                success: function(data) {
                    // barChart
                    // Set new default font family and font color to mimic Bootstrap's default styling
                    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                    Chart.defaults.global.defaultFontColor = '#858796';

                    function number_format(number, decimals, dec_point, thousands_sep) {
                        // *     example: number_format(1234.56, 2, ',', ' ');
                        // *     return: '1 234,56'
                        number = (number + '').replace(',', '').replace(' ', '');
                        var n = !isFinite(+number) ? 0 : +number,
                            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                            s = '',
                            toFixedFix = function(n, prec) {
                                var k = Math.pow(10, prec);
                                return '' + Math.round(n * k) / k;
                            };
                        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                        if (s[0].length > 3) {
                            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                        }
                        if ((s[1] || '').length < prec) {
                            s[1] = s[1] || '';
                            s[1] += new Array(prec - s[1].length + 1).join('0');
                        }
                        return s.join(dec);
                    }

                    // Bar Chart Example
                    var ctx = document.getElementById("myBarChart");
                    myBarChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: data.titles,
                            datasets: [{
                                label: "Revenue",
                                backgroundColor: "#4e73df",
                                hoverBackgroundColor: "#2e59d9",
                                borderColor: "#4e73df",
                                data: data.prices,
                            }],
                        },
                        options: {
                            maintainAspectRatio: false,
                            layout: {
                                padding: {
                                    left: 10,
                                    right: 25,
                                    top: 25,
                                    bottom: 0
                                }
                            },
                            scales: {
                                xAxes: [{
                                    time: {
                                        unit: 'month'
                                    },
                                    gridLines: {
                                        display: false,
                                        drawBorder: false
                                    },
                                    ticks: {
                                        maxTicksLimit: 12
                                    },
                                    maxBarThickness: 25,
                                }],
                                yAxes: [{
                                    ticks: {
                                        min: 0,
                                        max: Math.max.apply(null, data.prices),
                                        maxTicksLimit: 5,
                                        padding: 10,
                                        // Include a dollar sign in the ticks
                                        callback: function(value, index, values) {
                                            return number_format(value) + '원';
                                        }
                                    },
                                    gridLines: {
                                        color: "rgb(234, 236, 244)",
                                        zeroLineColor: "rgb(234, 236, 244)",
                                        drawBorder: false,
                                        borderDash: [2],
                                        zeroLineBorderDash: [2]
                                    }
                                }],
                            },
                            legend: {
                                display: false
                            },
                            tooltips: {
                                titleMarginBottom: 10,
                                titleFontColor: '#6e707e',
                                titleFontSize: 14,
                                backgroundColor: "rgb(255,255,255)",
                                bodyFontColor: "#858796",
                                borderColor: '#dddfeb',
                                borderWidth: 1,
                                xPadding: 15,
                                yPadding: 15,
                                displayColors: false,
                                caretPadding: 10,
                                callbacks: {
                                    label: function(tooltipItem, chart) {
                                        //var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                        return number_format(tooltipItem.yLabel) + ' 원';
                                    }
                                }
                            },
                        }
                    });


                    // Pie Chart
                    // Set new default font family and font color to mimic Bootstrap's default styling
                    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                    Chart.defaults.global.defaultFontColor = '#858796';

                    // Pie Chart Example
                    var ctx = document.getElementById("myPieChart");
                    myPieChart = new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: data.titles,
                            datasets: [{
                                data: data.prices,
                                backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#80ff80', '#804040', '#008040', '#8000ff', '#8080ff'],
                                hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#00ff00', '#800000', '#004040', '#400080', '#8080C0'],
                                hoverBorderColor: "rgba(234, 236, 244, 1)",
                            }],
                        },
                        options: {
                            maintainAspectRatio: false,
                            tooltips: {
                                backgroundColor: "rgb(255,255,255)",
                                bodyFontColor: "#858796",
                                borderColor: '#dddfeb',
                                borderWidth: 1,
                                xPadding: 15,
                                yPadding: 15,
                                displayColors: false,
                                caretPadding: 10,
                            },
                            legend: {
                                display: false
                            },
                            cutoutPercentage: 80,
                        },
                    });

                }
            });
        });
    }

    function changeChart() {
        let date1 = $('input[name=date1]').val();
        let date2 = $('input[name=date2]').val();

        if(date1 && date2) {
            myBarChart.destroy();
            myPieChart.destroy();
            chart(date1, date2);
        }
    }
</script>
</body>

</html>
