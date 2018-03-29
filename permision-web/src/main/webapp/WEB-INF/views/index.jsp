<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="common/taglib.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <!-- HEAD开始 -->
    <head>
        <base href="<%=basePath%>">
        <jsp:include page="common/head.jsp"></jsp:include>
    </head>
    <!-- HEAD结束 -->
	<jsp:include page="common/top.jsp"/>
    <!-- BODY开始 -->
    <body class="page-header-fixed">
        <div class="clearfix"></div>
        <!-- CONTAINER开始 -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <jsp:include page="common/left.jsp"/>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                    <h4 class="modal-title">Modal title</h4>
                                </div>
                                <div class="modal-body">
                                    Widget settings form goes here
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn blue">
                                        Save changes
                                    </button>
                                    <button type="button" class="btn default" data-dismiss="modal">
                                        Close
                                    </button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                    <!-- BEGIN STYLE CUSTOMIZER -->
                    <jsp:include page="common/settings.jsp"/>
                    <!-- END STYLE CUSTOMIZER -->

                    <!-- BEGIN PAGE HEADER-->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                            <h3 class="page-title" id="index-page-title">Dashboard</h3>
                            <ul class="page-breadcrumb breadcrumb">
                                <li>
                                    <i class="fa fa-home"></i>
                                    <a href="javascript:;">
                                        首页
                                    </a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        Dashboard
                                    </a>
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->

                    <!-- BEGIN DASHBOARD STATS -->
                    <div id="main-content"></div>

                    <!-- END PORTLET-->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- CONTAINER结束-->
        <!-- BEGIN FOOTER -->
        <jsp:include page="common/footer.jsp"/>
        <!-- end FOOTER -->
        <jsp:include page="common/bottom.jsp"/>
    </body>
</html>