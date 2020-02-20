package ypc.zwz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ypc.zwz.dao.UsersDao;
import ypc.zwz.model.User;
import ypc.zwz.service.UsersService;

/**
 *      Service层 具体实现类
 */

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDao usersDao;

//    根据用户名找 User类 用于实现登入
    public User login(String a_name) {
        return usersDao.login(a_name);
    }

//    往用户表插入数据   用于实现注册的功能
    public void insert(User user) {
        usersDao.insert(user);
    }

//    根据用户名用户 判断是否已注册用
    public User findByName(String a_name) {
        return usersDao.findByName(a_name);
    }

}
