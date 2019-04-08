package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.UserDao;
import com.ndktools.javamd5.Mademd5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by HASEE on 2019/3/28.
 */
@WebServlet("/loginServlet")//请求路径,  如果配置了@WebServlet注解就不配置web.xml，两者二选一
public class LoginServlet extends HttpServlet {
    private static final int level = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**设置请求编码*/
        request.setCharacterEncoding("UTF-8");
        /**设置响应编码*/
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //获取MD5加密对象
        Mademd5 pwd = new Mademd5();
        //获取输入的用户名和密码
        String name = request.getParameter("userName");
        String pass = request.getParameter("password");
        System.out.println(name + "=======" + pass);
        try {
            pass = pwd.toMd5(request.getParameter("password"));
            System.out.println(pass);
        } catch (Exception e) {
            // TODO: handle exceptio
            e.printStackTrace();
        }
        User user = new User();
        //初始化dao层
        UserDao userDao = new UserDao();
        /**调用dao层的获取用户的方法*/
            /**
             * 若数据库没有用户
             */
        List<User> all = null;
        try {
            all = userDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (all.size() == 0) {

            name = "root";
            pass = "root";
//            int level = 0;

            pass = pwd.toMd5(pass);
            user.setUserName(name);
            user.setPassword(pass);
            user.setLevel(level);
            userDao.createUser(user);
            return;
        }
        try {
            user = userDao.findUserByName(name,pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(user);
        if (user == null){
            //获取session,将获取到的数据保存到session中
            HttpSession session = request.getSession();
            session.setAttribute("msg", "登录失败");
            //重定向，跳转到成功页面
            response.sendRedirect("/login.jsp");

        }else {
            //获取session,将获取到的数据保存到session中
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            //重定向，跳转到成功页面
            response.sendRedirect("management");
        }

    }
}
