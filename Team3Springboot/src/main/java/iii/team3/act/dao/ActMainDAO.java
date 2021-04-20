package iii.team3.act.dao;

import java.util.List;

import iii.team3.act.entity.ActMain;

public interface ActMainDAO {

	public List<ActMain> getActMains();

	public void saveActMain(ActMain theActMain);

	public ActMain getActMains(int theId);

	public void deleteActMain(int theId);

}
