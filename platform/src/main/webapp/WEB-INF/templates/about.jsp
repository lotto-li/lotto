<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入element UI -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">

<title>关于</title>
<!-- 样式设置 -->
<link href="/static/css/style.css" rel="stylesheet" type="text/css" media="all" />

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
                <a href="myInfo" style="color:black; font-size:20px;">
                	欢迎您: ${CURRENT_USER.username}&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a href="login" style="color:black; font-size:10px;">
                	切换用户</a>
            </c:when>
            <c:otherwise>
                <a href="login">登录&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <a href="register">注册</a>
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
        <li class="last"><a href="home">主页 </a></li>
        <c:choose>
            <c:when test="${CURRENT_USER.username == 'adm'}">
        		<li><a href="userInfo">成员管理</a></li>
        	</c:when>
        	<c:when test="${!empty CURRENT_USER}">
        		<li><a href="myInfo">我的信息 </a></li>
        	</c:when>
        </c:choose>
        <li><a href="issue">议题讨论 </a></li>
        <li><a href="team">团队信息 </a></li>
        <li><a href="notice">公告栏 </a></li>
        <c:choose>
            <c:when test="${CURRENT_USER.username != 'adm'}">
        		<li class="no_bg ped"><a href="about">关于 </a></li>
        	</c:when>
        </c:choose>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  
  <div id="about">
	<template>
	  <el-carousel :interval="4000" type="card" height="450px">
	    <el-carousel-item v-for="item1">
	      <h3 style="padding-left:40%;color:black;">使用说明</h3>
	      <p class="about-text">&nbsp;&nbsp;&nbsp;&nbsp;
	    	 新用户可以通过页面注册，在注册页面完成注册即可登录系统，在系统中可以通过团队管理的页面加入团队进行讨论，也可以在议题管理对议题发表不同的意见。也可以在公告栏中发布信息。如果您忘记了您的密码，可以向管理员申请查询或者重置密码。
	      </p>
	    </el-carousel-item>
	    <el-carousel-item v-for="item2">
	      <h3 style="padding-left:40%;">更新版本</h3>
	      <div class="about-text" style="text-align:center;">
	        <span>September 04, 2017</span>
	        <p>Version 1.0</p>
	        <span>November 11, 2017</span>
	        <p>Version 1.1</p>
	        <span>December 20, 2017</span>
	        <p>Version 1.2</p>
	        <span>March 14, 2017</span>
	        <p>Version 1.4</p>
	      </div>>
	    </el-carousel-item>
	    <el-carousel-item v-for="item3">
	      <h3 style="padding-left:40%;">开发者留言</h3>
	      <p class="about-text">&nbsp;&nbsp;&nbsp;&nbsp;
	                  本系统是基于B/S模式的网络平台。近年来依靠科技水平的迅猛发展，管理平台做为一个全新的、便捷的交互渠道得到了快速的扩大提升。 随着网络用户的快速增长，管理平台已经是必不可少的了，而大学生创新思想交流管理平台提供给用户成员选择议题讨论，参与创新团队的功能，使用户成员节省大量时间，交流跨越空间的限制。本系统将使用JAVA语言编写后台以及使用html+css+js来编写页面，数据将使用mySQL数据库进行交互。</p>
	    </el-carousel-item>
	  </el-carousel>
	</template>
  </div>
  
  
  
</div>

</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#about',
     data: function(){
       return { 
 		}
     }
   })
</script>
<style>
  .about-text{
  font-size:20px;
  color:black;
  padding-left:20px;
  padding-right:20px;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 30px;
    opacity: 0.75;
    line-height: 150px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(5) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(4) {
    background-color: #d3dce6;
  }
  
  .el-carousel__item:nth-child(3) {
    background-color: #ffff5f;
  }
</style>
</html>