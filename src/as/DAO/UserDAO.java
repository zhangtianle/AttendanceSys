package as.DAO;



import org.apache.ibatis.session.SqlSession;

import as.model.Mapper;
import as.tools.Helper;

public class UserDAO {
	SqlSession session = Helper.getSessionFactory().openSession();
	Mapper mapper = session.getMapper(Mapper.class);
	
	public String getpwd(String username){
		return mapper.getpwd(username);
	}


}
