package com.poly.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.bean.User;
import com.poly.dao.UserDAO;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet({ "/account/sign-up", "/account/sign-in", "/account/sign-out", "/account/forgot-password",
		"/account/change-password", "/account/edit-profile", "/account/loadProfile" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("sign-in")) {
			this.doSignIn(req, resp);
		} else if (uri.contains("sign-up")) {
			this.doSignUp(req, resp);
		} else if (uri.contains("sign-out")) {
			this.doSignOut(req, resp);
		} else if (uri.contains("forgot-password")) {
		} else if (uri.contains("change-password")) {
		} else if (uri.contains("edit-profile")) {
			this.doEditProfile(req, resp);
		} else if (uri.contains("loadProfile")) {
			this.doLoadProfile(req, resp);
		}
	}

	private void doLoadProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		HttpSession session = req.getSession();
		// TODO: Load video
		String id = req.getSession().getAttribute("username").toString();

		try {
			UserDAO dao = new UserDAO();
			User user = dao.findById(id);
			if (!user.getId().equals("")) {
				req.setAttribute("user", user);
				System.out.println("Gán dữ liệu được rồi nè");
				System.out.println(user.getId());
			}
		} catch (Exception e) {
			req.getRequestDispatcher("/shop/editFile.jsp").forward(req, resp);
		}
		req.getRequestDispatcher("/shop/editFile.jsp").forward(req, resp);

	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		HttpSession session = req.getSession();
		if (method.equalsIgnoreCase("POST")) {
			// TODO: ĐĂNG NHẬP
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			try {
				UserDAO dao = new UserDAO();
				User user = dao.findById(id);
				if (!user.getPassword().equals(pw)) {
					req.setAttribute("message", "Sai mật khẩu!");
					req.getRequestDispatcher("/shop/checkout.jsp").forward(req, resp);
				}
				if (user.getPassword().equals(pw)) {
					req.setAttribute("message", "Đăng nhập thành công!");
					req.getSession().setAttribute("user", user);
					session.setAttribute("username", user.getId());
					session.setAttribute("password", user.getPassword());
					session.setAttribute("fullname", user.getFullname());
					session.setAttribute("display1", "block");
					session.setAttribute("display2", "none");
					System.out.println(session.getAttribute("username"));
					if (user.getAdmin() != true) {
						RequestDispatcher rd = req.getRequestDispatcher("/loadVideo");
						rd.forward(req, resp);
					} else {
						RequestDispatcher rd = req.getRequestDispatcher("/user/index");
						rd.forward(req, resp);
					}
				}
			} catch (Exception e) {
				req.setAttribute("message", "Tên đăng nhập không tồn tại!\n Plese try again!");
				req.getRequestDispatcher("/shop/checkout.jsp").forward(req, resp);
			}
		}

	}

	private void doSignOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		HttpSession session = req.getSession();
		// TODO: Đăng xuất
		req.setAttribute("message", "Bạn đã đăng xuất !");
		session.removeAttribute("display1");
		session.removeAttribute("display2");
		session.removeAttribute("user");
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.removeAttribute("fullname");
		session.setAttribute("display1", "none");
		session.setAttribute("display2", "block");

		req.getRequestDispatcher("/loadVideo").forward(req, resp);
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			// TODO: ĐĂNG KÝ
			try {
				req.getSession().removeAttribute("message");
				User entity = new User();
				BeanUtils.populate(entity, req.getParameterMap());
				UserDAO dao = new UserDAO();
				dao.create(entity);
				System.out.println("Đăng ký thành công!");
				req.setAttribute("message", "Sign Up Success!\n You can login");
				req.getRequestDispatcher("/shop/checkout.jsp").forward(req, resp);
				return;
			} catch (Exception e) {
				req.getSession().removeAttribute("message");
				System.out.println("Lỗi đăng ký!");
				req.setAttribute("message", "Error Sign Up!");
				req.getRequestDispatcher("/shop/checkout2.jsp").forward(req, resp);

			}
		}
	}

	private void doEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		HttpSession session = req.getSession();
		if (method.equalsIgnoreCase("POST")) {
			// TODO: CẬP NHẬT
			try {
				User user = new User();
				UserDAO dao = new UserDAO();
				BeanUtils.populate(user, req.getParameterMap());
				dao.update(user);
				session.removeAttribute("fullname");
				session.setAttribute("fullname", user.getFullname());
				req.setAttribute("message", "Cập nhật thành công");
				req.setAttribute("user", user);
			} catch (Exception e) {
				req.setAttribute("message", "Cập nhật thất bại");
				System.out.println(e);
			}

		}

		req.getRequestDispatcher("/shop/editFile.jsp").forward(req, resp);
	}

}
