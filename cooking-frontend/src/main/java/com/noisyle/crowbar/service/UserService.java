package com.noisyle.crowbar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.noisyle.crowbar.model.User;
import com.noisyle.crowbar.repository.UserRepository;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    public User get(Long id) {
    	return userRepository.get(id);
    }
    
	public User getUserByLoginName(String loginname) {
		return userRepository.getUserByLoginname(loginname);
	}
    
    public void save(User user) {
    	userRepository.save(user);
    }
}
