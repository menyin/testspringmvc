package test;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/hello")
public class HellAction {
    @RequestMapping("/first")
    public String first(Model model) {
        model.addAttribute("myData","社会主义是个好宝宝,ohyee");
        return "/jsp/hello.jsp";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String getParms() {
        return "/jsp/add.jsp";
    }
    @RequestMapping(value = "/addParm",method = RequestMethod.POST)
    public String getParms(Model model,Integer age,String name) {
        model.addAttribute("age","age类型为：" +age.getClass()+"，值为" +age);
        model.addAttribute("name","name类型为：" +name.getClass()+"，值为" +name);
        return "/jsp/addSuccess.jsp";
    }

    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public String getParms(Model model,User user) {
        model.addAttribute("user", user);
        return "/jsp/addSuccess.jsp";
    }

    @InitBinder
    private void initBinder(HttpServletRequest request, ServletRequestDataBinder binder){
        binder.registerCustomEditor(
                Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
    }

    @RequestMapping(value = "/addUser_Date",method = RequestMethod.POST)
    public String getUser_Date(Model model,User user) {
        model.addAttribute("userBirthDate", user.getBirthDate());
        return "/jsp/addSuccess.jsp";
    }
    @RequestMapping(value = "/addArrayParm",method = RequestMethod.POST)
    public String getArrayParm(Model model,int[] ids) {
        for (int id :ids){
            System.out.println(id);
        }
        return "/jsp/addSuccess.jsp";
    }

    @RequestMapping(value = "/addUserList",method = RequestMethod.POST)
    public String getUserList(Model model,Bean bean) {
        model.addAttribute("users", bean.getUsers());
        return "/jsp/addSuccess.jsp";
    }

    @RequestMapping(value = "/ajax",method = RequestMethod.POST)
    public @ResponseBody User ajax(int age) {
        System.out.println(age);
        User user = new User();
        user.setAge(age);
        user.setName("光头强");
        return user;
    }
}
