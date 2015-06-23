package as.DAO;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import as.model.*;
import as.tools.Helper;

public class StuDAO {
	
	

	
	//获取范围内的学生列表（name cardID）
	public List<Student> getSutlist(int begin,int num){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
		
		return mapper.getStulist(begin,num);
		}finally {
			session.close();
		}
	}

	//获取未注销的学生总数
	public int getTotalNum(){
		
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			return mapper.getTotalNum();
		}finally {
			session.close();
		}
		
	}
	
	//获取学生信息()
	public Student getStuInfo(int stuId){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			return mapper.getStuInfo(stuId);
		}finally {
			session.close();
		}
		
	}
	
	//删除学生
	public void stuDel(int stuId){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			mapper.stuDel(stuId);
			session.commit();
		}finally {
			session.close();
		}
		
	}
	
	public  List<Student> getSearchResult(String name,String cardID){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			return mapper.getSearchResult(name,cardID);
		}finally {
			session.close();
		}
	}

}

	
	

