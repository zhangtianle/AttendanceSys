package as.model;

import java.sql.Date;

public class Attinfo {
	
	private int id;
	private String cardID;
	private String name;
	private Date time;
	private int interId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCardID() {
		return cardID;
	}
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getInterId() {
		return interId;
	}
	public void setInterId(int interId) {
		this.interId = interId;
	}

}
