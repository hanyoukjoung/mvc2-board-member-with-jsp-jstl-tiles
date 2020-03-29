<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Charts | Charts</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="/styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/animate.css">
    <link type="text/css" rel="stylesheet" href="/styles/all.css">
    <link type="text/css" rel="stylesheet" href="/styles/main.css">
    <link type="text/css" rel="stylesheet" href="/styles/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="/styles/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="/styles/pace.css">
    <link type="text/css" rel="stylesheet" href="/styles/jquery.news-ticker.css">
<script type="text/javascript">
function loading(){
	$('#pieBody').find('.legendLabel').eq(0).text('10대')
	$('#pieBody').find('.legendLabel').eq(1).text('20대');
	$('#pieBody').find('.legendLabel').eq(2).text('30대');
	
	$('#areaBody').find('.legendLabel').eq(0).text('자유 게시판');
	$('#areaBody').find('.legendLabel').eq(1).text('썸네일 게시판');
	
	$('#pieLabel0').text('10대');
	$('#pieLabel1').text('20대');
	$('#pieLabel2').text('30대');
}
</script>
</head>
<body onload="loading();">
        <!--BEGIN THEME SETTING-->
        <!--END THEME SETTING-->
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <!--BEGIN TOPBAR-->
        <!--END TOPBAR-->
            <!--BEGIN SIDEBAR MENU-->
<!--             <div id="page-wrapper"> -->
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
                <div class="page-content" style="text-align:center; margin:auto;">
                    <div id="tab-general">
                        <div class="row mbl">
                            <div class="col-lg-12">
                                
                                            <div class="col-md-6">
                                                <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
                                                </div>
                                            </div>
                                
                            </div>

                            <div class="col-lg-12">
                              
                                    
                              <div class="row">
                    <div class="col-lg-6">
                        <div class="portlet box" id="LineChart">
                            <div class="portlet-header">
                                <div class="caption">Line Chart</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body">
                                <div id="line-chart" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                        <div class="portlet box" id="BarChart">
                            <div class="portlet-header" >
                                <div class="caption">Bar Chart</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body">
                                <div id="bar-chart" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
<!--                         <div class="portlet box" id="AreaChart"> -->
<!--                             <div class="portlet-header" > -->
<!--                                 <div class="caption">Area Chart</div> -->
<!--                                 <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div> -->
<!--                             </div> -->
<!--                             <div class="portlet-body"> -->
<!--                                 <div id="area-chart" style="width: 100%; height:300px"></div> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="portlet box" id="PieChart">
                            <div class="portlet-header" >
                                <div class="caption">회원 연령 분포</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body" id="pieBody">
                                <div id="pie-chart" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="portlet box" id="LineChartSpline">
                            <div class="portlet-header">
                                <div class="caption">Line Chart - Spline</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body">
                                <div id="line-chart-spline" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                        <div class="portlet box" id="BarChartStack">
                            <div class="portlet-header">
                                <div class="caption">Bar Chart - Stack</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body"><h4 class="block-heading">Bar Chart - Stack</h4>

                                <div id="bar-chart-stack" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                        <div class="portlet box" id="AreaChartSpline">
                            <div class="portlet-header">
                                <div class="caption">Area Chart - Spline</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body">
                                <div id="Div1" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                        <div class="portlet box" id="AreaChart">
                            <div class="portlet-header" >
                                <div class="caption">JOH Project 이용률 추이</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body" id="areaBody">
                                <div id="area-chart" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                        <div class="portlet box" id="PercentilesChart">
                            <div class="portlet-header">
                                <div class="caption">Percentiles Chart</div>
                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
                            </div>
                            <div class="portlet-body">
                                <div id="percentiles-chart" style="width: 100%; height:300px"></div>
                            </div>
                        </div>
                    </div>
                </div>
                 
                 


                              
                                </div>
                                
                            
                     
                            
                        </div>
                    </div>
                </div>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="http://themifycloud.com">2014 © KAdmin Responsive Multi-Purpose Template</a></div>
                </div>
                <!--END FOOTER-->
<!--             </div> -->
            <!--END PAGE WRAPPER-->
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="/script/jquery-ui.js"></script>
    <script src="/script/bootstrap.min.js"></script>
    <script src="/script/bootstrap-hover-dropdown.js"></script>
    <script src="/script/html5shiv.js"></script>
    <script src="/script/respond.min.js"></script>
    <script src="/script/jquery.metisMenu.js"></script>
    <script src="/script/jquery.slimscroll.js"></script>
    <script src="/script/jquery.cookie.js"></script>
    <script src="/script/icheck.min.js"></script>
    <script src="/script/custom.min.js"></script>
    <script src="/script/jquery.news-ticker.js"></script>
    <script src="/script/jquery.menu.js"></script>
    <script src="/script/pace.min.js"></script>
    <script src="/script/holder.js"></script>
    <script src="/script/responsive-tabs.js"></script>
    <script src="/script/jquery.flot.js"></script>
    <script src="/script/jquery.flot.categories.js"></script>
    <script src="/script/jquery.flot.pie.js"></script>
    <script src="/script/jquery.flot.tooltip.js"></script>
    <script src="/script/jquery.flot.resize.js"></script>
    <script src="/script/jquery.flot.fillbetween.js"></script>
    <script src="/script/jquery.flot.stack.js"></script>
    <script src="/script/jquery.flot.spline.js"></script>
    <script src="/script/zabuto_calendar.min.js"></script>

    <script src="/script/index.js"></script>
    <!--LOADING SCRIPTS FOR CHARTS-->
    <script src="/script/highcharts.js"></script>
    <script src="/script/data.js"></script>
    <script src="/script/drilldown.js"></script>
    <script src="/script/exporting.js"></script>
    <script src="/script/highcharts-more.js"></script>
    <script src="/script/charts-highchart-pie.js"></script>
    <script src="/script/charts-highchart-more.js"></script>
    <script src="/script/charts-flotchart.js"></script>
    <!--CORE JAVASCRIPT-->
    <script src="/script/main.js"></script>
    <script>        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');


</script>
<script type="text/javascript">
	$(function(){
		$('#LineChart').hide();
		$('#LineChartSpline').hide();
		$('#BarChart').hide();
		$('#BarChartStack').hide();
// 		$('#AreaChart').hide();
		$('#AreaChartSpline').hide();
// 		$('#PieChart').hide();
		$('#PercentilesChart').hide();
	});
</script>
</body>
</html>