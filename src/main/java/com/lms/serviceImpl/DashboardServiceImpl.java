package com.lms.serviceImpl;

import com.lms.dao.DashboardDao;
import com.lms.daoImpl.DashboardDaoImpl;
import com.lms.pojo.DashboardStats;
import com.lms.service.DashboardService;

public class DashboardServiceImpl implements DashboardService {

	private DashboardDao dashboardDao = new DashboardDaoImpl();

	@Override
	public DashboardStats getDashboardStats() {
		DashboardStats stats = dashboardDao.fetchDashboardStats();
		return stats != null ? stats : new DashboardStats();
	}
}
