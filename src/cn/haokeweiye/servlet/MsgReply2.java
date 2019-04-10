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
@WebServlet("/msgReply2")
public class MsgReply2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取javabean对象
        request.setCharacterEncoding("UTF-8");
//		response.setContentType("charset=UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) request.getSession().getAttribute("user");
        if (user == null ){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }

        MessageDao messageDao = new MessageDao();

//        int id = Integer.parseInt(request.getParameter("id"));
        //获取到被回复的留言的ID
        String id = request.getParameter("id");

        //根据ID获取回复留言的审核状态
        try {
            Message message = messageDao.getState(id);
            String state = message.getState();
            if ("审核通过".equals(state)){
                response.sendRedirect("management");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //获取到回复的详细信息
        String reply = request.getParameter("reply");
        //获取到当前用户的用户名，在数据库中保存为回复者
        String userName = user.getUserName();
        //设置审核状态为未审核
        String state = "未审核";

        Message ms = new Message();

        int i = Integer.parseInt(id);
        //保存ID到message对象中
        ms.setid(i);
        //保存回复内容到message中
        ms.setReply(reply);
        //保存回复者到message中
        ms.setReplier(userName);
        //保存审核状态到message中
        ms.setState(state);


        try {
            messageDao.replyMsg(ms);
            response.sendRedirect("management");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
