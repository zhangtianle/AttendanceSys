package as.controller;
/*所有的mvc控制器都在这个类里
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController{
	@RequestMapping("index.do")
	public String c() {
		return "index";
	}
	
}
