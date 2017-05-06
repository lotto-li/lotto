 function getContextPath() {
       var contextPath = document.location.pathname;
       var index = contextPath.substr(1).indexOf("/");
       contextPath = contextPath.substr(0, index + 1);
       delete index;
       return contextPath;
   }


$(document).ready(function(){
	 $("#username").focus(function(){
		 name_span.style.display = "none";
		 $("#name_span").empty();
	 });
	 $("#username").blur(function(){
		var name = $('#username').val();
		name_span.style.display = "block";
		if(name == ""){
			document.getElementById('name_span').innerHTML=
				 '<font style="color:red">*用户名为空，请输入</font>';
			return;
		}
	 });
	 $("#userpwd").focus(function(){
		 pwd_span.style.display = "none";
		 $("#pwd_span").empty();
	 });
	 $("#userpwd").blur(function(){
		var pwd = $('#userpwd').val();
		pwd_span.style.display = "block";
		if(pwd == ""){
			document.getElementById('pwd_span').innerHTML=
				 '<font style="color:red">*密码为空，请输入</font>';
		 	
			return;
		}
	 });
	 $("#validate").focus(function(){
		 validate_span.style.display = "none";
		 $("#validate_span").empty();
	 });
	 $("#validate").blur(function(){
		var validate = $('#validate').val();
		validate_span.style.display = "block";
		if(validate == ""){
			document.getElementById('validate_span').innerHTML=
				 '<font style="color:red">*验证码为空，请输入</font>';
		 	
			return;
		}
	 });
	 
	 
});

//登录按钮事件
function login(){
	var code = $('#validate').val();
	var name_state = $('#name');
	var psd_state = $('#pwd');
	var name = $('#username').val();
	var psd = $('#userpwd').val();
	$.ajax({
        url: "/loginValidate",
        type:"post",
        data:{
        	username:name,
        	userpwd:psd,
//        	userpwd:md5(psd),
        	code:code
        },
        success:function(response){
        	console.log(response)
        	if(response.msg == "验证码填写错误!"){
            	document.getElementById('validate_span').innerHTML=
					 '<font style="color:red">*验证码填写错误!</font>';
        	}else if(response.msg == "密码输入错误!"){
        		document.getElementById('pwd_span').innerHTML=
					 '<font style="color:red">*密码输入错误!</font>';
        	}else if(response.msg == "用户不存在!"){
        		document.getElementById('name_span').innerHTML=
					 '<font style="color:red">*用户不存在!</font>';
        	}else if(response.msg == "系统出错!"){
            	alert(response.msg);
        	}else{
        		/*window.location.href = "register.jsp";*/
        		console.log="登录成功!";
        		window.location.href = "/home";
        	}
        },
        error:function(e){
            alert("错误!!!");
        }
    });  
}
//跳转到注册页面
function toRegister() {
	window.location.href = "register";
}
 // 刷新图片--添加随机数防止缓存
function changeImg() {
    	var url = "/validateCode?"+Math.random();
		var imgSrc = $("#imgObj");  
   		document.getElementById("imgObj").src = url;
}
 
