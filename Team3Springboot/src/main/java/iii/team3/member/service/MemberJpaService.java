package iii.team3.member.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iii.team3.member.dao.MemberJpaRepository;
import iii.team3.member.model.MemberBean;

@Service
@Transactional
public class MemberJpaService {
	@Autowired
	private MemberJpaRepository memberJpaRepository;
	
	public void inserData(MemberBean memberBean) {
		memberJpaRepository.save(memberBean);
	}
	
	public MemberBean findById(Integer id) {
		Optional<MemberBean> optional = memberJpaRepository.findById(id);
		return optional.get();
	}
	
	public List<MemberBean> findAllBeans() {
		List<MemberBean> Members = memberJpaRepository.findAll();
		return Members;
	}
	
	public MemberBean findByAccount(String acc) {
		return memberJpaRepository.findByAccount(acc);
	}
	
	public String findPwByAccount(String acc) {
		return memberJpaRepository.findPwByAccount(acc);
	}
	
	public void updateData(MemberBean b) {
		memberJpaRepository.save(b);
	}
	
	public void deleteData(Integer id) {
		memberJpaRepository.deleteById(id);
	}
	public List<MemberBean> findByEmail(String email){
		return memberJpaRepository.findByEmail(email);
	}
}
