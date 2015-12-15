package com.noisyle.crowbar.service;

import org.apache.shiro.SecurityUtils;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.noisyle.crowbar.constant.AdminConstant;
import com.noisyle.crowbar.core.base.IUser;
import com.noisyle.crowbar.core.datatables.FormatedPage;
import com.noisyle.crowbar.core.datatables.PageParam;
import com.noisyle.crowbar.core.vo.UserContext;
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
    
    public void save(User user) {
    	userRepository.save(user);
    }
    
    public void delete(Long id) {
    	userRepository.delete(id);
    }
    
    public FormatedPage getFormatedPage(PageParam pageParam) {
    	return userRepository.getFormatedPage(pageParam);
    }
    
	public User getUserByLoginName(String loginname) {
		return userRepository.getUserByLoginname(loginname);
	}
	
	public void initUserContext(IUser user) {
    	UserContext uctx = new UserContext(user);
    	uctx.setLoginTime(LocalDate.now().toDate());
    	SecurityUtils.getSubject().getSession().setAttribute(AdminConstant.SESSION_KEY_USER_CONTEXT, uctx);
	}
	
}
