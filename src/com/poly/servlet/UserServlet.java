package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.bean.User;
import com.poly.dao.UserDAO;

@WebServlet({ "/user/index", "/user/edit/*", "/user/create", "/user/update", "/user/delete", "/user/page" })
public class UserServlet extends HttpServlet {
	@Override	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		User user = new User();
		String uri = req.getRequestURI();

		if (uri.contains("edit")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			user = dao.findById(id);
		} else if (uri.contains("create")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.create(user);
				req.setAttribute("message", "Thêm mới thành công");
			} catch (Exception e) {
				req.setAttribute("message", "Thêm mới thất bại");
			}
		} else if (uri.contains("update")) {
			try {
				BeanUtils.populate(user, req.getParameterMap());
				dao.update(user);
				req.setAttribute("message", "Cập nhật thành công");
			} catch (Exception e) {
				req.setAttribute("message", "Cập nhật thất bại");
			}
		} else if (uri.contains("delete")) {
			try {
				String id = req.getParameter("id");
				dao.remove(id);
				req.setAttribute("message", "Xóa thành công");
			} catch (Exception e) {
				req.setAttribute("message", "Xóa thất bại");
			}
		}
		if (uri.contains("page")) {
			String numberPage = req.getParameter("numberPage");
			List<User> list = dao.pageOne(Integer.parseInt(numberPage), 10);
			req.setAttribute("form", user);
			req.setAttribute("number", dao.countPage(10, dao.countAll()));
			req.setAttribute("items", list);
			req.getRequestDispatcher("/admin/tabPanel.jsp").forward(req, resp);
		} else {
			req.setAttribute("number", dao.countPage(10, dao.countAll()));
			req.setAttribute("items", dao.pageOne(1, 10));
			req.setAttribute("form", user);
			req.getRequestDispatcher("/admin/tabPanel.jsp").forward(req, resp);
		}

	}
}
