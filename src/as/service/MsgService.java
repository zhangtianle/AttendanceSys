package as.service;

import as.DAO.*;
public class MsgService {
	
	//获取短信内容
	public String getMsg() {
		
		return new MsgDAO().getMsg();
	}

}
