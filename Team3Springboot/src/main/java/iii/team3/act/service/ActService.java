package iii.team3.act.service;

import java.util.List;

import iii.team3.act.entity.ActMain;

public interface ActService {

	public List<ActMain> getActMains();

	public void saveActMain(ActMain theActMain);

	public ActMain getActMain(int theId);

	public void deleteActMain(int theId);

}
