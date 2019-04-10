<!doctype html>
<html>
<head>
<meta charset="utf-8">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.js"></script>
	<title>首页</title>
	<link href="css/jquery.bxslider.css" rel="stylesheet" type="text/css">
	<style>
		p{ width:100%; height:40px; font-size:20px; color:#333; line-height:40px; text-align:center;}
	</style>
	<style type="text/css">

		body{
			background-image: url(img/beijingtu.jpg);
			background-size:auto;
		}
	</style>
</head>
<body background="img/beijingtu.jpg">
<div>
		<%--<div style="text-align: center">--%>
			<%--<img src="img/pingtai.png">--%>
		<%--</div>--%>
			<div style="height: 150px"></div>
		<div class="slider1">
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=1"><img style="width: 300px;height: 225px" src="img/1.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=2"><img style="width: 300px;height: 225px" src="img/2.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=3"><img style="width: 300px;height: 225px" src="img/3.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=4"><img style="width: 300px;height: 225px" src="img/4.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=5"><img style="width: 300px;height: 225px" src="img/5.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=6"><img style="width: 300px;height: 225px" src="img/6.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=7"><img style="width: 300px;height: 225px" src="img/7.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=8"><img style="width: 300px;height: 225px" src="img/8.png"></a>
			</div>
			<div  class="slide">
				<a href="${pageContext.request.contextPath}/categoryServlet?category=9"><img style="width: 300px;height: 225px" src="img/9.png"></a>
			</div>
		</div>

</div>
		<script type="text/javascript">
            $(document).ready(function(){
                $('.slider1').bxSlider({
                    slideWidth: 300,
                    slideHeight: 500,
                    minSlides: 2,
                    maxSlides: 3,
                    slideMargin: 10
                });
            });
		</script>
</body>
</html>
