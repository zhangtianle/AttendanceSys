package as.service;

import as.DAO.AttDAO;

public class AttService {
	
	public String attGetName(String cardID) {
		return new AttDAO().attStudentName(cardID);
	}
	
	public int attStudent(String cardID,int interId,String name) {
		return new AttDAO().attRaw(cardID,interId,name);
	}
}
