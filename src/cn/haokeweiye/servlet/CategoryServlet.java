package cn.haokeweiye.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 页面点击图片跳转时获取其category
 * Created by HASEE on 2019/4/1.
 */
@WebServlet("/categoryServlet")
public class CategoryServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**设置请求编码*/
        request.setCharacterEncoding("UTF-8");
        /**设置响应编码*/
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        /**
         * 获取到category
         */
        String category = request.getParameter("category");

        /**
         * 如果没有从页面进入，即没有category，则跳转到界面之中
         */
        if (category == null || Integer.parseInt(category) > 9 || Integer.parseInt(category) < 1){

            request.getRequestDispatcher("first.jsp").forward(request,response);
            return;
        }
        int cat = Integer.parseInt(category);
        /**
         * 对类别赋值
         */
        if (cat == 1){
            request.getSession().setAttribute("category","科技项目申报");
        }
        if (cat == 2){
            request.getSession().setAttribute("category","科技成果转化");
        }
        if (cat == 3){
            request.getSession().setAttribute("category","高新技术企业认定");
        }
        if (cat == 4){
            request.getSession().setAttribute("category","技术中心/重点实验室");
        }
        if (cat == 5){
            request.getSession().setAttribute("category","专精特新申报");
        }
        if (cat == 6){
            request.getSession().setAttribute("category","技术改造申报");
        }
        if (cat == 7){
            request.getSession().setAttribute("category","知识产权服务");
        }
        if (cat == 8){
            request.getSession().setAttribute("category","入区申请");
        }
        if (cat == 9){
            request.getSession().setAttribute("category","其他服务");
        }
        /**
         * 将类别放入request域中
         */
        Object category1 = request.getSession().getAttribute("category");
        System.out.println(category1);
        /**
         * 跳转界面
         */
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
