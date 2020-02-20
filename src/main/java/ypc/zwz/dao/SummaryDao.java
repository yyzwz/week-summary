package ypc.zwz.dao;

import ypc.zwz.model.Summary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *      持久层（Mybatis）：Dao层（mapper）
 *
 *      此类和 SummaryMapper.xml 一一对应 ，这里是接口，在xml中使用SQL代码实现
 *
 *      DAO层：DAO层主要是做数据持久层的工作，负责与数据库进行联络的一些任务都封装在此。
 */

//      DAO层 首先是设计DAO的接口。
//      然后在Spring的配置文件(SummaryMapper.xml)中定义此接口的实现类。
//      然后就可在模块中调用此接口来进行数据业务的处理，而不用关心此接口的具体实现类是哪个类，显得结构非常清晰。
//      DAO层的数据源配置，以及有关数据库连接的参数都在Spring的配置文件中进行配置。

public interface SummaryDao {

//    插入新总结
    void saveSummary(Summary summary);

//    查询没被删除的总结个数
    int selectCount();

//    查询已被删除的总结个数
    int selectCount2();

//    基础分页查询
    List<Summary> findByPage(HashMap<String, Object> map);

//    高级分页查询
    List<Summary> findConByPage(Map<String, Object> conMap);

//    删除总结（永久删除）
    void delete(int s_id);

//    根据ID查询总结
    Summary findById(int s_id);

//    总结放入到回收站
    void clean(int s_id);

//    从回收站恢复总结的功能
    void restore(int s_id);

}
