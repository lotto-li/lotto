<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的信息</title>
<!-- 引入element UI -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
<link href="/static/css/style.css" rel="stylesheet" type="text/css" media="all" />

<script src="/static/js/jquery-3.0.0.min.js" type="text/javascript" ></script>
<script src="/static/js/util.js" type="text/javascript" ></script>
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
  
  <div id="user">
   <div class="view">
	<el-upload
	  class="avatar-uploader"
	  action="https://jsonplaceholder.typicode.com/posts/"
	  :show-file-list="false"
	  :on-success="handleAvatarSuccess"
	  :before-upload="beforeAvatarUpload">
	  <img v-if="imageUrl" :src="imageUrl" class="avatar">
	  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
	</el-upload>
	
	<div class="textarea">
	 <el-form :model="editForm" label-width="80px" ref="editForm">
	  	<el-form-item label="用户名" prop="username" style="width:500px;">
			<el-input v-model="editForm.username" auto-complete="off" :disabled="!flag"></el-input>
		</el-form-item>
		<el-form-item label="密码" prop="password">
			<el-input v-model="editForm.password" auto-complete="off" :disabled="!flag"></el-input>
		</el-form-item>
	 </el-form>
  	</div>
  	
  	<div class="button">
  		<template v-if="!flag">
  			<el-button @click="handleInfoEdit">编辑</el-button>
  		</template>
  		<template v-if="flag">
  			<el-button @click="handleInfoSave">保存</el-button>
  		</template>
  	</div>
   </div>
  </div>
  
</div>

</body>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    background: white;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #20a0ff;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
  .textarea {
  	position:absolute;
  	left: 200px;
  	top: 200px;
  }
  .view {
  	background: #f1f1f1;
  }
  .button {
  	position:absolute;
  	left: 750px;
  	top: 259px;
  }
</style>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#user',
     mounted(){
    	 console.info(this.editForm)
    	 let _this = this;
    	 $.ajax({
             url: "/api/sysUsers",
             method: "GET",
             success(resp){
            	 let arr = resp._embedded.sysUsers;
            	 _this.tableData = arr;
             },
             error(resp){
                 console.log("error")
             },
         });
    	 let arr = eval('${sysUsers}');
    	 
    	 
     },
     data: function(){
       return { 
    	   imageUrl: '',
           flag: false,
           editForm: {
        	   username: '${CURRENT_USER.username}',
        	   password: '${CURRENT_USER.password}',
           },
           //datas:[],
           formInline: {
    	   },
    	   //editFormVisible:false,
 		}
     },
     methods: {
         handleAvatarSuccess(res, file) {
           this.imageUrl = URL.createObjectURL(file.raw);
         },
         beforeAvatarUpload(file) {
           const isLt2M = file.size / 1024 / 1024 < 2;

           if (!isLt2M) {
             this.$message.error('上传头像图片大小不能超过 2MB!');
           }
           return isLt2M;
         },
         handleInfoEdit() {
        	this.flag = true; 
        	console.info(this.editForm)
        	//this.editFormVisible= true;
         },
         handleInfoSave() {
        	 let url = "/api/sysUsers";
        	 let method = "PUT";
    		 let _this = this;
    		 $.ajax({
    			 url: url,
    			 method: method,
    			 data: this.editForm,
    			 headers:{
	   		        'Content-Type': 'application/x-www-form-urlencoded',
	   		     },
    			 success(resp){
    				 console.log(resp)
    				 _this.handleSearch();
    			 },
                 error(resp){
                     console.log("error")
                     console.log(resp)
                 },
    		 });
         	 this.flag = false; 
          },
       }
   })
</script>
</html>