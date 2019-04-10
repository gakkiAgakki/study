package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.Message;
import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by HASEE on 2019/3/29.
 */
@WebServlet("/replyState2")
public class ReplyState2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取javabean对象
        request.setCharacterEncoding("UTF-8");
//		response.setContentType("charset=UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) request.getSession().getAttribute("user");
//        if (user == null || (user.getLevel() != 0 && user.getLevel() != 1)){
        if (user == null || user.getLevel() == 2){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }

//        int id = Integer.parseInt(request.getParameter("id"));
        //获取到被回复的留言的ID
        String id = request.getParameter("id");
        //获取审核状态
        String state = request.getParameter("state");

//        if (state == "0"){
//            state = "通过";
//        }else {
//            state = "未通过";
//        }

        Message ms = new Message();

        int i = Integer.parseInt(id);
        //保存ID到message对象中
        ms.setid(i);
        //保存审核状态到message中
        ms.setState(state);

        MessageDao messageDao = new MessageDao();
        try {
            messageDao.replyState(ms);
            response.sendRedirect("management");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
