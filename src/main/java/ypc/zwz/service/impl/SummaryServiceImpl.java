package ypc.zwz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ypc.zwz.dao.SummaryDao;
import ypc.zwz.model.PageBean;
import ypc.zwz.model.Summary;
import ypc.zwz.service.SummaryService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *      Service层 具体实现类
 */

@Service
public class SummaryServiceImpl implements SummaryService {

    @Autowired
    private SummaryDao summaryDao;

//    插入新总结
    public void saveSummary(Summary summary) {
        summaryDao.saveSummary(summary);
    }

//    分页功能
    public PageBean<Summary> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Summary> pageBean = new PageBean<Summary>();

        //获取Controller层封装的状态码
        Integer goId = (Integer)conMap.get("goId");

        //封装数据
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = 0;
        if(goId == 0){
            //访问的是文章列表页面
            totalCount = summaryDao.selectCount();
        }else if(goId == 1){
            //访问的是回收站页面
            totalCount = summaryDao.selectCount2();
        }
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        pageBean.setTotalPage(num.intValue());

        //设置limit起始位置和终止位置
        map.put("start",(pageCode - 1) * pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Summary> list = summaryDao.findByPage(map);
        pageBean.setBeanList(list);

        for(Object obj : list){
            System.out.println(obj);
        }

        //条件查询的封装
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        List<Summary> conList = summaryDao.findConByPage(conMap);
        pageBean.setBeanList(conList);
        return pageBean;
    }

//    删除指定ID的周总结
    public void delete(int s_id) {
        summaryDao.delete(s_id);
    }

//    根据ID查询总结
    public Summary findById(int s_id) {
        return summaryDao.findById(s_id);
    }

//    总结放入到回收站
    public void clean(int s_id) {
        summaryDao.clean(s_id);
    }

//    从回收站恢复总结的功能
    public void restore(int s_id) {
        summaryDao.restore(s_id);
    }

}
