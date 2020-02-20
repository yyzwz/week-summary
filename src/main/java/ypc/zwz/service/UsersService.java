package ypc.zwz.service;

import ypc.zwz.model.User;

/**
 * 业务层（Spring）：Service层
 *
 * 此接口在 UsersServiceImpl.java 中具体实现
 *
 * Service层：Service层主要负责业务模块的逻辑应用设计。
 */

//      首先设计接口，再设计其实现的类。
//      接着再在Spring的配置文件中配置其实现的关联。这样我们就可以在应用中调用Service接口来进行业务处理。
//      Service层的业务实现，具体要调用到已定义的DAO层的接口。
//      封装Service层的业务逻辑有利于通用的业务逻辑的独立性和重复利用性，程序显得非常简洁。

public interface UsersService {

//    根据用户名找 User类
    User login(String a_name);

//    往用户表插入数据   注册的功能
    void insert(User admin);

//    根据用户名用户 判断是否已注册用
    User findByName(String a_name);

}
