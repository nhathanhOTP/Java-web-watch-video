package com.poly.main;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.bean.Favorite;
import com.poly.bean.Report;
import com.poly.bean.User;
import com.poly.bean.Video;

public class TestConsole {
	public static void main(String[] args) {
		// Nạp persistence.xml và tạo EntityManagerFactory
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			
			System.out.print("---------------------");
			List<Favorite> likes = em.find(User.class, "teolv").getFavorites();
			for(Favorite f : likes) {
				System.out.print("\n"+f.getId()+" - "+f.getUser().getFullname()+" - "+f.getLikeDate()+" - "+
						f.getVideo().getTitle());				
			}
			
			/*
			//................................................
			//Truy van cac video duoc yeu thich boi User co id ???
			String jpql ="SELECT o.video FROM Favorite o WHERE o.user.id =:uid";
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			query.setParameter("uid", "teolv");
			List<Video> videos = query.getResultList();
			for(Video v : videos) {
				System.out.print("\n"+v.getId() +" - "+v.getTitle()+" - "+v.getPoster()+" - "+
						v.getViews()+" - "+v.getActive());				
			}	
		*/
			/*
			//....................................			
			String jpql ="SELECT new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate))"
					+ " FROM Favorite o GROUP BY o.video.title";
			TypedQuery<Report> query = em.createQuery(jpql, Report.class);
			List<Report> list = query.getResultList();
			for(Report rp : list) {
				System.out.print("\n"+rp.getGroup() +" - "+ rp.getLikes()+" - "+rp.getNewest()+" - "+
						rp.getOldest());				
			}	
			*/
			/*
			//............ @NamedQuery .................			
			TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
			List<User> list = query.getResultList();
			for(User u : list) {
				System.out.print("\n"+u.getId() +"\t"+u.getFullname()+"\t"+u.getEmail()+"\t"+
						u.getAdmin()+"\t"+u.getPassword());				
			}		
		*/
			
			
			// SQL - truy van dac thu
		/*	String sql = "SELECT * FROM Users WHERE email LIKE ?";
			Query query  = em.createNativeQuery(sql, User.class);
			query.setParameter(1, "%@gmail.com");
			List<User> list = query.getResultList();
			for(User u : list) {
				System.out.print("\n"+u.getId() +" \t"+u.getFullname()+"\t"+u.getPassword() +"\t"+
						u.getAdmin()+"\t"+u.getEmail());				
			}
			*/
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác			
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Error: "+e);
		}
		em.close();
		emf.close();		
	}
}
