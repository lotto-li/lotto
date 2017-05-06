<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>议题讨论</title>
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
  
  <!-- 公告栏部分 -->
  <div id="issue">
   <div style="margin: 5px 10px;">
  	<el-row>
  	  <el-col :span="4">
  	    <el-input v-model="formInline.title" placeholder="请输入标题"></el-input>
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
		<el-table-column prop="title" label="标题" width="180">
		</el-table-column> 
		<el-table-column prop="name" label="发布人" width="180">
		</el-table-column> 
		<el-table-column prop="date" label="日期" :formatter="formatDate" width="200"> 
		</el-table-column> 
		<el-table-column prop="content" label="内容"> 
		</el-table-column> 
		<el-table-column
	      fixed="right"
	      label="操作"
	      width="150">
	      <template scope="scope">
	        <el-button @click="handleRead(scope.row)" type="text" size="small">查看</el-button>
	        <template v-if="scope.row.name == '${CURRENT_USER.username}' ">
	        	<el-button @click="handleEdit(scope.row)" type="text" size="small">编辑</el-button>
	        	<el-button @click="handleDelete(scope.row)" type="text" size="small">删除</el-button>
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
   <el-dialog :title="readFormTtile" v-model="readFormVisible">
   	 <el-form :model="readForm" label-width="80px" ref="readForm">
   	 	
   	    <el-form-item label="标题" prop="title">
   	        <el-input :readonly="!readFormEditable"
   	            v-model="readForm.title" auto-complete="off"></el-input>
	    </el-form-item>
	    
	    <el-row>
	      <el-col span="12">
	        <el-form-item label="发布人" prop="name">
	            <el-input
	                :readonly="!readFormEditable"
	                v-model="readForm.name" auto-complete="off"></el-input>
	        </el-form-item>
	      </el-col>
	      <el-col span="12">
	        <el-form-item label="发布日期" prop="date">
	            <el-date-picker
	              :readonly="!readFormEditable"
			      v-model="readForm.date"
			      type="date"
			      placeholder="选择日期">
			    </el-date-picker>
	        </el-form-item>
	      </el-col>
        </el-row>
	    
        <el-form-item label="内容" prop="content">
            <el-input
            	type="textarea" 
            	:rows="3"
                :readonly="!readFormEditable"
                v-model="readForm.content" auto-complete="off"></el-input>
        </el-form-item>
   	 </el-form>
   	 
   	 <el-table :data="issueRecords" style="width: 100%">
      	<el-table-column
	      type="index"
	      width="40">
	    </el-table-column>
		<el-table-column prop="content" label="内容"> 
		</el-table-column> 
		<el-table-column prop="name" label="发布人" width="100">
		</el-table-column> 
	  </el-table><br>
	  
	  <el-button @click.native="issueRecordFormVisible = true">评论</el-button>
   	 
     <span slot="footer" class="dialog-footer">
		<el-button @click.native="readFormVisible = false">取 消</el-button>
		<el-button v-if="readFormEditable" type="primary" @click="handleSubmit();">提交</el-button>
	 </span>
   </el-dialog>
   
   <el-dialog title="新增评论" v-model="issueRecordFormVisible">
     <el-form :model="issueRecordForm" label-width="80px" ref="issueRecordForm">
        <el-form-item label="评论内容" prop="content">
            <el-input
            	type="textarea" 
            	:rows="3"
                v-model="issueRecordForm.content" auto-complete="off"></el-input>
        </el-form-item>
   	 </el-form>
     
     <span slot="footer" class="dialog-footer">
		<el-button @click.native="issueRecordFormVisible = false">取 消</el-button>
		<el-button type="primary" @click="handleRecordSubmit();">提交</el-button>
	 </span>
   </el-dialog>
   
  </div>
</div>

</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#issue',
     mounted(){
    	 let arr = eval('${issues}');
    	 arr.forEach(item => {
    		 item.date = new Date(item.date.time);
    	 })
    	 this.tableData = arr;
    	 
     },
     data: function(){
    	 return { 
    	   readFormEditable: false,
      	   readFormVisible: false,
      	   readFormTtile: '',
      	   issueRecordFormVisible: false,
      	   submitType: '',
      	   formInline: {
      	   },
      	   readForm:{
      		   title: '',
      		   name: '',
      		   date: null,
      		   content: '',
      	   },
      	   issueRecordForm:{
      		   content: '',
      	   },
      	   
      	   tableData: [],
      	   issueRecords: [],
   		}
     },
     methods:{
    	 formatDate(row, column){
    		 let date = row[column.property]
    		 return formatDate(date, "yyyy-MM-dd");
    	 },
    	 //搜索
    	 handleSearch(){
             let _this = this;
    		 $.ajax({
                 url: "/api/issues/search/findByTitleLike",
                 method: "GET",
                 data: _this.formInline,
                 success(resp){
                	 let arr = resp._embedded.issues;
                	 arr.forEach(item => {
                         item.date = new Date(item.date);
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
    	 //查看
    	 handleRead: function(row){
    		 this.readFormTtile='查看';
    		 let _this = this;
    		 //console.info(this.tableData);
             this.readFormEditable =false;
    		 this.readFormVisible =true;
    		 Object.assign(this.readForm, row);
    		 
    		 let con = row.id;
    		 $.ajax({
    			 url : "/api/issueRecords",
        		 method : 'GET',
        		 data: con,
        		 
    			 success(resp){
    				 console.log(resp)
    				 _this.issueRecords = resp._embedded.issueRecords;
    				 //console.info(_this.issueRecords)
    			 },
                 error(resp){
                     console.log("error")
                     //console.log(resp)
                 },
    		 });
    	 },
    	 //新增
    	 handleAdd(){
    		 this.readFormTtile='新增';
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
    		 this.readFormTtile='编辑';
             this.readFormEditable =true;
             this.readFormVisible =true;
             this.submitType = "edit";
             Object.assign(this.readForm, row)
    	 },
    	 //提交
    	 handleSubmit(){
    		 let url = "/issue", method;
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
    				 //console.log(resp)
    	             _this.readFormVisible =false;
    				 _this.handleSearch();
    			 },
                 error(resp){
                     console.log("error")
                     //console.log(resp)
                 },
    		 });
    	 },
    	 //删除
         handleDelete(row){
             let _this = this;
             $.ajax({
                 url: "/deleteIssue/",
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
         handleRecordSubmit(){
        	 let url = "/issueRecord";
    		 let _this = this;
    		 data = this.issueRecordForm,
    		 data.name = '${CURRENT_USER.username}',
    		 $.ajax({
    			 url: url,
    			 method: "POST",
    			 data: data,
    			 
    			 headers:{
	   		        'Content-Type': 'application/x-www-form-urlencoded',
	   		     },
    			 success(resp){
    				 //console.log(resp)
    	             _this.issueRecordFormVisible =false;
    	             _this.readFormVisible =false;
    			 },
                 error(resp){
                     console.log("error")
                     //console.log(resp)
                 },
    		 });
         },
     }
   })
</script>
</html>