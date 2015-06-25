package as.service;
/*
 * 登陆服务
 */
import as.DAO.UserDAO;

public class LoginService {
	
	public boolean check(String username,String pwd){
		boolean flag = false;
		UserDAO u = new UserDAO();
		if(pwd.equals(u.getpwd(username))){
			flag = true;
		}
		return flag;
	}

}
