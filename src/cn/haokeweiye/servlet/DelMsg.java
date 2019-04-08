package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 删除留言信息
 * Created by HASEE on 2019/3/29.
 */
public class DelMsg extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) req.getSession().getAttribute("user");
        /**
         * 判空，确认权限
         */
        System.out.println("delmsg"+"========"+user.getLevel() + "========"+user);
        if (user == null || (user.getLevel() != 0 && user.getLevel() != 1)){
            req.setAttribute("message","非法访问");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }
        MessageDao messageDao = new MessageDao();
        /**
         * 根据ID删除留言信息
         */
        //1.获取被删除留言ID
        String id = req.getParameter("id");
        //2.调用dao
        try {
            messageDao.delById(id);
            //3.完成之后重新执行查询方法
            req.getRequestDispatcher("/management").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
