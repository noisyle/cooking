package com.noisyle.crowbar.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.noisyle.crowbar.core.base.AbstractDao;
import com.noisyle.crowbar.model.User;

@Repository
public class UserRepository extends AbstractDao<User, Long> {

    public List<User> list() {
        List<User> list = getAll();
        return list;
    }

    public User getUserByLoginname(String loginname) {
        User user = findUniqueBy("loginname", loginname);
        return user;
    }

    public void insertUser(User user) {
        save(user);
    }

}