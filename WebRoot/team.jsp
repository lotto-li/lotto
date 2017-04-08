<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>团队</title>
<!-- 引入element UI -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">

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
  
  <!-- 团队部分 -->
  <div id="team">
	<template> 
      <el-table :data="tableData" style="width: 100%">
        <el-table-column
	      type="index"
	      width="50">
	    </el-table-column>
      	<el-table-column prop="teamName" label="团队名字" width="200">
		</el-table-column>
		<el-table-column prop="teamId" label="团队ID">
		</el-table-column>
		<el-table-column
	      fixed="right"
	      label="操作"
	      width="150">
	      <template scope="scope">
	        <el-button @click="" type="text" size="small">加入</el-button>
	        <el-button @click="" type="text" size="small">退出</el-button>
	      </template>
    	</el-table-column>
	  </el-table> 
	</template>
	
	<!-- 分页 -->
	<div class="block" style="float:right">
	 <el-pagination
	    layout="prev, pager, next"
	    :total="50">
	 </el-pagination>
  	</div>
  </div>
  
  
</div>

</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#team',
     data: function(){
	   return {
	          tableData: [{
	         	 teamName: 'LGD战队',
	              teamId: '1'
	          }, {
	         	 teamName: 'EDG战队',
	              teamId: '2'
	          }, {
	         	 teamName: 'LG战队',
	              teamId: '3'
	          }, {
	         	 teamName: 'RNG战队',
	              teamId: '4'
	          }]
	    }
     }
   })
</script>
</html>