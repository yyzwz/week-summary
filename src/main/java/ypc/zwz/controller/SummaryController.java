package ypc.zwz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ypc.zwz.model.Summary;
import ypc.zwz.service.SummaryService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 *      表现层（springMVC）：Controller层
 *
 *      Controller层负责具体的业务模块流程的控制。
 */

//      在此层里面要调用Service层的接口来控制业务流程，使程序结构变得清晰，也大大减少了代码量。

@Controller
@RequestMapping(value = "/summary")
public class SummaryController {

    /**
     * goId = 0 代表的是文章列表页面
     *
     * goId = 1 代表访问的是回收站页面
     */
    private int goId = 0;

    @Autowired
    private SummaryService summaryService;

    /**
     * 跳转到周总结列表页面
     * 备注 : redirect 重定向 用于转到当前类的相应地方  下同
     */
    @RequestMapping(value = "/toSummaryManage")
    public String toSummaryManage() {
        goId = 0;
        return "redirect:findByPage.do";
    }

    /**
     * 主界面 ————> 周总结管理 ————> 周总结草稿
     *
     * 跳转到周总结编写页面,可以新增周总结
     */
    @RequestMapping(value = "/toSummaryWrite")
    public String toSummaryWrite() {
        return "summary/summaryWrite";
    }

    /**
     * 主界面 ————> 周总结管理 ————> 回收站
     *
     * 跳转到回收站页面
     */
    @RequestMapping(value = "/toSummaryTrash")
    public String toSummaryTrash() {
        goId = 1;
        return "redirect:findByPage.do";
    }

    /**
     * 主界面 ————> 关于我们
     *
     * 跳转到关于我们页面
     */
    @RequestMapping(value = "/toAboutUs")
    public String toAboutUs() {
        return "about/aboutUs";
    }

    /**
     * 主界面 ————> 项目指南
     *
     * 跳转到项目指南页面
     * 最初想法是显示联系方式  所以是toCallUs
     * 现在把联系方式合并到关于我们页面
     */
    @RequestMapping(value = "/toCallUs")
    public String toCallUs() {
        return "about/callUs";
    }

    /**
     * 用于编辑周总结的时候,点击发布按钮，
     * 把总结存入数据库,然后跳转到新增结果反馈页面
     *
     * 保存文章
     */
    @RequestMapping(value = "/save")
    public String saveSummary(Summary summary, Model model) {
        try {
            summaryService.saveSummary(summary);
            model.addAttribute("message", "文章添加成功");
            return "summary/changeHint";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 周总结分页查询
     *
     * 这个不太会,我是模仿github某源码写的
     * 功能是对所有周总结进行分页,在周总结列表页面,默认显示第一页，每页显示8个 ，参数可以改
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "8", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
        // 封装分页数据
        String publish = request.getParameter("s_publish");
        String status = request.getParameter("s_status");
        int s_publish = 0, s_status = 0;

        if (publish != null) {
            if (publish.equals("已发布")) {
                s_publish = 1;
            } else if (publish.equals("未发布")) {
                s_publish = 0;
            }
        }
        if (status != null) {
            if (status.equals("存在")) {
                s_status = 0;
            } else if (status.equals("已删除")) {
                s_status = 1;
            }
        }
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("s_publish", s_publish);
        conMap.put("s_status", s_status);

        //把状态码也放入Map集合中
        conMap.put("goId", goId);

        //回显数据
        model.addAttribute("page", summaryService.findByPage(pageCode, pageSize, conMap));
        if (goId == 1) {
            return "summary/summaryTrash";
        }
        return "summary/summaryList";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam int s_id) {
        summaryService.delete(s_id);
        return "redirect:findByPage.do";
    }

    /**
     * 删除周总结（仅放入回收站，即仅仅改变status的值）
     */
    @RequestMapping(value = "/clean")
    public String clean(@RequestParam int s_id) {
        summaryService.clean(s_id);
        return "redirect:findByPage.do";
    }

    /**
     * 恢复周总结的功能（即将周总结从回收站中取出，改变status值）
     */
    @RequestMapping(value = "/restore")
    public String restore(@RequestParam int s_id) {
        summaryService.restore(s_id);
        return "redirect:findByPage.do";
    }

    /**
     * 跳转到查看单篇周总结内容页面
     *
     * 即查看周总结的内容
     */
    @RequestMapping(value="/toSummaryView")
    public String toArticleView(@RequestParam int s_id, Model model){
        Summary summary = summaryService.findById(s_id);
        System.out.println("查询到当前文章的ID值："+ summary.getS_id());
        if (summary != null) {
            model.addAttribute("summary", summary);
            return "summary/summaryContent";
        } else {
            return null;
        }
    }

}
