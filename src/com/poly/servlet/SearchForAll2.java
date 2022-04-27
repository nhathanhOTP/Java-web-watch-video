//package com.poly.servlet;
//
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.sql.Date;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//import javax.persistence.Query;
//import javax.persistence.StoredProcedureQuery;
//import javax.persistence.TypedQuery;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.poly.bean.Favorite;
//import com.poly.bean.Report;
//import com.poly.bean.User;
//import com.poly.bean.Video;
//
//@WebServlet({ "/search/userId", "/search/titleVideo", "/search/videoId", "/search/favorite", "/search/favortieX",
//		"/search/index", "/search/random", "/search/comboBox", "/search/month-to-video-nq" })
//public class SearchForAll2 extends HttpServlet {
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		viewsVideo(request,response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String uri = request.getRequestURI();
//		if (uri.contains("userId")) {
//			forUserVideo(request, response);
//		} else if (uri.contains("titleVideo")) {
//			forFavoriteTitle(request, response);
//		} else if (uri.contains("videoId")) {
//			forIdVideo(request, response);
//		} else if (uri.contains("favorite")) {
//			favoriteRadio(request, response);
//		} else if (uri.contains("favortieX")) {
//			viewsVideo(request, response);
//		} else if (uri.contains("random")) {
//			randomVideo(request, response);
//		} else if (uri.contains("comboBox")) {
//			comboBoxToVideoNQ(request, response);
//		} else if (uri.contains("month-to-video-nq")) {
//			monthToVideoNQ(request, response);
//		} else if (uri.contains("table.jsp")) {
//			this.loadAllLike(request, response);
//		}
//
//	}
//
//	private void loadAllLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//	}
//
//	public void randomVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
//			// MÃƒ THAO TÃ�C
//			Query query = em.createNamedQuery("Report.random");
//			List<Video> list = query.getResultList();
//			for (int i = 0; i < list.size(); i++) {
//				System.out.println(list.get(i).getTitle());
//			}
//			req.setAttribute("videos", list);
//			// --------------------------------------------------------
//			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
//			System.out.println("Thao tác dữ liệu thành công!");
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
//			System.out.println("Thao tác dữ liệu thất bại!");
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/views/random.jsp").forward(req, resp);
//	}
//
//	public void forIdVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// Nạp persistence.xml và tạo EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Tạo EntityManager để bắt đầu làm việc với CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Bắt đầu Transaction
//			// MÃ THAO TÁC
//			String videoId = req.getParameter("videoId");
//			String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
//			TypedQuery<User> query = em.createQuery(jpql, User.class);
//			query.setParameter("vid", videoId);
//			List<User> list = query.getResultList();
//			req.setAttribute("users", list);
//			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Hủy thao tác
//			System.out.println("Error: " + e);
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/home/table.jsp").forward(req, resp);
//	}
//
//	public void forUserVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String username = req.getParameter("username");
//		// Nạp persistence.xml và tạo EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Tạo EntityManager để bắt đầu làm việc với CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Bắt đầu Transaction
//			// MÃ THAO TÁC
//			User user = em.find(User.class, username);
//			List<Favorite> favorites = user.getFavorites();
//			for (Favorite f : favorites) {
//				System.out.print("\n" + f.getId() + " - " + f.getUser().getFullname() + " - " + f.getLikeDate() + " - "
//						+ f.getVideo().getTitle());
//			}
//			req.setAttribute("user", user);
//			req.setAttribute("favorites", favorites);
//			req.setAttribute("none", "block");
//			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Hủy thao tác
//			System.out.println("Error: " + e);
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/views/userId.jsp").forward(req, resp);
//	}
//
//	public void forFavoriteTitle(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//		// Nạp persistence.xml và tạo EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Tạo EntityManager để bắt đầu làm việc với CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Bắt đầu Transaction
//			// MÃ THAO TÁC
//			String keyword = req.getParameter("keyword");
//			String jpql = "SELECT DISTINCT o.video FROM Favorite o " + " WHERE o.video.title LIKE :keyword";
//			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
//			query.setParameter("keyword", "%" + keyword + "%");
//			List<Video> list = query.getResultList();
//			System.out.println(list.size());
//			req.setAttribute("videos", list);
//			// --------------------------------------------------------
//			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Hủy thao tác
//			System.out.println("Error: " + e);
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/views/keyword.jsp").forward(req, resp);
//	}
//
//	public void favoriteRadio(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
//			// MÃƒ THAO TÃ�C
//			boolean favorite = Boolean.parseBoolean(req.getParameter("favorite"));
//			String jpql = "SELECT o FROM Video o WHERE o.favorites IS EMPTY";
//			if (favorite) {
//				jpql = "SELECT o FROM Video o WHERE o.favorites IS NOT EMPTY";
//			}
//			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
//			List<Video> list = query.getResultList();
//			req.setAttribute("videos", list);
//
//			// --------------------------------------------------------
//			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
//
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
//			System.out.println("Error: " + e);
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/views/favorite.jsp").forward(req, resp);
//	}
//
//	public void viewsVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setAttribute("report", getInfor());
//		System.out.println(getInfor().size());
//		req.setAttribute("none", "block");
//		// --------------------------------------------------------
//		req.getRequestDispatcher("/views/allLike.jsp").forward(req, resp);
//	}
//
//	public List<Report> getInfor() {
//		// Nạp persistence.xml và tạo EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Tạo EntityManager để bắt đầu làm việc với CSDL
//		EntityManager em = emf.createEntityManager();
//		// MÃ THAO TÁC
//		String jpql = "SELECT new Report(o.video.title,count(o)," + "max(o.likeDate),min(o.likeDate))"
//				+ "FROM Favorite o GROUP BY " + "o.video.title";
//		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
//		List<Report> list = query.getResultList();
//		return list;
//	}
//
//	public void comboBoxToVideoNQ(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		EntityManager em = emf.createEntityManager();
//		try {
//			Integer year = Integer.valueOf(req.getParameter("years"));
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
//			query.setParameter("Year", year);
//			List<Report> list = query.getResultList();
//
//			for (Report re : list) {
//				String strDate1 = format.format(re.getNewest());
//				String strDate2 = format.format(re.getOldest());
//				re.setNewest(Date.valueOf(strDate1));
//				re.setOldest(Date.valueOf(strDate2));
//			}
//			req.setAttribute("videos", list);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		req.getRequestDispatcher("/views/cboSearch.jsp").forward(req, resp);
//	}
//
//	public void monthToVideoNQ(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
//		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
//		EntityManager em = emf.createEntityManager();
//		try {
//			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
//			// MÃƒ THAO TÃ�C
//			System.out.println("do roi");
//			String[] values = req.getParameterValues("month");
//			List<Integer> months = new ArrayList<Integer>();
//			for (String month : values) {
//				months.add(Integer.valueOf(month));
//			}
//			TypedQuery<Video> query = em.createNamedQuery("Video.findInMonths", Video.class);
//			query.setParameter("months", months);
//			List<Video> list = query.getResultList();
//			req.setAttribute("videos", list);
//
//			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
//
//		} catch (Exception e) {
//			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
//			System.out.println("Error: " + e);
//		}
//		em.close();
//		emf.close();
//		req.getRequestDispatcher("/views/searchByMonth.jsp").forward(req, resp);
//	}
//
//}
package com.poly.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.bean.Favorite;
import com.poly.bean.Report;
import com.poly.bean.User;
import com.poly.bean.Video;
import com.poly.dao.UserDAO;

@WebServlet({ "/search/userId", "/search/userIds", "/search/titleVideo", "/search/videoId", "/search/favorite",
		"/search/favortieX", "/search/index", "/search/random", "/search/comboBox", "/search/month-to-video-nq" })
public class SearchForAll2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("reportAll", getInfor());
		// --------------------------------------------------------
		request.getRequestDispatcher("/admin/table.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		request.getSession().removeAttribute("reportAll");
		request.setAttribute("reportAll", getInfor());
		if (uri.contains("userIds")) {
			forUserVideo(request, response);
		} else if (uri.contains("titleVideo")) {
			forFavoriteTitle(request, response);
		} else if (uri.contains("videoId")) {
			forIdVideo(request, response);
		} else if (uri.contains("favorite")) {
			favoriteRadio(request, response);
		} else if (uri.contains("favortieX")) {
//			viewsVideo(request, response);
		} else if (uri.contains("random")) {
			randomVideo(request, response);
		} else if (uri.contains("comboBox")) {
			comboBoxToVideoNQ(request, response);
		} else if (uri.contains("month-to-video-nq")) {
			monthToVideoNQ(request, response);
		}
	}

	public void randomVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			Query query = em.createNamedQuery("Report.random");
			List<Video> list = query.getResultList();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getTitle());
			}
			req.setAttribute("videos", list);
			// --------------------------------------------------------
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
			System.out.println("Thao tác dữ liệu thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Thao tác dữ liệu thất bại!");
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

	public void forIdVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			String videoId = req.getParameter("videoId");
			String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("vid", videoId);
			List<User> list = query.getResultList();
			req.setAttribute("users", list);
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác

		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

	public void forUserVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("usernameId");
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			User user = em.find(User.class, username);
			List<Favorite> favorites = user.getFavorites();
			for (Favorite f : favorites) {
				System.out.print("\n" + f.getId() + " - " + f.getUser().getFullname() + " - " + f.getLikeDate() + " - "
						+ f.getVideo().getTitle());
			}
			req.setAttribute("userId", user);
			req.setAttribute("favoritesId", favorites);
			req.setAttribute("none", "block");
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

	public void forFavoriteTitle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			String keyword = req.getParameter("keyword");
			String jpql = "SELECT DISTINCT o.video FROM Favorite o " + " WHERE o.video.title LIKE :keyword";
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			query.setParameter("keyword", "%" + keyword + "%");
			List<Video> list = query.getResultList();
			System.out.println(list.size());
			req.setAttribute("videosTitle", list);
			// --------------------------------------------------------
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

	public void favoriteRadio(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Náº¡p persistence.xml vÃ  táº¡o EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			boolean favorite = Boolean.parseBoolean(req.getParameter("favorite"));
			String jpql = "SELECT o FROM Video o WHERE o.favorites IS EMPTY";
			if (favorite) {
				jpql = "SELECT o FROM Video o WHERE o.favorites IS NOT EMPTY";
			}
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			List<Video> list = query.getResultList();
			req.setAttribute("videosFavorite", list);

			// --------------------------------------------------------
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c

		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

	public List<Report> getInfor() {
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		// MÃ THAO TÁC
		String jpql = "SELECT new Report(o.video.title,count(o)," + "max(o.likeDate),min(o.likeDate))"
				+ "FROM Favorite o GROUP BY " + "o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		List<Report> list = query.getResultList();
		return list;
	}

	public void comboBoxToVideoNQ(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		EntityManager em = emf.createEntityManager();
		try {
			Integer year = Integer.valueOf(req.getParameter("years"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
			query.setParameter("Year", year);
			List<Report> list = query.getResultList();

			for (Report re : list) {
				String strDate1 = format.format(re.getNewest());
				String strDate2 = format.format(re.getOldest());
				re.setNewest(Date.valueOf(strDate1));
				re.setOldest(Date.valueOf(strDate2));
			}
			req.setAttribute("videosCbo", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
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
			req.setAttribute("videosMonth", list);

			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c

		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		req.getRequestDispatcher("/admin/table.jsp").forward(req, resp);
	}

}
