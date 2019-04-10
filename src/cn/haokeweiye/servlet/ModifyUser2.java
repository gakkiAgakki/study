package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.UserDao;
import com.ndktools.javamd5.Mademd5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 对用户进行修改
 * Created by HASEE on 2019/3/30.
 */
@WebServlet("/modifyUser2")
public class ModifyUser2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取javabean对象
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getLevel() != 0 ){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        UserDao userDao = new UserDao();
        User user1 = new User();
//        int id = Integer.parseInt(request.getParameter("id"));
        String id = request.getParameter("id");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String keyword = request.getParameter("keyword");
        String description = request.getParameter("description");
        String level = request.getParameter("level");


        int i = Integer.parseInt(id);
        //判断密码是否被修改
        //根据ID获取密码
        try {
            User byId = userDao.findById(i);
            String password1 = byId.getPassword();
            if (password1.equals(password)){
                //执行修改其他字段
                user1.setId(i);
                user1.setUserName(userName);
                user1.setKeyword(keyword);
                user1.setDescription(description);
                user1.setLevel(Integer.parseInt(level));

                userDao.modifyNotPwd(user1);
                response.sendRedirect("findUser");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Mademd5 mademd5 = new Mademd5();
        String psw=mademd5.toMd5(password);



        user1.setId(i);
        user1.setUserName(userName);
        user1.setPassword(psw);
        user1.setKeyword(keyword);
        user1.setDescription(description);
        user1.setLevel(Integer.parseInt(level));


        try {
            userDao.modifyUser(user1);
            response.sendRedirect("findUser");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
