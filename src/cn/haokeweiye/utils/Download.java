package cn.haokeweiye.utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

/**
 * Created by HASEE on 2019/4/3.
 */
@WebServlet("/download")
public class Download extends HttpServlet {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
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
        /**
         * 获取到要下载的文件名
         */
        String fileName = req.getParameter("downFile");
        fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");

        /**
         * 文件存储路径
         */
        String fileSavePath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        //要下载的文件
        File file = new File(fileSavePath + File.separator + fileName);
        //如果文件不存在
        if (!file.exists()){
            resp.getWriter().write("false");
            return;
        }
        //设置响应头,控制浏览器下载该文件
        resp.setHeader("content-disposition","attachment;filename*=UTF-8''" + URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"));
        //读取要下载的文件,保存到文件输入流
        FileInputStream in = new FileInputStream(fileSavePath + File.separator + fileName);
        //创建输出流
        OutputStream out = resp.getOutputStream();
        //创建缓冲区
        byte buffer[] = new byte[1024 * 1024];
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        while(0<=(len=in.read(buffer))){
            //输出缓冲区的内容到浏览器,实现文件下载
            out.write(buffer, 0, len);
        }
        //关闭文件输入输出流
        out.close();
        in.close();

    }
}
