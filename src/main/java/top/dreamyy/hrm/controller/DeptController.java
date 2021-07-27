package top.dreamyy.hrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import top.dreamyy.hrm.domain.Dept;
import top.dreamyy.hrm.service.HrmService;
import top.dreamyy.hrm.util.tag.PageModel;

import java.util.List;

@Controller
public class DeptController {
    /**
     * 自动注入UserService
     */
    @Autowired
    @Qualifier("hrmService")
    private HrmService hrmService;

    /**
     * 处理/login请求
     */
    @RequestMapping(value = "/dept/selectDept")
    public String selectDept(Model model, Integer pageIndex,
                             @ModelAttribute Dept dept) {
        System.out.println("selectDept -->>");
        System.out.println("pageIndex = " + pageIndex);
        System.out.println("dept = " + dept);
        PageModel pageModel = new PageModel();
        System.out.println("getPageIndex = " + pageModel.getPageIndex());
        System.out.println("getPageSize = " + pageModel.getPageSize());
        System.out.println("getRecordCount = " + pageModel.getRecordCount());
        if (pageIndex != null) {
            pageModel.setPageIndex(pageIndex);
        }

        List<Dept> depts = hrmService.findDept(dept, pageModel);  // 查询用户信息
        model.addAttribute("depts", depts);
        model.addAttribute("pageModel", pageModel);
        return "dept/dept";
    }

    /**
     * 处理删除部门请求
     */
    @RequestMapping(value = "/dept/removeDept")
    public ModelAndView removeDept(String ids, ModelAndView mv) {
        String[] idArray = ids.split(","); // 分解id字符串
        for (String id : idArray) {
            hrmService.removeDeptById(Integer.parseInt(id)); // 根据id删除部门
        }
        mv.setViewName("redirect:/dept/selectDept"); // 设置客户端跳转到查询请求
        return mv;  // 返回ModelAndView
    }

    /**
     * 处理添加请求
     */
    @RequestMapping(value = "/dept/addDept")
    public ModelAndView addDept(
            String flag,
            @ModelAttribute Dept dept,
            ModelAndView mv) {
        if (flag.equals("1")) {
            mv.setViewName("dept/showAddDept");  // 设置跳转到添加页面
        } else {
            hrmService.addDept(dept); // 执行添加操作
            mv.setViewName("redirect:/dept/selectDept"); // 设置客户端跳转到查询请求
        }
        return mv; // 返回
    }


    /**
     * 处理修改部门请求
     */
    @RequestMapping(value = "/dept/updateDept")
    public ModelAndView updateDpet(
            String flag,
            @ModelAttribute Dept dept,
            ModelAndView mv) {
        if (flag.equals("1")) {
            Dept target = hrmService.findDeptById(dept.getId());  // 根据id查询部门
            mv.addObject("dept", target);  // 设置Model数据
            mv.setViewName("dept/showUpdateDept");  // 设置跳转到修改页面
        } else {
            // System.out.println(dept);
            hrmService.modifyDept(dept);  // 执行修改操作
            mv.setViewName("redirect:/dept/selectDept");  // 设置客户端跳转到查询请求
        }
        return mv;  // 返回
    }
}

