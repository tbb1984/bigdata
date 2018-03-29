package com.eliteams.quick4j.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eliteams.quick4j.web.model.User;
import com.eliteams.quick4j.web.security.PermissionSign;
import com.eliteams.quick4j.web.security.RoleSign;
import com.eliteams.quick4j.web.service.PermissionService;
import com.eliteams.quick4j.web.service.UserService;

/**
 * 权限控制器
 * 
 * @author zhiduo
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/permission")
public class PermissionController {

    @Resource
    private PermissionService permissionService;
    
    /**
     * 测试-前台标签
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/checkfront", method = RequestMethod.GET)
    public String checkfront(@Valid User user, BindingResult result, Model model, HttpServletRequest request) {
        return "permission/checkfront";
    }
    
    /**
     * 测试-后台注解
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/checkbackstage", method = RequestMethod.GET)
    public String checkbackstage(@Valid User user, BindingResult result, Model model, HttpServletRequest request) {
        return "permission/checkbackstage";
    }

    /**
     * 验证用户是否登录，等同于方法subject.isAuthenticated() 结果为true时
     */
    @RequestMapping(value = "/checkRequiresAuthentication",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresAuthentication
    public String checkRequiresAuthentication() {
        return "认证通过";
    }
    
    /**
     * 验证用户是否被记忆，user有两种含义：
     * 一种是成功登录的（subject.isAuthenticated() 结果为true）;
     * 另外一种是被记忆的（subject.isRemembered()结果为true）。
     */
    @RequestMapping(value = "/checkRequiresUser",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresUser
    public String checkRequiresUser() {
        return "拥有user:create权限或user.delete权限";
    }

    /**
     * 验证是否是一个guest的请求，与@RequiresUser完全相反。
     * 换言之，RequiresUser  == !RequiresGuest。
     * 此时subject.getPrincipal() 结果为null.<br>
     */
    @RequestMapping(value = "/checkRequiresGuest",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresGuest
    public String checkRequiresGuest() {
        return "你是游客";
    }
    
    /**
     * 如果subject中有admin角色才可以访问方法checkRequiresRoles()。如果没有这个权限则会抛出异常AuthorizationException
     */
    @RequestMapping(value = "/checkRequiresRoles",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresRoles(value = RoleSign.ADMIN)
    public String checkRequiresRoles() {
        return "拥有admin角色,能访问";
    }
    
    /**
     * 如果subject中有admin和normal角色才可以访问方法checkRequiresRolesAnd()。如果没有这个权限则会抛出异常AuthorizationException
     */
    @RequestMapping(value = "/checkRequiresRolesAnd",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresRoles(value={"admin","normal"},logical=Logical.AND) 
    public String checkRequiresRolesAnd() {
        return "拥有admin和normal角色";
    }
    
    /**
     * 如果subject中有admin或normal角色才可以访问方法checkRequiresRolesOr()。如果没有这个权限则会抛出异常AuthorizationException
     */
    @RequestMapping(value = "/checkRequiresRolesOr",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresRoles(value={"admin","normal"},logical=Logical.OR) 
    public String checkRequiresRolesOr() {
        return "拥有admin或normal角色";
    }

    /**
     * 要求subject中必须含有user:create的权限才能执行方法checkRequiresPermissions()。否则抛出异常AuthorizationException。
     */
    @RequestMapping(value = "/checkRequiresPermissions",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresPermissions(value = PermissionSign.USER_CREATE)
    public String checkRequiresPermissions() {
        return "拥有user:create权限";
    }
    
    /**
     * 要求subject中必须同时含有user:create和user:delete的权限才能执行方法checkRequiresPermissionsAnd()。否则抛出异常AuthorizationException。
     */
    @RequestMapping(value = "/checkRequiresPermissionsAnd",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresPermissions(value = {PermissionSign.USER_CREATE,PermissionSign.USER_DELETE},logical=Logical.AND)
    public String checkRequiresPermissionsAnd() {
        return "拥有user:create和user.delete权限";
    }
    
    /**
     * 要求subject中必须含有user:create或user:delete的权限才能执行方法checkRequiresPermissionsOr()。否则抛出异常AuthorizationException。
     */
    @RequestMapping(value = "/checkRequiresPermissionsOr",produces="text/plain;charset=UTF-8")
    @ResponseBody
    @RequiresPermissions(value = {PermissionSign.USER_CREATE,PermissionSign.USER_DELETE},logical=Logical.OR)
    public String checkRequiresPermissionsOr() {
        return "拥有user:create权限或user.delete权限";
    }
}
