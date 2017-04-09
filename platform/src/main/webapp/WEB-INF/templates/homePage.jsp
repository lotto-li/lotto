<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 引入element UI -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
<title>主页</title>

<!-- SET: FAVICON -->
<!-- <link rel="shortcut icon" type="image/x-icon" href="/static/images/favicon.ico" /> -->
<!-- END: FAVICON -->

<!-- SET: STYLESHEET -->
<link href="/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- END: STYLESHEET -->

<!-- SET: SCRIPTS -->
<script type="text/javascript"></script>
<!-- END: SCRIPTS -->

<meta name="description" content="Your description"/>
<meta name="keywords" content="keyword1 keyword2"/>

<!--[if lt IE 8]>
<style type="text/css">
	.header-container	{ padding-bottom:0;}
	.welcome	{ padding-top:12px;}
    .container	{ padding-bottom:0;}
    .footer-in	{ padding-bottom:0;}
</style>
<![endif]-->
</head>

<body>

<!-- wrapper starts -->
<div class="wrapper"> 
  
  <!-- Header Starts -->
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
  
  <!-- Nav start -->
  <div class="nav">
    <div class="nav-in">
      <ul>
        <li class="last"><a href="home">主页 </a></li>
        <li><a href="myInfo.jsp">我的信息 </a></li>
        <li><a href="issue.jsp">议题讨论 </a></li>
        <li><a href="team.jsp">团队信息 </a></li>
        <li><a href="notice">公告栏 </a></li>
        <li class="no_bg ped"><a href="about.jsp">关于 </a></li>
      </ul>
      <div class="clear"></div>
    </div>
  </div>
  <!-- Nav end --> 
  <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title=""></a></div>
  <!-- maincontent Starts -->
  <div class="container">
    <div class="container-in"> <img src="/static/images/container-bg.jpg" width="940" height="327" alt="img" />
      <div class="read1">
        <div class="read1-img1"> <img src="/static/images/read1-img.png" width="32" height="30" alt="img" /> </div>
        <h3>团队信息</h3>
        <p>您可以选择一个加入团队，开始您和您的团队的项目交流...</p>
        <a href="team.jsp">加入团队</a> </div>
      <div class="read1">
        <div class="read1-img1"> <img src="/static/images/read2-img.png" width="32" height="32" alt="img" /> </div>
        <h3>议题讨论</h3>
        <p>您可以自由选择您喜欢的议题进行讨论，开始您的思维风暴吧。。。</p>
        <a href="issue.jsp">加入讨论</a> </div>
      <div class="read1 last">
        <div class="read1-img1"> <img src="/static/images/read3-img.png" width="32" height="32" alt="img" /> </div>
        <h3>发布公告</h3>
        <p>您可以在这里查看或发布公告，包括历年的创新成果及获奖和产生效益等信息...</p>
        <a href="notice.jsp">前往公告栏</a> </div>
      <div class="clear"></div>
      <div class="welcome">
        <h5>公告栏</h5><br/>
        <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX<a href="notice.jsp">更多</a></p>
      </div>
      <div class="bottom-cont1">
        <h6>我的议题</h6>
        <p>xxxxxxxxxxxxxxx x  xxxxxxxxxxxxxxxxx  xxxxxxxxxxxx xxxxxxxxxxxxxxxxx           xxxxxxxxxxxxxxxxx</p>
      </div>
      <div class="bottom-cont1">
        <h6>议题列表</h6><br/>
        <ul>
          <li><a href="#">议题1</a></li><br/>
          <li><a href="#">议题2</a></li><br/>
          <li><a href="#">议题3</a></li><br/>
          <li><a href="#">议题4</a></li><br/>
          <li><a href="#">议题5</a></li><br/>
          <li><a href="#">议题6</a></li><br/>
          <li><a href="#">议题7</a></li><br/>
          <li><a href="#">议题8</a></li>
        </ul>
      </div>
      <div class="bottom-cont1 last">
        <h6>版本相关</h6>
        <span> September 04, 2017</span>
        <p>Version 1.0</p>
        <span>November 11, 2017</span>
        <p>Version 1.1</p>
        <span>December 20, 2017</span>
        <p>Version 1.2</p>
        <span>March 14, 2017</span>
        <p>Version 1.4</p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- aincontent ends --> 
  
  <!-- footer starts -->
  <div class="footer">
    <div class="footer-in">
      <div class="social-icons">
        <ul>
          <li><a href="http://www.qq.com"><img src="/static/images/qq.png" width="16" height="16" alt="img" /></a></li>
          <li><a href="http://www.baidu.com"><img src="/static/images/baidu.png" width="16" height="16" alt="img" /></a></li>
          <li class="last"><a href="http://www.weibo.com"><img src="/static/images/weibo.png" width="16" height="16" alt="img" /></a></li>
        </ul>
        <div class="clear"></div>
      </div>
      <div class="copy">
        <p>开发者：lotto</p>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <!-- footer ends --> 
  
</div>
<!-- wrapper ends -->

</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>

<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
    
<script>
   new Vue({
     el: '#homePage',
     data: function(){
       return { 
    	   var username = session.getAttribute("user");
 		}
     }
   })
</script>
</html>