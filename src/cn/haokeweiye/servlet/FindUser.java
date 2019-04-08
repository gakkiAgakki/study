package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by HASEE on 2019/3/30.
 */
@WebServlet("/findUser")
public class FindUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**设置请求编码*/
        request.setCharacterEncoding("UTF-8");
        /**设置响应编码*/
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getLevel() != 0 ){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        /**
         * 查询所有的用户
         */
        UserDao userDao = new UserDao();
        try {
            List<User> userList = userDao.findAll();
            request.setAttribute("userList",userList);
            request.getRequestDispatcher("/allUsers.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
