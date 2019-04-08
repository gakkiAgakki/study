package cn.haokeweiye.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 验证码的校验
 *      对用户返回的验证码和生成的验证码进行校验
 * Created by HASEE on 2019/3/27.
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//		response.setContentType("charset=UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        //得到输入的验证码与随机的图片验证码作比较，判断是否相等，返回提示用户，
        PrintWriter out = response.getWriter();
        //使用.equalsIgnoreCase比较可以忽略大小写
//        System.out.println(request.getParameter("verify"));
//        System.out.println(request.getSession().getAttribute("piccode"));
        if (request.getSession().getAttribute("piccode").toString().equalsIgnoreCase(request.getParameter("verify"))) {
            //out.println("验证码正确");
        } else {
            request.getSession().setAttribute("piccode", "");
            //out.println("false");

            response.getWriter().write("false");

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
