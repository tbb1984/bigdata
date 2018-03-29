<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu" id="page-sidebar-menu">
            <li class="sidebar-toggler-wrapper">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler hidden-phone"></div>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            </li>

            <li class="start active">
                <a href="rest/page/dashboard" id="btn-dashboard">
                    <i class="fa fa-home"></i><span class="title"> 首页 </span><span
                    class="selected"> </span>
                </a>
            </li>

            <li class="" style="display:none;">
                <a href="javascript:;">
                    <i class="fa fa-gears"></i><span class="title"> 系统管理 </span><span
                    class="arrow "> </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;">
                            	用户管理
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            	角色管理
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            	权限管理
                        </a>
                    </li>
                </ul>
            </li>

            <li class="" style="display:none;">
                <a href="javascript:;">
                    <i class="fa fa-user"></i><span class="title"> 个人中心 </span><span
                    class="arrow "> </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;">
                           	 信息修改
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            	密码修改
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="">
                <a href="javascript:;">
                    <i class="fa fa-gears"></i><span class="title"> 权限控制说明 </span><span
                    class="arrow "> </span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="${ctx }/rest/permission/checkfront">
                           	控制说明-前台标签
                        </a>
                    </li>
                    <li>
                        <a href="${ctx }/rest/permission/checkbackstage">
                           	控制说明-后台注解
                        </a>
                    </li>

                </ul>
            </li>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>