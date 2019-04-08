package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.dao.UserDao;

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
@WebServlet("/delUsers")
public class DelUsers extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getLevel() != 0 ){
            req.setAttribute("message","非法访问");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }

        UserDao userDao = new UserDao();

        for (int i =0;i< req.getParameterValues("id").length;i++){
            String[] ids = req.getParameterValues("id");
//            for (int j = 0; j<(ids.length-1);j++){
                int i1 = Integer.parseInt(ids[i]);
                try {
                    User byId = userDao.findById(i1);
                    if (user.getUserName() == byId.getUserName()){
                        req.setAttribute("message","请使用其他账户删除此账户");
                        req.getRequestDispatcher("/message.jsp").forward(req, resp);
                        return;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
//            }

        }

        /**
         * 根据ID删除留言信息
         */
        //1.获取被删除留言ID
        String[] ids = req.getParameterValues("id");
        //2.调用dao
        try {
            userDao.delByIds(ids);
            //3.完成之后重新执行查询方法
            req.getRequestDispatcher("findUser").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
