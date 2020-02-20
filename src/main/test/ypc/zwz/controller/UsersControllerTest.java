package ypc.zwz.controller;

import org.junit.Test;
import org.springframework.ui.Model;
import ypc.zwz.dao.BaseJunit4Test;
import ypc.zwz.dao.SummaryDao;
import ypc.zwz.model.Summary;
import ypc.zwz.model.User;
import ypc.zwz.service.SummaryService;
import ypc.zwz.service.UsersService;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Map;

public class UsersControllerTest extends BaseJunit4Test {

    @Resource
    private UsersService usersService;
    @Resource
    private SummaryService summaryService;
    @Resource
    private SummaryDao summaryDao;
    @Resource
    private SummaryController summaryController;


//    测试连接数据库功能 根据姓名找密码
    @Test
    public void test(){
        String str = "zwz";
        User user = usersService.login(str);
        System.out.println(user.getA_password());
    }


//    测试连接数据库功能 总结部分
    @Test
    public void summaryDaoTest(){
        Summary summary = summaryDao.findById(4);
        System.out.println(summary.getS_content());
    }


//    以下两个 测试能不能存总结
    @Test
    public void saveSummaryTest(){
        Summary summary = new Summary(1,"a","b","c","2",3,4);
        summaryService.saveSummary(summary);
    }

    @Test
    public void saveSummaryControllerTest(){
        Summary summary = new Summary(1,"a","b","c","2",3,4);
        summaryController.saveSummary(summary,new Model(){

            @Override
            public Model addAttribute(String attributeName, Object attributeValue) {
                return null;
            }

            @Override
            public Model addAttribute(Object attributeValue) {
                return null;
            }

            @Override
            public Model addAllAttributes(Collection<?> attributeValues) {
                return null;
            }

            @Override
            public Model addAllAttributes(Map<String, ?> attributes) {
                return null;
            }

            @Override
            public Model mergeAttributes(Map<String, ?> attributes) {
                return null;
            }

            @Override
            public boolean containsAttribute(String attributeName) {
                return false;
            }

            @Override
            public Map<String, Object> asMap() {
                return null;
            }
        });
    }
}
