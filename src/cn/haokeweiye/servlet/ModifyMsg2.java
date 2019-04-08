package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.Message;
import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by HASEE on 2019/3/29.
 */
public class ModifyMsg2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取javabean对象
        request.setCharacterEncoding("UTF-8");
//		response.setContentType("charset=UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || (user.getLevel() != 0 && user.getLevel() != 1)){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }

//        int id = Integer.parseInt(request.getParameter("id"));
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        String mail = request.getParameter("mail");
        String unit = request.getParameter("unit");
        String site = request.getParameter("site");
        String content = request.getParameter("content");

        Message ms = new Message();

        int i = Integer.parseInt(id);
        ms.setid(i);
        ms.setname(name);
        ms.settitle(title);
        ms.settelephone(telephone);
        ms.setmail(mail);
        ms.setunit(unit);
        ms.setsite(site);
        ms.setcontent(content);

        MessageDao messageDao = new MessageDao();
        try {
            messageDao.modifyMsg(ms);
            response.sendRedirect("management");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
