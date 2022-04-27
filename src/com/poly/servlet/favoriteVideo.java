package com.poly.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.poly.bean.Favorite;
import com.poly.bean.User;
import com.poly.dao.UserDAO;

/**
 * Servlet implementation class favoriteVideo
 */
@WebServlet({ "/favoriteVideo/index", "/video/like/*", "/video/share/*", "/favoriteVideo/unlike" })
public class favoriteVideo extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			forUserVideo(request, response);
		} else if (uri.contains("like")) {

		} else if (uri.contains("videoId")) {

		} else if (uri.contains("share")) {
			shareVideo(request, response);
		}
	}

	public void forUserVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// TODO: Load video
		String username = (String) session.getAttribute("username");
//		// Nạp persistence.xml và tạo EntityManagerFactory 
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			User user = em.find(User.class, username);
			List<Favorite> favorites = user.getFavorites();
			req.setAttribute("userId", user);
			req.setAttribute("videoLike", favorites);
			req.setAttribute("none", "block");
			req.setAttribute("backgroundColor", "#fe5252");
			req.setAttribute("color", "#fff");
			for (Favorite favorite : favorites) {
				System.out.println(favorite.getUser());
			}
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Error: " + e);
		}
		em.close();
		emf.close();
		System.out.println("Ra tới đây rồi nè !");
		req.getRequestDispatcher("/shop/favoriteVideo.jsp").forward(req, resp);
	}

	public void shareVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			req.setAttribute("message", "You are not logged in try again!");
			req.getRequestDispatcher("/shop/checkout.jsp").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			System.out.println("Dô đây rồi nè!");
			String id = session.getAttribute("username").toString();
			UserDAO dao = new UserDAO();
			User userShare = dao.findById(id);
			String from = userShare.getEmail();
			String nameSend = userShare.getFullname();
			String to = req.getParameter("toSend");
			String sub = "Video notification system from " + nameSend + " sharing for you!";
			String link = req.getParameter("link");
			sendMail(req, resp, to, link + " Their email " + from, sub);
			String uri = req.getRequestURI();
			if (uri.contains("videoMain")) {
				req.getRequestDispatcher("/PS16500_Lab6/videoMain").forward(req, resp);
			} else {
				req.getRequestDispatcher("/loadVideo").forward(req, resp);
			}
		}
	}

	public void sendMail(HttpServletRequest req, HttpServletResponse res, String to, String body, String subject) {
		try {
			req.setCharacterEncoding("UTF-8");
			res.setCharacterEncoding("UTF-8");
			// Thong so ket noi SMTP Server
			Properties p = new Properties();
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "587");
			// Ket noi SMTP Server
			Session s = Session.getInstance(p, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = "nhavtps16500@fpt.edu.vn";
					String password = "Vothanhnhavothanhnha123456789";
					return new PasswordAuthentication(username, password);
				}
			});
			String from = "nhavtps16500@fpt.edu.vn";
			// Tao message
			Message msg = new MimeMessage(s);
			msg.setFrom(new InternetAddress(from));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			msg.setSubject(subject);
			msg.setText(body);
			// msg.setReplyTo(msg.getFrom());
			// 3. Định nghia loai noi dung cua message
			MimeBodyPart textPart = new MimeBodyPart();
			textPart.setContent(body, "text/plain");
			// Gửi mail
			Transport.send(msg);
			req.setAttribute("message", "Chia sẽ link đến " + to + " thành công!");
		} catch (Exception ex) {
			req.setAttribute("message", "Gửi email thất bại !");
			System.out.print("Error:" + ex);
		}
	}
}
