package as.DAO;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import as.model.*;
import as.tools.Helper;

public class AttDAO {
	
	//获取范围内的学生列表（name cardID）
		public List<Attinfo> getAttinfo(int begin,int num){
			SqlSession session = Helper.getSessionFactory().openSession();
			try {
				Mapper mapper = session.getMapper(Mapper.class);
			
			return mapper.getAttinfo(begin,num);
			}finally {
				session.close();
			}
		}

		//获取记录总数
		public int getTotalNum(){
			
			SqlSession session = Helper.getSessionFactory().openSession();
			try {
				Mapper mapper = session.getMapper(Mapper.class);
				return mapper.getAttTotalNum();
			}finally {
				session.close();
			}
			
		}
		
		//获取范围内的学生列表（name cardID InterId time）
				public List<Attinfo> getAttSearchResult(String name,String cardID,String interId ){
					SqlSession session = Helper.getSessionFactory().openSession();
					try {
						Mapper mapper = session.getMapper(Mapper.class);
		
						
					return mapper.getAttSearchResult(name,cardID,interId);
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
	
	
	//获取打卡时间
	public Stuarrive getAttTime(String cardID,java.sql.Date date){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			Stuarrive s =mapper.getAttTime(cardID,date);
			
			
			return s;
		} finally {
			session.close();
		}
		
	}
	
	//插入打卡时间
		public void insertAttTime(Stuarrive s){
			SqlSession session = Helper.getSessionFactory().openSession();
			try {
				Mapper mapper = session.getMapper(Mapper.class);
				mapper.insertAttTime(s);
				session.commit();
			} finally {
				session.close();
			}
			
		}
	//更新打卡时间
	public void setAttTime(Stuarrive s){
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			mapper.setAttTime(s);
			session.commit();
			
		} finally {
			session.close();
		}
		
	}
	
}
