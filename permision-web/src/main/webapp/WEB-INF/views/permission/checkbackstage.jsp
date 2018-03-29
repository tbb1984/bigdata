<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="shiro" uri="http://myshiro.apache.org/tags" %>
<link href="assets/css/table.css" rel="stylesheet" type="text/css" />
<style>
<!--
label{
	color:blue;
}
.lh{
	color:red;
}
a{
	text-decoration: none;
	cursor: pointer;
}
-->
</style>

<table id="mytable" summary="The technical specifications of the Apple PowerMac G5 series" cellspacing="0"> 
<tbody>
  <tr> 
<!--     <th scope="col" abbr="Configurations" class="nobg">标签名称</th>  -->
	<th scope="col" abbr="Configurations">注解名称</th>
    <th scope="col" abbr="Dual 2">举例</th> 
    <th scope="col" abbr="Dual 1.8">说明</th> 
    <th scope="col" abbr="Dual 2.5" width="10%">操作</th> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="Model" class="spec">RequiresAuthentication</th>
    <td>
    @RequiresAuthentication<br>
    public String checkRequiresAuthentication(){……}</td> 
    <td>验证用户是否登录，等同于方法subject.isAuthenticated() 结果为true时</td> 
    <td><a onclick="check('checkRequiresAuthentication')">测试</a></td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="Model" class="spec">RequiresUser</th> 
    <td>
    @RequiresUser<br>
    public String checkRequiresUser(){……}</td>
    <td>
    验证用户是否被记忆，user有两种含义：<br>
    一种是成功登录的（subject.isAuthenticated() 结果为true）;<br>
    另外一种是被记忆的（subject.isRemembered()结果为true）。
    </td> 
    <td><a onclick="check('checkRequiresUser')">测试</a></td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="G5 Processor" class="specalt">RequiresGuest</th> 
    <td class="alt">
    @RequiresGuests<br>
    public String checkRequiresGuest(){……}</td> 
    <td class="alt">
    验证是否是一个guest的请求，与@RequiresUser完全相反。<br>
    换言之，RequiresUser  == !RequiresGuest。<br>
    此时subject.getPrincipal() 结果为null.<br></td> 
    <td class="alt"><a onclick="check('checkRequiresGuest')">测试</a></td> 
  </tr> 
  
  <tr> 
    <th scope="row" abbr="G5 Processor"  rowspan="3" class="specalt">RequiresRoles</th> 
    <td class="alt">
    @RequiresRoles(value = RoleSign.ADMIN)<br>
    public String checkRequiresRoles(){……}</td> 
    <td class="alt">如果subject中有admin角色才可以访问方法checkRequiresRoles()。如果没有这个权限则会抛出异常AuthorizationException</td> 
    <td class="alt"><a onclick="check('checkRequiresRoles')">测试</a></td> 
  </tr> 
  <tr> 
    <td class="alt">
    @RequiresRoles(value={"admin","normal"},logical=Logical.AND)<br>
    public String checkRequiresRolesAnd(){……}</td> 
    <td class="alt">如果subject中有admin<font class="lh">和</font>normal角色才可以访问方法checkRequiresRolesAnd()。如果没有这个权限则会抛出异常AuthorizationException</td> 
    <td class="alt"><a onclick="check('checkRequiresRolesAnd')">测试</a></td> 
  </tr> 
  <tr> 
    <td class="alt">
    @RequiresRoles(value={"admin","normal"},logical=Logical.OR) <br>
    public String checkRequiresRolesOr(){……}</td> 
    <td class="alt">如果subject中有admin<font class="lh">或</font>normal角色才可以访问方法checkRequiresRolesOr()。如果没有这个权限则会抛出异常AuthorizationException</td> 
    <td class="alt"><a onclick="check('checkRequiresRolesOr')">测试</a></td> 
  </tr> 
   
   <tr> 
    <th scope="row" abbr="Model" class="spec" rowspan="3">RequiresPermissions</th> 
    <td>
    @RequiresPermissions(value = PermissionSign.USER_CREATE)<br>
    public String checkRequiresPermissions(){……}</td> 
    <td>要求subject中必须含有user:create的权限才能执行方法checkRequiresPermissions()。否则抛出异常AuthorizationException</td> 
    <td><a onclick="check('checkRequiresPermissions')">测试</a></td> 
  </tr>
  <tr> 
    <td>
    @RequiresPermissions(value = {PermissionSign.USER_CREATE,PermissionSign.USER_DELETE},logical=Logical.AND)<br>
    public String checkRequiresPermissionsAnd(){……}</td> 
    <td>要求subject中必须同时含有user:create<font class="lh">和</font>user:delete的权限才能执行方法checkRequiresPermissionsAnd()。否则抛出异常AuthorizationException。</td> 
    <td><a onclick="check('checkRequiresPermissionsAnd')">测试</a></td> 
  </tr>
  <tr> 
    <td>
    @RequiresPermissions(value = {PermissionSign.USER_CREATE,PermissionSign.USER_DELETE},logical=Logical.OR)<br>
    public String checkRequiresPermissionsOr(){……}</td> 
    <td>要求subject中必须含有user:create<font class="lh">或</font>user:delete的权限才能执行方法checkRequiresPermissionsOr()。否则抛出异常AuthorizationException。</td> 
    <td><a onclick="check('checkRequiresPermissionsOr')">测试</a></td> 
  </tr>
</table>
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function check(uri){
	$.ajax({
		url: "${ctx}/rest/permission/"+uri,
	      global: false,
	      type: "post",
	      //data: ({id : this.getattribute('id')}),
	      datatype: "html",
	      async:false,
	      success: function(msg){
	         alert(msg);
	      },
	      error: function(){
		         alert("访问失败");
		  }
	   }
	);
}
</script>