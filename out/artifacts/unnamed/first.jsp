<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>

	<script type="text/javascript">

	</script>

<link rel="stylesheet" type="text/css" href="css/style.css" />


</head>
<body>

<div id="banner">
	<%--<div id="carousel">--%>
		<%--<a href="categoryServlet?category=1" charset="utf-8"><img src="img/1.png"></a>--%>
		<%--<a href="categoryServlet?category=2" charset="utf-8"><img src="img/2.png" ></a>--%>
		<%--<a href="categoryServlet?category=3" charset="utf-8"><img src="img/3.png" ></a>--%>
		<%--<a href="categoryServlet?category=4" charset="utf-8"><img src="img/4.png" ></a>--%>
		<%--<a href="categoryServlet?category=5" charset="utf-8"><img src="img/5.png" ></a>--%>
		<%--<a href="categoryServlet?category=6" charset="utf-8"><img src="img/6.png"></a>--%>
		<%--<a href="categoryServlet?category=7" charset="utf-8"><img src="img/7.png" ></a>--%>
		<%--<a href="categoryServlet?category=8" charset="utf-8"><img src="img/8.png" ></a>--%>
		<%--<a href="categoryServlet?category=9" charset="utf-8"><img src="img/9.png" ></a>--%>
	<%--</div>--%>
		<div id="carousel">
			<img src="img/1.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=1">
			<img src="img/2.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=2">
			<img src="img/3.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=3">
			<img src="img/4.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=4">
			<img src="img/5.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=5">
			<img src="img/6.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=6">
			<img src="img/7.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=7">
			<img src="img/8.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=8">
			<img src="img/9.png" data-url="${pageContext.request.contextPath}/categoryServlet?category=9">
		</div>
</div>

<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/slider.js" type="text/javascript" charset="utf-8"></script>
<script>
	$(function() {
		$('#carousel').carousel({
			curDisplay: 0, //默认索引
			autoPlay: false, //是否自动播放
			interval: 3000 //间隔时间
		});
	});
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
