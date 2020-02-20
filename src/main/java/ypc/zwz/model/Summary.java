package ypc.zwz.model;

import java.io.Serializable;

/**
 * 总结类  一篇周总结就是一个对象
 */
public class Summary implements Serializable {

    // 总结编号
    private int s_id;

    // 总结作者
    private String s_author;

    // 总结简介
    private String s_intro;

    // 总结内容
    private String s_content;

    // 总结创建日期
    private String s_date;

    // 总结发表 --> 0：未发表   1：未发表
    private int s_publish;

    // 总结状态 --> 0：存在    1：已删除
    private int s_status;

    public Summary(int s_id,String s_author,String s_intro,String s_content,
                   String s_date,int s_publish,int s_status ){
        this.s_id = s_id;
        this.s_author = s_author;
        this.s_intro = s_intro;
        this.s_content = s_content;
        this.s_date = s_date;
        this.s_publish = s_publish;
        this.s_status = s_status;
    }

    public Summary(){

    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getS_author() {
        return s_author;
    }

    public void setS_author(String s_author) {
        this.s_author = s_author;
    }

    public String getS_intro() {
        return s_intro;
    }

    public void setS_intro(String s_intro) {
        this.s_intro = s_intro;
    }

    public String getS_content() {
        return s_content;
    }

    public void setS_content(String s_content) {
        this.s_content = s_content;
    }

    public String getS_date() {
        return s_date;
    }

    public void setS_date(String s_date) {
        this.s_date = s_date;
    }

    public int getS_publish() {
        return s_publish;
    }

    public void setS_publish(int s_publish) {
        this.s_publish = s_publish;
    }

    public int getS_status() {
        return s_status;
    }

    public void setS_status(int s_status) {
        this.s_status = s_status;
    }
}
