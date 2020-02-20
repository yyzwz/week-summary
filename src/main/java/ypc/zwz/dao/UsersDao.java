package ypc.zwz.dao;

import ypc.zwz.model.User;

/**
 *      持久层（Mybatis）：Dao层（mapper）
 *
 *      此类和 UsersMapper.xml 一一对应 ，这里是接口，在xml中使用SQL代码实现
 *
 *      DAO层：DAO层主要是做数据持久层的工作，负责与数据库进行联络的一些任务都封装在此。
 */

//      DAO层 首先是设计DAO的接口。
//      然后在Spring的配置文件(UsersMapper.xml)中定义此接口的实现类。
//      然后就可在模块中调用此接口来进行数据业务的处理，而不用关心此接口的具体实现类是哪个类，显得结构非常清晰。
//      DAO层的数据源配置，以及有关数据库连接的参数都在Spring的配置文件中进行配置。

public interface UsersDao {

//    根据用户名找 User类
    User login(String a_name);

//    往用户表插入数据   注册的功能
    void insert(User admin);

//    根据用户名用户 判断是否已注册用
    User findByName(String a_name);

}
