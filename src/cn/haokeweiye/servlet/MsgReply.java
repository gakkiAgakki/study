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
 *      User: HASEE
 *      Date: 2019/4/9
 *      Time: 9:40
 *      回复用户留言
 */
@WebServlet("/msgReply")
public class MsgReply extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) req.getSession().getAttribute("user");
        System.out.println("modifyMsg" + user);
        if (user == null ){
            req.setAttribute("message","非法访问");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        MessageDao messageDao = new MessageDao();
        /**
         * 根据ID修改留言信息
         */
        //1.获取被修改留言ID
        int id = Integer.parseInt(req.getParameter("id"));
        //2.调用dao查询该留言信息
        try {
            Message message = messageDao.findById(id);
            req.setAttribute("message",message);
            //3.完成之后重新执行查询方法
            req.getRequestDispatcher("/msgReply.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
