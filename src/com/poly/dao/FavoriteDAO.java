package com.poly.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.bean.Favorite;

public class FavoriteDAO {
	private EntityManager em = Snippet.getEntityManager();

	public FavoriteDAO() {

	}

	@Override
	protected void finalize() throws Throwable {
		em.close();// dong EntiryManager khi DAO bi giai phong
		super.finalize();
	}

	public Favorite create(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	public Favorite update(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	public Favorite remove(String id) {
		try {
			Favorite entity = this.findById(id);
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	public Favorite findById(String id) {
		Favorite entity = em.find(Favorite.class, id);
		return entity;
	}

	public List<Favorite> findAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		List<Favorite> list = query.getResultList();
		return list;
	}

	// Đếm số lượng bản ghi trong user
	public double countAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		List<Favorite> list = query.getResultList();
		return list.size();
	}

	// Đếm số lượng trang cần hiện
	public List<Integer> countPage(double record, double max) {
		double sum = max / record;
		int newSum = (int) sum;
		if (sum % 2 != 0) {
			newSum = newSum + 1;
		}
		List<Integer> list = new ArrayList<>();
		for (int i = 0; i < newSum; i++) {
			list.add(i + 1);
		}
		return list;
	}

	// Phạm vi của trang
	public List<Favorite> pageOne(int first, int max) {
		// Câu lệnh truy vấn JPQL
		String jpql = "SELECT o FROM Favorite o";
		// Tạo đối tượng truy vấn
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setFirstResult((first - 1) * max);
		query.setMaxResults(max);
		// Truy vấn
		List<Favorite> list = query.getResultList();
		return list;
	}
}
