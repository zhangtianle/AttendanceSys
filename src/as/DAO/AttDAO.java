package as.DAO;

import org.apache.ibatis.session.SqlSession;

import as.model.Mapper;
import as.tools.Helper;

public class AttDAO {
	
	public int attRaw(String cardID){
		
		
		
		SqlSession session = Helper.getSessionFactory().openSession();
		try {
			Mapper mapper = session.getMapper(Mapper.class);
			int i = mapper.attRaw(cardID);
			session.commit();
			return i;
			
		}finally {
			session.close();
		}
		
	}
}
