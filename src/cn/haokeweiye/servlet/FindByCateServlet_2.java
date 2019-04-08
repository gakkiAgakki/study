package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.Message;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 根据category查询留言属于哪一部分的
 * Created by HASEE on 2019/4/1.
 */
//@WebServlet("/findByCateServlet")
public class FindByCateServlet_2 extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-type", "text/html;charset=UTF-8");

        //从session中获取user对象
        Object user = req.getSession().getAttribute("user");
        if (user == null){
            req.setAttribute("message","非法访问");
            req.getRequestDispatcher("/message.jsp").forward(req, resp);
            return;
        }


        MessageDao messageDao = new MessageDao();

        String category = req.getParameter("category");

        int cat = Integer.parseInt(category);
        /**
         * 对类别赋值
         */
        if (cat == 10){
            /**
             * 调用方法查询全部
             */
            try {
                List<Message> msgList = messageDao.findAll();
                /**
                 * 数据回显
                 */
                req.setAttribute("msgList",msgList);
                req.getRequestDispatcher("/management.jsp").forward(req, resp);
                return;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (cat == 1){
            category = "科技项目申报";
        }
        if (cat == 2){
            category = "科技成果转化";
        }
        if (cat == 3){
            category = "高新技术企业认定";
        }
        if (cat == 4){
            category = "技术中心/重点实验室";
        }
        if (cat == 5){
            category = "专精特新申报";
        }
        if (cat == 6){
            category = "技术改造申报";
        }
        if (cat == 7){
            category = "知识产权服务";
        }
        if (cat == 8){
            category = "入区申请";
        }
        if (cat == 9){
            category = "其他服务";
        }

        try {
            /**
             * 按条件查询后返回结果集
             */
            List<Message> messagesList = messageDao.findByCategory(category);
            req.setAttribute("msgList",messagesList);
            req.getRequestDispatcher("/management.jsp").forward(req,resp);
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
