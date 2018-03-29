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
-->
</style>

<table id="mytable" summary="The technical specifications of the Apple PowerMac G5 series" cellspacing="0"> 
<caption> </caption> 
  <tbody>
  <tr> 
<!--     <th scope="col" abbr="Configurations" class="nobg">标签名称</th>  -->
	<th scope="col" abbr="Configurations">标签名称</th>
    <th scope="col" abbr="Dual 1.8">标签说明</th> 
    <th scope="col" abbr="Dual 2">用法</th> 
    <th scope="col" abbr="Dual 2.5">运行结果</th> 
  </tr> 
  <tr> 
    <th scope="row" abbr="Model" class="spec">guest</th> 
    <td>验证当前用户是否为“访客”，即未认证（包含未记住）的用户</td> 
    <td>
    		&lt;shiro:guest&gt;用户你好，你是访客，请先登录！&lt;/shiro:guest&gt;
    </td> 
    <td>
		<shiro:guest>用户你好，你是访客，请先登录！</shiro:guest>
	</td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="G5 Processor" class="specalt">user</th> 
    <td class="alt">认证通过或已记住的用户</td> 
    <td class="alt">&lt;shiro:user&gt; 用户你好，你已认证通过或已记住。&lt;/shiro:user&gt;</td> 

    <td class="alt"><shiro:user> 用户你好，你已认证通过或已记住。</shiro:user></td> 
  </tr> 
  
  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">authenticated</th> 
    <td>已认证通过的用户。不包含已记住的用户，这是与user标签的区别所在</td> 
    <td>&lt;shiro:authenticated&gt;用户你好，你已认证通过,未记住的用户&lt;/shiro:authenticated&gt;</td> 
    <td><shiro:authenticated>用户你好，你已认证通过,未记住的用户</shiro:authenticated></td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">notAuthenticated</th> 
    <td>未认证通过用户，与authenticated标签相对应。与guest标签的区别是，该标签包含已记住用户</td> 
    <td>&lt;shiro:notAuthenticated&gt;未认证通过,已记住的用户&lt;/shiro:notAuthenticated&gt;</td> 
    <td><shiro:notAuthenticated>未认证通过,已记住的用户</shiro:notAuthenticated></td> 
  </tr>

  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">principal</th> 
    <td class="alt">输出当前用户信息，通常为登录帐号信息</td> 
    <td class="alt">你好&lt;shiro:principal/&gt;, 吃了吗?  </td> 
    <td class="alt">你好<shiro:principal/>, 吃了吗?  </td> 
  </tr> 

  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">hasRole</th> 
    <td>验证当前用户是否属于该角色</td> 
    <td>&lt;shiro:hasRole name="admin"&gt;  是admin角色&lt;/shiro:hasRole&gt;</td> 
    <td><shiro:hasRole name="admin">是admin角色</shiro:hasRole></td> 
  </tr>

  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">lacksRole</th> 
    <td class="alt">与hasRole标签逻辑相反，当用户不属于该角色时验证通过</td> 
    <td class="alt">&lt;shiro:lacksRole name="root"&gt;不是root角色&lt;/shiro:lacksRole&gt;</td> 
    <td class="alt"><shiro:lacksRole name="root">不是root角色</shiro:lacksRole></td> 
  </tr> 

  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">hasAnyRole</th> 
    <td>验证当前用户是否属于其中任意一个角色（相当于java中的"或"关系）</td> 
    <td>&lt;shiro:hasAnyRoles name="admin ,normal"&gt;拥有admin&lt;font class="lh"&gt;或&lt;/font&gt;normal角色&lt;/shiro:hasAnyRoles&gt;</td> 
    <td><shiro:hasAnyRoles name="admin ,normal">拥有admin<font class="lh">或</font>normal角色</shiro:hasAnyRoles></td> 
  </tr>

  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">hasAllRoles</th> 
    <td class="alt">这个是<font class="lh">自定义</font>的标签，验证当前用户是否属于其中所有角色（相当于java中的"且"关系）。</td> 
    <td class="alt">&lt;shiro:hasAllRoles name="admin,normal"&gt;拥有admin&lt;font class="lh"&gt;和&lt;/font&gt;normal角色&lt;/shiro:hasAllRoles&gt;</td> 
    <td class="alt"><shiro:hasAllRoles name="admin,normal">拥有admin<font class="lh">和</font>normal角色</shiro:hasAllRoles></td> 
  </tr> 
  

  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">hasPermission</th> 
    <td>验证当前用户是否拥有指定权限</td> 
    <td>&lt;shiro:hasPermission name="user:create"&gt;  拥有user:create 权限&lt;/shiro:hasPermission&gt;</td> 
    <td><shiro:hasPermission name="user:create">  拥有user:create 权限</shiro:hasPermission></td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">lacksPermission</th> 
    <td class="alt">与hasPermission标签逻辑相反，当前用户没有制定权限时，验证通过</td> 
    <td class="alt">&lt;shiro:lacksPermission name="user:create2"&gt;  没有user:create2 权限&lt;/shiro:lacksPermission&gt;</td> 
    <td class="alt"><shiro:lacksPermission name="user:create2">  没有user:create2 权限</shiro:lacksPermission></td> 
  </tr> 
  
  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">hasAnyPermissions</th> 
    <td>这个是<font class="lh">自定义</font>的标签，验证当前用户是否属于其中任意一个权限（相当于java中的"或"关系）</td> 
    <td>&lt;shiro:hasAnyPermissions name="user:update,user:create"&gt; 拥有user:update&lt;font class="lh"&gt;或&lt;/font&gt;user:create权限&lt;/shiro:hasAnyPermissions&gt;</td> 
    <td><shiro:hasAnyPermissions name="user:update,user:create"> 拥有user:update<font class="lh">或</font>user:create权限</shiro:hasAnyPermissions></td> 
  </tr>
  
  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">hasAllPermissions</th> 
    <td class="alt">这个是<font class="lh">自定义</font>的标签，验证当前用户是否属于其中所有权限（相当于java中的"且"关系）。</td> 
    <td class="alt">&lt;shiro:hasAllPermissions name="user:update,user:create"&gt;拥有user:update&lt;font class="lh"&gt;和&lt;/font&gt;user:create权限&lt;/shiro:hasAllPermissions&gt;</td> 
    <td class="alt"><shiro:hasAllPermissions name="user:update,user:create">拥有user:update<font class="lh">和</font>user:create权限</shiro:hasAllPermissions></td> 
  </tr>

</tbody>
</table>
