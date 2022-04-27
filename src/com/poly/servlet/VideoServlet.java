package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.bean.User;
import com.poly.bean.Video;
import com.poly.dao.VideoDAO;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet({ "/VideoServlet/index","/video/edit/*", "/video/update", "/video/create", "/video/delete", "/video/reset", "/video/page" })
public class VideoServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		Video video = new Video();
		String uri = req.getRequestURI();
		if (uri.contains("edit")) {
			String idVd = uri.substring(uri.lastIndexOf("/") + 1);
			System.out.println(idVd); 
			video = dao.findById(idVd);
			System.out.println(video.getDescription()); 
		} else if (uri.contains("create")) {
			try {
				BeanUtils.populate(video, req.getParameterMap());
				dao.create(video);
				req.setAttribute("message", "Thêm mới thành công");
			} catch (Exception e) {
				req.setAttribute("message", "Thêm mới thất bại");
			}
		} else if (uri.contains("update")) {
			try {
				BeanUtils.populate(video, req.getParameterMap());
				dao.update(video);
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
			List<Video> list = dao.pageOne(Integer.parseInt(numberPage), 10);
			req.setAttribute("form", video);
			req.setAttribute("number", dao.countPage(10, dao.countAll()));
			req.setAttribute("items", list);
			for (Video vi : list) {
				System.out.println(vi.getTitle());
			}
			req.getRequestDispatcher("/admin/form.jsp").forward(req, resp);
		} else {
			req.setAttribute("number", dao.countPage(10, dao.countAll()));
			req.setAttribute("items", dao.pageOne(1, 10));
			req.setAttribute("form", video);
			req.getRequestDispatcher("/admin/form.jsp").forward(req, resp);
		}
//		}
	}
}
