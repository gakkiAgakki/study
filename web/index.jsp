<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.haokeweiye.bean.Message" %>
<%@page import="cn.haokeweiye.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>留言板界面</title>
	<script src="${pageContext.request.contextPath}/js/NotNull.js"></script>
	<%--<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>--%>
	<script src="js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script src="js/ajaxfileupload.js"></script>
	<style >
		.top{
			position: absolute;
			top: 0px;
			left: 40px;
		}
		.two{
			position: absolute;
			top: 292px;
			left: 40px;
			width: 1440px;
			height: 38px;
			background-color:#0052A3;
		}
		.center-in-center{
			position: absolute;
			top: 400px;
			left: 150px;
		}
		.footer{
			position: absolute;
			top: 1000px;
			left: 40px;
		}

	</style>
</head>

<body>
<div class="top" style="width: 1440px;height: 292px;left: 40px">
	<img src="img/top.png" style="width: 1440px;height: 292px;">
</div>
<div class="two">

		<font class="fontTop" color="white" style="margin-left: 100px ;" size="5" >太原不锈钢产业留言板系统</font>

		<a style="margin-left: 800px" href="http://59.49.54.204:8083/" class="gotoindex"><font size="5" color="white"> 返回首页</font></a>

		<li style="left: 125px; width: 1190px; display: list-item;"><div class="left"></div></li>
</div>
<div class="container center-in-center">
	<%--<h1 style="margin-left:5%">留言板</h1>--%>
	<form id="lms" action="leaveMessageServlet" method="post" onsubmit="checkForm()">
		<div>
			<input type="hidden" name="category" value="${category}">
		</div>
		<table>
			<tr><td>标题</td><td> <input id="title" style="width: 300px" type="text" name="title"/></td></tr>
			<tr><td>姓名</td><td><input id="name" style="width: 300px" type="text" name="name"/></td></tr>
			<tr><td>手机号码</td><td> <input id="telephone" style="width: 300px" type="text" name="telephone"/></td></tr>
			<tr><td>邮箱</td><td> <input id="mail" style="width: 300px" type="text" name="mail"/></td></tr>
			<tr><td>联系单位</td><td> <input id="unit" style="width: 300px" type="text" name="unit"/></td></tr>
			<tr><td>联系地址</td><td> <input id="site" style="width: 300px ; height: 50px" type="text" name="site"/></td></tr>
			<tr><td>留言内容</td>
			<td><textarea id="content" name="content" rows="10" cols="80"></textarea></td>
			</tr>
		</table>

	</form>
		<form id="uls"   method="post" action="UploadServlet" enctype="multipart/form-data">
			上传文件:
			<input id="file" type="file" name="uploadFile" />
			<br/><br/>

			<%--验证码--%>
			<div class="row cl">
				<div>
					验证码<input id="verify" name="verify" type="text" onblur="testCheck(this.value);">
					<img id="pic" src="codeServlet"> <input type="button" id="kanbuq"  onClick="Checktest();" value="看不清，换一张"></input>
				</div>
			</div>
			<script type="text/javascript">
                function testCheck(num) {
                    var title = document.getElementById("verify").value;
                    if (title == null || title == '') {

                        return false;
                    }else {
                        // 使用ajax发送请求
                        $.ajax({
                            url: "CheckServlet", // 要访问的地址，这里访问的是servlet映射地址
                            data: {verify:title}, // 相当于地址栏后面的参数
                            success: function(result){ // 访问成功后，执行的方法，参数是后台的结果
                                if (result == "false"){
                                    alert(num + "验证码错误");
                                    document.getElementById('verify').value="";
                                    Checktest();
                                }else {
                                    //alert("正确");
                                }
                            }
                        })
                    }

                }

			</script>

		</form>
		<%--<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>  target="rfFrame"--%>
		<script type="text/javascript">
			function tijiao() {
				if ( checkForm() == false){
				    return false;
				}

                $.ajaxFileUpload({  //Jquery插件上传文件
                    url: 'UploadServlet',
                    secureuri: false,//是否启用安全提交  默认为false
                    fileElementId: "file", //type="file"的id
                    dataType: "text",  //返回值类型

                    success: function (data)
                    {
                        if (data == "false"){
                            alert("文件保存失败");
                            return false;
						}else {
                            document.getElementById("lms").submit();//表单提交
						}

                    },

                });
            }
            function shangChuan() {
				document.getElementById("uls").submit();
            }
            function chongZhi() {
				window.location.reload(true);
            }
		</script>
		<%--<input type="submit" onclick="shangChuan()"  value="上传文件" />--%>
		<input type="submit" onclick="chongZhi()"  value="重置"/>
		<input type="submit" onclick="return tijiao()" value="提交"/>
</div>

<div class="footer">

	<div class="footerc ">
		<div class="bodywidth">
			<font size="2" style="margin-left: 450px">
			主办单位：太原不锈钢产业服务窗口平台  技术支持：山西浩科伟业科技有限公司</font><br>
			<font size="2" style="margin-left: 450px">
			Copyright &nbsp;&copy; &nbsp;2015-2016 &nbsp; 太原不锈钢产业服务窗口平台 晋ICP备00000000号</font> <br>
			<font size="2" style="margin-left: 500px">建议使用浏览器的极速模式打开网站，已获得更好的体验！</font>

		</div>
	</div>
</div>
</div>


</body>
</html>