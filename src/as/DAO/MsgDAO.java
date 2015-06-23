package as.DAO;

import org.apache.ibatis.session.SqlSession;

import as.model.Mapper;
import as.tools.Helper;

public class MsgDAO {
	
	//获取短信内容
	public String getMsg() {
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
		
		return mapper.getMsg();
		}finally {
			session.close();
		}
	}

}
