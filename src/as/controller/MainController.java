package as.controller;
/*所有的mvc控制器都在这个类里
 * 
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import as.model.*;
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
		LoginService userService = new LoginService();
		boolean loginFlag = userService.check(username,pwd);
		if (loginFlag) {
			return "index";
		} else {
			model.addAttribute("msg", "账号或密码错误,请重新登录");
			return "login";
		}

	}
	
}
