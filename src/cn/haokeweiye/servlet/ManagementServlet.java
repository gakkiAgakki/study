package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.PageBean;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by HASEE on 2019/3/28.
 */
public class ManagementServlet extends HttpServlet {

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
//        try {
//            List<Message> msgList = messageDao.findAll();
//            req.setAttribute("msgList",msgList);
//            req.getRequestDispatcher("/management.jsp").forward(req, resp);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        //获取当前页码数
        String pageNumStr = req.getParameter("pageNum");
        //判断是否是第一次访问
        int pageNum;
        //是则让页码等于一
        if (pageNumStr == null){
            pageNum = 1;
        }else {     //将页码数转换为int类型
            pageNum = Integer.parseInt(pageNumStr);
        }
        //设置每页显示条数
        int rows = 10;
        //DAO层
        try {
            PageBean pageBean = new PageBean();
            pageBean.setPageNum(pageNum);
            pageBean.setRows(rows);
            //开始索引
            int start = (pageNum - 1) * rows;
            pageBean.setStartIndex(start);
            //获取总条数
            int totalRecord = messageDao.getCount();
            //总记录数
            pageBean.setTotalRecord(totalRecord);
            //总页数
            pageBean.setPages(totalRecord % rows == 0 ? totalRecord /rows : totalRecord / rows + 1);
            pageBean.setpList(messageDao.findByPage(start));
            req.setAttribute("pb",pageBean);
            req.getRequestDispatcher("management-3.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
