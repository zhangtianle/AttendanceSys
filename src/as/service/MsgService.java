package as.service;

import as.DAO.*;
public class MsgService {
	
	//获取短信内容
	public String getMsg() {
		
		return new MsgDAO().getMsg();
	}
	
	//更新短信
	public void updateMsg(String msg) {
		new MsgDAO().updateMsg(msg);
	}

}
