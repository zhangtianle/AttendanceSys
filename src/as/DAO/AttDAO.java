package as.DAO;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import as.model.Mapper;
import as.model.Student;

import as.tools.Helper;

public class AttDAO {
	
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

		//获取记录总数
		public int getTotalNum(){
			
			SqlSession session = Helper.getSessionFactory().openSession();
			try {
				Mapper mapper = session.getMapper(Mapper.class);
				return mapper.getTotalNum();
			}finally {
				session.close();
			}
			
		}

	
	public String attStudentName(String cardID) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			String name = mapper.getStuName(cardID);
			session.commit();
			return name;

		} finally {
			session.close();
		}

	}
	

	public int attRaw(String cardID, String interId, String name) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			int i = mapper.attRaw(cardID,interId,name);
			session.commit();
			return i;

		} finally {
			session.close();
		}

	}
}
