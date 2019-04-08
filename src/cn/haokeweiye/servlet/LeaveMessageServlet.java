package cn.haokeweiye.servlet;

import cn.haokeweiye.bean.Message;
import cn.haokeweiye.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LeaveMessageServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
//		response.setContentType("charset=UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");



		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String mail = request.getParameter("mail");
		String unit = request.getParameter("unit");
		String site = request.getParameter("site");
		String content = request.getParameter("content");

		String category = (String) request.getSession().getAttribute("category");

		String accessory = (String) request.getSession().getAttribute("accessory");


		Message ms = new Message();

		ms.setname(name);
		ms.settitle(title);
		ms.settelephone(telephone);
		ms.setmail(mail);
		ms.setunit(unit);
		ms.setsite(site);
		ms.setcontent(content);
		ms.setcategory(category);

		ms.setaccessory(accessory);

		MessageDao messageDao = new MessageDao();

		if(messageDao.addInfo(ms)){
			request.getSession().setAttribute("accessory",null);
			request.getSession().getAttribute("accessory");
			response.sendRedirect("success.jsp") ;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
