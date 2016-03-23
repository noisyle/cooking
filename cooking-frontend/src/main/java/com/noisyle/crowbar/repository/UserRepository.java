package com.noisyle.crowbar.repository;

import org.springframework.stereotype.Repository;

import com.noisyle.crowbar.core.base.BaseHibernateRepository;
import com.noisyle.crowbar.model.User;

@Repository
public class UserRepository extends BaseHibernateRepository<User, Long> {

	public User getUserByLoginname(String loginname) {
        User user = findUniqueBy("loginname", loginname);
        return user;
    }

}