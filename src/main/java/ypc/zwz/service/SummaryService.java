package ypc.zwz.service;

import ypc.zwz.model.PageBean;
import ypc.zwz.model.Summary;

import java.util.Map;

/**
 * 业务层（Spring）：Service层
 *
 * 此接口在 SummaryServiceImpl.java 中具体实现
 *
 * Service层：Service层主要负责业务模块的逻辑应用设计。
 */

//      首先设计接口，再设计其实现的类。
//      接着再在Spring的配置文件中配置其实现的关联。这样我们就可以在应用中调用Service接口来进行业务处理。
//      Service层的业务实现，具体要调用到已定义的DAO层的接口。
//      封装Service层的业务逻辑有利于通用的业务逻辑的独立性和重复利用性，程序显得非常简洁。

public interface SummaryService {

//    插入新总结
    void saveSummary(Summary summary);

//    分页功能
    PageBean<Summary> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

//    删除总结（永久删除）
    void delete(int s_id);

//    根据ID查询总结
    Summary findById(int s_id);

//    总结放入到回收站
    void clean(int s_id);

//    从回收站恢复总结的功能
    void restore(int s_id);

}
