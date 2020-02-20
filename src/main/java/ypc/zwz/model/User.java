package ypc.zwz.model;

import java.io.Serializable;

/**
 *  用户类  登入用的账户
 */
public class User implements Serializable {
    // ID
    private int a_id;
    // 用户名
    private String a_name;
    // 密码
    private String a_password;

    public User(int a_id,String a_name,String a_password){
        this.a_id = a_id;
        this.a_name = a_name;
        this.a_password = a_password;
    }

    public User(){

    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getA_password() {
        return a_password;
    }

    public void setA_password(String a_password) {
        this.a_password = a_password;
    }

}
