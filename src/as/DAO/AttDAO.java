package as.DAO;

import org.apache.ibatis.session.SqlSession;

import as.model.Mapper;
import as.tools.Helper;

public class AttDAO {
	
	
	public String attStudentName(String cardID) {

		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			String name = mapper.getStuName(cardID);
			return name;

		} finally {
			session.close();
		}

	}
	

	public int attRaw(String cardID, int interId, String name) {

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
