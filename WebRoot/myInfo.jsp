<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div class="wrapper"> 
  
  <!-- 头部设置 -->
  <div class="header">
    <div class="header-container">
      <div class="logo"> <a href="#">大学生创新思想信息交流平台</a> </div>
      <div class="toll-free">
        <c:choose>
            <c:when test="${!empty CURRENT_USER}">
                <a>欢迎您: ${CURRENT_USER.username}</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp">登录&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a href="register.jsp">注册</a>
            </c:otherwise>
        </c:choose>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Header ends --> 
  
  <!-- 导航栏 -->
  <div class="nav">
    <div class="nav-in">
      <ul>
        <li class="last"><a href="homePage.jsp">主页 </a></li>
        <li><a href="myInfo.jsp">我的信息 </a></li>
        <li><a href="issue.jsp">议题讨论 </a></li>
        <li><a href="team.jsp">团队信息 </a></li>
        <li><a href="notice.jsp">公告栏 </a></li>
        <li class="no_bg ped"><a href="about.jsp">关于 </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  
</div>

</body>
</html>