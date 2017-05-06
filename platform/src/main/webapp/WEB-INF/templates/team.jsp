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
        <span>${CURRENT_USER.id}</span>
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
  
  <!-- 团队部分 -->
  <div id="team">
  	<div style="margin: 5px 10px;">
  	<el-row>
  	  <el-col :span="4">
  	    <el-input v-model="formInline.teamName" placeholder="请输入队名"></el-input>
  	  </el-col>
      <el-col :span="20">
        <el-button @click="handleSearch();">搜索</el-button>
        <el-button @click="handleAdd();">新增</el-button>
      </el-col>
  	</el-row>
  	</div>
	<template> 
      <el-table :data="tableData" style="width: 100%">
        <el-table-column
	      type="index"
	      width="50">
	    </el-table-column>
      	<el-table-column prop="teamName" label="团队名字" width="200">
		</el-table-column>
		<el-table-column prop="id" label="团队ID" width="200">
		</el-table-column>
		<el-table-column prop="createName" label="创建人">
		</el-table-column>
		<el-table-column
	      fixed="right"
	      label="操作"
	      width="150">
	      <template scope="scope">
	      	<template v-if="scope.row.createName != '${CURRENT_USER.username}'">
	      	  <template v-if="scope.row.isAdd =='0'">
		        <el-button @click="handleJoin(scope.row)" type="text" size="small">加入</el-button>
		      </template>
		      <template v-else>
		        <el-button @click="handleExit(scope.row)" type="text" size="small">退出</el-button>
		      </template>
		    </template>
		        
	        <template v-if="scope.row.createName == '${CURRENT_USER.username}'">
		        <el-button @click="handleDelete(scope.row)" type="text" size="small">解散</el-button>
	        </template>
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
  
 <!-- dialog -->
   <el-dialog title="新增团队" v-model="readFormVisible">
   	 <el-form :model="readForm" label-width="80px" ref="readForm">
   	    <el-form-item label="团队名称" prop="teamName">
   	        <el-input :readonly="!readFormEditable"
   	            v-model="readForm.teamName" auto-complete="off"></el-input>
	    </el-form-item>
	    <el-form-item label="创建人" prop="createName">
   	        <el-input :readonly="!readFormEditable"
   	            v-model="readForm.createName" auto-complete="off"></el-input>
	    </el-form-item>
   	 </el-form>
     <span slot="footer" class="dialog-footer">
		<el-button @click.native="readFormVisible = false">取 消</el-button>
		<el-button v-if="readFormEditable" type="primary" @click="handleSubmit();">提交</el-button>
	 </span>
   </el-dialog>
 </div>

</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#team',
     mounted(){
    	 let arr = eval('${teams}');
    	 arr.forEach(item => {
    		 console.info(item)
    	 })
    	 this.tableData = arr;
    	 
    	 
     },
     data: function(){
	   return {
		   tableData: [],
		   formInline: {
			   
    	   },
    	   readFormEditable: false,
    	   readFormVisible: false,
    	   submitType: '',
    	   readForm:{
    		   teamName: '',
    		   createName: '${CURRENT_USER.username}',
    	   },
	    }
     },
     methods:{
    	 handleJoin(row){
    		 console.info(row);
    		 let url = "/addTeam", method;
    		 if(this.submitType == "edit"){
    			 method = "PUT";
    		 }else{
    			 method = "POST";
    		 }
    		 let _this = this;
    		 let teamId2 =row.id;
    		 console.info(teamId2);
    		 $.ajax({
    			 url: url,
    			 method: method,
    			 data:{teamId: teamId2, teamersId: ${CURRENT_USER.id}},
    			 headers:{
	   		        'Content-Type': 'application/x-www-form-urlencoded',
	   		     },
    			 success(resp){
    				 console.log(resp)
    	             _this.readFormVisible =false;
    				 _this.handleSearch();
    			 },
                 error(resp){
                     console.log("error")
                     console.log(resp)
                 },
    		 });
    	 },
    	 handleExit(row){
    		 console.info(row);
    		 let url = "/exitTeam", method;
    		 if(this.submitType == "edit"){
    			 method = "PUT";
    		 }else{
    			 method = "POST";
    		 }
    		 let _this = this;
    		 let teamId2 =row.id;
    		 console.info(teamId2);
    		 $.ajax({
    			 url: url,
    			 method: method,
    			 data:{teamId: teamId2, teamersId: ${CURRENT_USER.id}},
    			 headers:{
	   		        'Content-Type': 'application/x-www-form-urlencoded',
	   		     },
    			 success(resp){
    				 console.log(resp)
    	             _this.readFormVisible =false;
    				 _this.handleSearch();
    			 },
                 error(resp){
                     console.log("error")
                     console.log(resp)
                 },
    		 });
    	 },
    	 //搜索
    	 handleSearch(){
             let _this = this;
    		 $.ajax({
                 url: "/api/teams/search/findByTeamNameLike",
                 method: "GET",
                 data: _this.formInline,
                 success(resp){
                	 let arr = resp._embedded.teams;
                	 arr.forEach(item => {
                     })
                     console.log(arr)
                     _this.tableData = arr;
                 },
                 error(resp){
                     console.log("error")
                     console.log(resp)
                 },
             });
    	 },
    	 //新增
    	 handleAdd(){
             this.readFormEditable =true;
             this.readFormVisible =true;
             this.submitType = "add";
             //清空readForm的所有内容
             Object.keys(this.readForm).forEach((item, index) => {
                 Vue.set(this.readForm, item, null);
             })
    	 },
    	 //编辑
    	 handleEdit(row){
             this.readFormEditable =true;
             this.readFormVisible =true;
             this.submitType = "edit";
             Object.assign(this.readForm, row)
    	 },
    	//提交
    	 handleSubmit(){
    		 console.log(this.readForm)
    		 let url = "/team", method;
    		 if(this.submitType == "edit"){
    			 method = "PUT";
    		 }else{
    			 method = "POST";
    		 }
    		 let _this = this;
    		 $.ajax({
    			 url: url,
    			 method: method,
    			 data: this.readForm,
    			 headers:{
	   		        'Content-Type': 'application/x-www-form-urlencoded',
	   		     },
    			 success(resp){
    				 console.log(resp)
    	             _this.readFormVisible =false;
    				 _this.handleSearch();
    			 },
                 error(resp){
                     console.log("error")
                     console.log(resp)
                 },
    		 });
    	 },
    	 //删除
         handleDelete(row){
             let _this = this;
             $.ajax({
                 url: "/deleteTeam/",
                 method: "POST",
                 data: row,
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
         },
       //删除
         handleDelete(row){
             let _this = this;
             $.ajax({
                 url: "/deleteTeam/",
                 method: "POST",
                 data: row,
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
         },
         
     }
   })
</script>
</html>