package iii.team3.member.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import iii.team3.member.model.MemberBean;

public interface MemberJpaRepository extends JpaRepository<MemberBean, Integer> {

	public MemberBean findByAccount(String acc);
	
	@Query(value ="SELECT m.password FROM MemberBean m WHERE m.account = ?1")
	public String findPwByAccount(String acc);
	
	public List<MemberBean> findByEmail(String email);
	
}
