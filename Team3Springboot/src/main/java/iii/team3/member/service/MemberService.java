package iii.team3.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.member.dao.MemberDAO;
import iii.team3.member.model.MemberBean;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberDAO dao;

	public MemberService() {
	}
	
	public void inserData(MemberBean b) {		
			dao.inserData(b);			
	}
	
	public MemberBean findByID(Integer id) {
		MemberBean idBean = null;
		idBean = dao.findByID(id);
		return idBean;
	}
	
	public void updateData(MemberBean b) {
			dao.updateData(b);
	}
	
	public void deleteData(Integer id) {
			dao.deleteData(id);
	}
	
	public String findPwByAccount(String acc) {
		String clickPw=null;
		clickPw = dao.findPwByAccount(acc);
		return clickPw;
	}
	
	public MemberBean findByAccount(String acc) {
		return dao.findByAccount(acc);
	}
	
	public List<MemberBean> findAllBeans(){
		List<MemberBean> MBeans = null;
		MBeans = dao.findAllBeans();
		return MBeans;
	}

}
