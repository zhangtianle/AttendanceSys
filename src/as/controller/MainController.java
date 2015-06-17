package as.controller;
/*所有的mvc控制器都在这个类里
 * 
 */


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import as.service.*;


@Controller
public class MainController{
	@RequestMapping("login.do")
	public String c() {
		return "login";
	}
	
	//登陆
	@RequestMapping("index.do")
	public String index(@RequestParam("username") String username,
			@RequestParam("password") String pwd,Model model)
	{
		LoginService ls = new LoginService();
		boolean loginFlag = ls.check(username,pwd);
		if (loginFlag) {
			return "index";
		} else {
			model.addAttribute("msg", "账号或密码错误,请重新登录");
			return "login";
		}

	}
	
	//跳转到学生名单界面
		@RequestMapping("stulist.do")
		public String stulist(Model model){
			return "stulist";
		}
		
    //请求学生名单，返回json
		@RequestMapping("getstuinfo.do")
		@ResponseBody
		public Map<Object, Object> ss(){
			StuService ss = new StuService();
			return ss.getStulist();
		}
	
}
