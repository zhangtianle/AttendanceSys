package as.DAO;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import as.model.*;
import as.tools.Helper;

public class StuDAO {
	SqlSession session = Helper.getSessionFactory().openSession();
	Mapper mapper = session.getMapper(Mapper.class);
	
	//获取范围内的学生列表（name cardID）
	public List<Student> getSutlist(int begin,int end){
		return mapper.getStulist(begin,end);
	}

	//获取未注销的学生总数
	public int getTotalNum(){
		return mapper.getTotalNum();
	}

}

	
	

