package com.lms.service;

import java.util.List;

import com.lms.pojo.User;

public interface UserService {
	
	public User checkLogin(String username, String password);
	
	public boolean addUser(User user);
	
	public List<User> getAllUserList();
	
	public User getUserById(long userId);

	public boolean updateUser(User user);
}
