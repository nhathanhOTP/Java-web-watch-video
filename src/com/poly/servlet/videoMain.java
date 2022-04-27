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
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.bean.Video;
import com.poly.dao.VideoDAO;

/**
 * Servlet implementation class videoMain
 */
@WebServlet("/videoMain")
public class videoMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public videoMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("shop/mainVideo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Xóa thông báo cũ
		HttpSession session = request.getSession();
		session.setAttribute("message",""); 
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
			// --------------------------------------------------------
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Thao tác dữ liệu thất bại!");
		}
		request.setAttribute("itemVideo", video);
		request.getRequestDispatcher("shop/mainVideo.jsp").forward(request, response);
	}

	public List<Video> selectAll() {
//		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		List<Video> list = null;
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM Video o";
			// Tạo đối tượng truy vấn
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			// Truy vấn
			list = query.getResultList();
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Truy vấn dữ liệu thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Truy vấn dữ liệu thất bại!");
		}
		em.close();
		emf.close();
		return list;
	}

}
