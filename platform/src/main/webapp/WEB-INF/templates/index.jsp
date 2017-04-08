<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
<title>首页</title>

</head>
<body>
  <!-- 全局 -->
  <div class="wrapper">
  <img src="/static/images/green.jpg">
  
  
  <!-- 顶部 -->
  <header>
  <h1 style="color: red;">欢迎来到大学生创新思想信息交流平台</h1>
  <a href="login.jsp" style="color:blue">登录</a><span>&nbsp;</span>
  <a href="register.jsp" style="color:blue">注册</a><span>&nbsp;&nbsp;&nbsp;</span>
  <a href="homePage.jsp" style="color:blue">游客访问</a>
  </header>
  <!-- 页面 -->
  <div class="page">
  
    <!-- 左侧导航 -->
    <div class="menu">
    	<div >
    		
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
      el: '#app',
      data: function(){
        return { visible: false }
      }
    })
  </script>
  <style>
  	.wrapper {
    position: relative;
	}
	header {
    height: 80px;
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
    padding: 0 20px;
    z-index: 1;
    box-sizing: border-box;
	}
	img {
	width:100%;height:100%;
	}
  </style>
</html>