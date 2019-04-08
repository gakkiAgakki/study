package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.UserDao;
import com.ndktools.javamd5.Mademd5;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 创建用户，由本系统的管理员创建
 * Created by HASEE on 2019/3/30.
 */
public class CreateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**设置请求编码*/
        request.setCharacterEncoding("UTF-8");
        /**设置响应编码*/
        response.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = new User();
        user = (User) request.getSession().getAttribute("user");
        //判空及确认该用户的等级
        if (user == null || user.getLevel() != 0){
            request.setAttribute("message","非法访问");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }


        //获取MD5加密对象
        Mademd5 pwd = new Mademd5();
        //获取输入的用户名和密码，关键字，描述
        String name = request.getParameter("userName");
        String pass = request.getParameter("password");
        String keyword = request.getParameter("keyword");
        String description = request.getParameter("description");
        String level = request.getParameter("level");

        /**
         * 赋值给user对象
         */
        User newUser = new User();
        newUser.setUserName(name);
        newUser.setPassword(pass);
        newUser.setKeyword(keyword);
        newUser.setDescription(description);
        newUser.setLevel(Integer.parseInt(level));

        //查询用户名
        //初始化dao层
        UserDao userDao = new UserDao();
        try {
            User user1 = userDao.findByName(newUser.getUserName());
            //判断是否有该用户
            if (user1 != null){
                request.setAttribute("message","用户已存在");
                request.getRequestDispatcher("/message.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            /**
             * 将密码进行加密
             */
            pass = pwd.toMd5(pass);
            newUser.setPassword(pass);
            System.out.println(pass);
        } catch (Exception e) {
            // TODO: handle exceptio
            e.printStackTrace();
        }




        /**调用dao层的获取用户的方法*/
        try {
            /**
             * 若数据库没有用户
             */

            if (userDao.createUser(newUser)){

                //重定向，跳转到成功页面
                response.sendRedirect("successCreat.jsp") ;

            }else {
                request.setAttribute("message","创建失败");
                request.getRequestDispatcher("/message.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
