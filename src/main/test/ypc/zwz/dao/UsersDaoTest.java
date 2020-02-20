package ypc.zwz.dao;

import org.junit.Test;
import ypc.zwz.model.User;

import javax.annotation.Resource;

public class UsersDaoTest extends BaseJunit4Test{

    @Resource
    private UsersDao usersDao;

//    测试能否读取数据库
    @Test
    public void loginTest(){
        String name = "zwz";
        User user = usersDao.login(name);
        System.out.println(user.getA_id() + "  " +user.getA_name() +"  " + user.getA_password() );
    }
}
