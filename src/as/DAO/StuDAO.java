package as.DAO;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import as.model.*;
import as.tools.Helper;

public class StuDAO {
	SqlSession session = Helper.getSessionFactory().openSession();
	Mapper mapper = session.getMapper(Mapper.class);
	
	//获取学生列表（name cardID）
	public List<Student> getSutlist(){
		return mapper.getStulist();
	}


}

	
	

