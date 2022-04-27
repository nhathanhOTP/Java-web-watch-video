package com.poly.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.bean.Report;
import com.poly.bean.User;
import com.poly.bean.Video;

/**
 * Servlet implementation class SearchForAll3
 */
@WebServlet({ "/search1/index", "/search1/titleVideo", "/search1/videoId", "/search1/favorite", "/search1/favortieX",
		"/search1/userId", "/search1/date" })
public class SearchForAll3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("date")) {
			dateToVideoNQ(request, response);
		}

	}

	public List<Video> getInfor(HttpServletRequest req) {
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		// MÃ THAO TÁC
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		TypedQuery<Video> query = em.createNamedQuery("Video.findInRange", Video.class);
		query.setParameter("min", startDate);
		query.setParameter("max", endDate);
		List<Video> list = query.getResultList();
		return list;
	}

	public void dateToVideoNQ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			String dateOld = req.getParameter("startDate");
			String dateNew = req.getParameter("endDate");
			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(dateOld);
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(dateNew);
			TypedQuery<Video> query = em.createNamedQuery("Video.findInRange", Video.class);
			query.setParameter("min", date1);
			query.setParameter("max", date2);
			List<Video> list = query.getResultList();
			req.setAttribute("videos", list);
			req.setAttribute("none", "block");
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c

		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/views/searchFromDate.jsp").forward(req, resp);
	}

	public void userToVideoNQ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			String id = req.getParameter("username");
			TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
			query.setParameter("id", id);
			List<Video> list = query.getResultList();
			User user = em.find(User.class, id);
			req.setAttribute("user", user);
			req.setAttribute("videos", list);
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c

		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/views/bai2.jsp").forward(req, resp);
	}

	public void monthToVideoNQ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			System.out.println("do roi");
			String[] values = req.getParameterValues("month");
			List<Integer> months = new ArrayList<Integer>();
			for (String month : values) {
				months.add(Integer.valueOf(month));
			}
			TypedQuery<Video> query = em.createNamedQuery("Video.findInMonths", Video.class);
			query.setParameter("months", months);
			List<Video> list = query.getResultList();
			req.setAttribute("videos", list);
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/views/bai2.jsp").forward(req, resp);
	}

	public void comboBoxToVideoNQ(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			Integer year = Integer.valueOf(req.getParameter("year"));
			StoredProcedureQuery query = em.createStoredProcedureQuery("Report.favoriteByYear");
			query.setParameter("Year", year);
//		query.setParameter("year", year);
			List<Video> list = query.getResultList();
			req.setAttribute("videos", list);
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c

		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/views/bai2.jsp").forward(req, resp);
	}

}
