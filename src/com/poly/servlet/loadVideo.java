package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.bean.*;
import com.poly.dao.*;

/**
 * Servlet implementation class loadVideo
 */
@WebServlet({ "/loadVideo", "/page" })
public class loadVideo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Táº¡o EntityManager Ä‘á»ƒ báº¯t Ä‘áº§u lÃ m viá»‡c vá»›i CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Báº¯t Ä‘áº§u Transaction
			// MÃƒ THAO TÃ�C
			Query query = em.createNamedQuery("Report.random");
			List<Video> list = query.getResultList();
			request.setAttribute("items", list);
			// --------------------------------------------------------
			em.getTransaction().commit(); // Cháº¥p nháº­n káº¿t quáº£ thao tÃ¡c
			System.out.println("Thao tác dữ liệu thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Há»§y thao tÃ¡c
			System.out.println("Thao tác dữ liệu thất bại!");
		}

		request.getRequestDispatcher("shop/index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
