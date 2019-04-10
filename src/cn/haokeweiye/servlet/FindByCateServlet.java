package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.PageBean;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 根据category查询留言属于哪一部分的
 * 并进行分页
 * Created by HASEE on 2019/4/1.
 */
@WebServlet("/findByCateServlet")
public class FindByCateServlet extends HttpServlet{

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

        //从前端页面获取category
        String category = req.getParameter("category");
        //从session中获取findByCategory
        String findByCategory = (String) req.getSession().getAttribute("findByCategory");
        if (findByCategory != null) {
            if (category != null) {
                if (findByCategory == category) {    //相等直接进行分页条件查询 ,session中有且等于页面中的
                    int cat = Integer.parseInt(findByCategory);
                    /**
                     * 对类别赋值
                     */
                    if (cat == 10 || cat == 0) {
                        /**
                         * 调用方法查询全部
                         */
                        //获取当前页码数
                        String pageNumStr = req.getParameter("pageNum");
                        //判断是否是第一次访问
                        int pageNum;
                        //是则让页码等于一
                        if (pageNumStr == null) {
                            pageNum = 1;
                        } else {     //将页码数转换为int类型
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
                            pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                            pageBean.setpList(messageDao.findByPage(start));
                            req.setAttribute("pb", pageBean);
                            req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                            return;
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (cat == 1) {
                        category = "科技项目申报";
                    }
                    if (cat == 2) {
                        category = "科技成果转化";
                    }
                    if (cat == 3) {
                        category = "高新技术企业认定";
                    }
                    if (cat == 4) {
                        category = "技术中心/重点实验室";
                    }
                    if (cat == 5) {
                        category = "专精特新申报";
                    }
                    if (cat == 6) {
                        category = "技术改造申报";
                    }
                    if (cat == 7) {
                        category = "知识产权服务";
                    }
                    if (cat == 8) {
                        category = "入区申请";
                    }
                    if (cat == 9) {
                        category = "其他服务";
                    }

                    //获取当前页码数
                    String pageNumStr = req.getParameter("pageNum");
                    //判断是否是第一次访问
                    int pageNum;
                    //是则让页码等于一
                    if (pageNumStr == null) {
                        pageNum = 1;
                    } else {     //将页码数转换为int类型
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
                        int totalRecord = messageDao.getCategoryByCount(category);
                        //总记录数
                        pageBean.setTotalRecord(totalRecord);
                        //总页数
                        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                        pageBean.setpList(messageDao.findCategoryByPage(category, start));
                        req.setAttribute("pb", pageBean);
                        req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                        return;
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } else {         //如果不相等，重新赋值之后再进行查询
                    findByCategory = category;      //页面中没有
                    req.getSession().setAttribute("findByCategory",findByCategory);
                    int cat = Integer.parseInt(findByCategory);
                    /**
                     * 对类别赋值
                     */
                    if (cat == 10 || cat == 0) {
                        /**
                         * 调用方法查询全部
                         */
                        //获取当前页码数
                        String pageNumStr = req.getParameter("pageNum");
                        //判断是否是第一次访问
                        int pageNum;
                        //是则让页码等于一
                        if (pageNumStr == null) {
                            pageNum = 1;
                        } else {     //将页码数转换为int类型
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
                            pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                            pageBean.setpList(messageDao.findByPage(start));
                            req.setAttribute("pb", pageBean);
                            req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                            return;
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (cat == 1) {
                        category = "科技项目申报";
                    }
                    if (cat == 2) {
                        category = "科技成果转化";
                    }
                    if (cat == 3) {
                        category = "高新技术企业认定";
                    }
                    if (cat == 4) {
                        category = "技术中心/重点实验室";
                    }
                    if (cat == 5) {
                        category = "专精特新申报";
                    }
                    if (cat == 6) {
                        category = "技术改造申报";
                    }
                    if (cat == 7) {
                        category = "知识产权服务";
                    }
                    if (cat == 8) {
                        category = "入区申请";
                    }
                    if (cat == 9) {
                        category = "其他服务";
                    }

                    //获取当前页码数
                    String pageNumStr = req.getParameter("pageNum");
                    //判断是否是第一次访问
                    int pageNum;
                    //是则让页码等于一
                    if (pageNumStr == null) {
                        pageNum = 1;
                    } else {     //将页码数转换为int类型
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
                        int totalRecord = messageDao.getCategoryByCount(category);
                        //总记录数
                        pageBean.setTotalRecord(totalRecord);
                        //总页数
                        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                        pageBean.setpList(messageDao.findCategoryByPage(category, start));
                        req.setAttribute("pb", pageBean);
                        req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                        return;
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {     //session中有category中没有
                int cat = Integer.parseInt(findByCategory);
                /**
                 * 对类别赋值
                 */
                if (cat == 10 || cat == 0) {
                    /**
                     * 调用方法查询全部
                     */
                    //获取当前页码数
                    String pageNumStr = req.getParameter("pageNum");
                    //判断是否是第一次访问
                    int pageNum;
                    //是则让页码等于一
                    if (pageNumStr == null) {
                        pageNum = 1;
                    } else {     //将页码数转换为int类型
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
                        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                        pageBean.setpList(messageDao.findByPage(start));
                        req.setAttribute("pb", pageBean);
                        req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                        return;
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (cat == 1) {
                    category = "科技项目申报";
                }
                if (cat == 2) {
                    category = "科技成果转化";
                }
                if (cat == 3) {
                    category = "高新技术企业认定";
                }
                if (cat == 4) {
                    category = "技术中心/重点实验室";
                }
                if (cat == 5) {
                    category = "专精特新申报";
                }
                if (cat == 6) {
                    category = "技术改造申报";
                }
                if (cat == 7) {
                    category = "知识产权服务";
                }
                if (cat == 8) {
                    category = "入区申请";
                }
                if (cat == 9) {
                    category = "其他服务";
                }

                //获取当前页码数
                String pageNumStr = req.getParameter("pageNum");
                //判断是否是第一次访问
                int pageNum;
                //是则让页码等于一
                if (pageNumStr == null) {
                    pageNum = 1;
                } else {     //将页码数转换为int类型
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
                    int totalRecord = messageDao.getCategoryByCount(category);
                    //总记录数
                    pageBean.setTotalRecord(totalRecord);
                    //总页数
                    pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
                    pageBean.setpList(messageDao.findCategoryByPage(category, start));
                    req.setAttribute("pb", pageBean);
                    req.getRequestDispatcher("management-2.jsp").forward(req, resp);
                    return;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
            if (category == null){      //页面中没有且session也没有
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
                    req.getRequestDispatcher("management-2.jsp").forward(req,resp);
                    return;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else {     //从页面获取到了category且session中没有
                findByCategory = category;
                //往session中赋值
                req.getSession().setAttribute("findByCategory",findByCategory);
                int cat = Integer.parseInt(findByCategory);
                /**
                 * 对类别赋值
                 */
                if (cat == 10 || cat == 0){
                    /**
                     * 调用方法查询全部
                     */
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
                        req.getRequestDispatcher("management-2.jsp").forward(req,resp);
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
                    int totalRecord = messageDao.getCategoryByCount(category);
                    //总记录数
                    pageBean.setTotalRecord(totalRecord);
                    //总页数
                    pageBean.setPages(totalRecord % rows == 0 ? totalRecord /rows : totalRecord / rows + 1);
                    pageBean.setpList(messageDao.findCategoryByPage(category,start));
                    req.setAttribute("pb",pageBean);
                    req.getRequestDispatcher("management-2.jsp").forward(req,resp);
                    return;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
