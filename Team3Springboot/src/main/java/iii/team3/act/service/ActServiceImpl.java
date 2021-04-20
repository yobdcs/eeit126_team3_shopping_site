package iii.team3.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.act.dao.ActMainDAO;
import iii.team3.act.entity.ActMain;

@Service
public class ActServiceImpl implements ActService {

	@Autowired
	private ActMainDAO actMainDAO;

	@Override
	@Transactional
	public List<ActMain> getActMains() {

		return actMainDAO.getActMains();
	}

	@Override
	@Transactional
	public void saveActMain(ActMain theActMain) {

		actMainDAO.saveActMain(theActMain);
	}

	@Override
	@Transactional
	public ActMain getActMain(int theId) {

		return actMainDAO.getActMains(theId);
	}

	@Override
	@Transactional
	public void deleteActMain(int theId) {

		actMainDAO.deleteActMain(theId);
	}

}
