<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<pre id="x">initializing</pre>
<script type="text/javascript">
    var es = new EventSource("<%=request.getContextPath() %>/servlet/LoginServlet");
    es.onmessage = function (e) {
        document.getElementById('x').innerHTML += "\n" + e.data;
    };
</script>
</body>
</html>