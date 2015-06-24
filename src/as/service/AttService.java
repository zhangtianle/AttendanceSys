package as.service;

import as.DAO.AttDAO;

public class AttService {
	public int attStudent(String cardID) {
		return new AttDAO().attRaw(cardID);
	}
}
