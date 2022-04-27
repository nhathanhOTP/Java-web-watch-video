package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.poly.bean.Video;
import com.poly.dao.VideoDAO;

/**
 * Servlet implementation class subVideo
 */
@WebServlet("/subVideo")
public class subVideo extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("btnmain");
		VideoDAO dao = new VideoDAO();
		Video video = new Video();
		video = dao.findById(id);
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			Query query = em.createNamedQuery("Report.random");
			List<Video> ds = query.getResultList();
			for (int i = 0; i < ds.size(); i++) {
				if (ds.get(i).getId().equals(video.getId())) {
					ds.remove(i);
					break;
				}
			}
			request.setAttribute("items", ds);
			request.setAttribute("itemVideo", video);
			// --------------------------------------------------------
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
			System.out.println("Thao tác dữ liệu thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Thao tác dữ liệu thất bại!");
		}
		request.getRequestDispatcher("shop/mainVideo.jsp").forward(request, response);

	}

}
