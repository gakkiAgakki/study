<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/3/26
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="white">
<div style="margin-left:10%;margin-top:100px;font-family:Microsoft YaHei">
    <form>
        <%--控件添加style="position: absolute;left:40px;" 这样设置的是绝对位置，里左页面40像素；
若是添加style="position: relative ;left:40px;"；则是设置相对位置，相对于在包含它本身的外层控件的左边40像素--%>
        <tr>
            <div class="left cl">
                <a href="categoryServlet?category=1" charset="utf-8"><img src="img/1.png"></a>
                <a href="categoryServlet?category=2" charset="utf-8"><img src="img/2.png" style="position: relative ;left:80px;"></a>
                <a href="categoryServlet?category=3" charset="utf-8"><img src="img/3.png" style="position: relative ;left:160px;"></a>
                <a href="categoryServlet?category=4" charset="utf-8"><img src="img/4.png" style="position: relative ;left:240px;"></a>
            </div>
        </tr>
        <tr>
            <div class="left cl">
                <a href="categoryServlet?category=5" charset="utf-8"><img src="img/5.png" style="position: absolute;left:60px;"></a>
                <a href="categoryServlet?category=6" charset="utf-8"><img src="img/6.png" style="position: relative ;left:170px;"></a>
                <a href="categoryServlet?category=7" charset="utf-8"><img src="img/7.png" style="position: relative ;left:220px;"></a>
                <a href="categoryServlet?category=8" charset="utf-8"><img src="img/8.png" style="position: relative ;left:270px;"></a>
                <a href="categoryServlet?category=9" charset="utf-8"><img src="img/9.png" style="position: relative ;left:320px;"></a>
            </div>
        </tr>


    </form>

</div>
</body>
</html>
