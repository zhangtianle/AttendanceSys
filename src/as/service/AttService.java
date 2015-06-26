package as.service;

import java.text.*;
import java.util.*;

import as.DAO.AttDAO;
import as.model.Attinfo;
import as.model.Stuarrive;

public class AttService {
	
	//获取打卡名单
		public Map<Object, Object> getStulist(String page,String nrows) {
			//计算分页起始索引
			int p = Integer.parseInt(page);
			int r = Integer.parseInt(nrows);
			int begin = (p-1)*r;
			AttDAO a = new AttDAO();
			int total = a.getTotalNum();
			List<Attinfo> l = a.getAttinfo(begin,r);
			Map<Object, Object> m = new HashMap<Object, Object>();
			ArrayList rows = new ArrayList();
			Iterator it = l.iterator();
			while(it.hasNext()){
				Map<Object, Object> map = new HashMap<Object, Object>();
				Attinfo ai = (Attinfo)it.next();
				map.put("name",ai.getName());
				map.put("cardID",ai.getCardID());
				map.put("time", ai.getTime());
				map.put("interId", ai.getInterId());
				rows.add(map);
			}
			m.put("total",total);
			m.put("rows", rows);
			return m;
		}
		
		
		//返回查询信息 
		public Map<Object, Object> getSearchResult(String name,String cardID,String interId) {
			
			AttDAO a = new AttDAO();
			int total = 0;
			if(name.equals("")) name=null;
			if(cardID.equals("")) cardID=null;
			if(interId.equals("")) interId=null;
			List<Attinfo> l = a.getAttSearchResult(name,cardID,interId);
			Map<Object, Object> m = new HashMap<Object, Object>();
			ArrayList rows = new ArrayList();
			Iterator it = l.iterator();
			while(it.hasNext()){
				Map<Object, Object> map = new HashMap<Object, Object>();
				Attinfo ai = (Attinfo)it.next();
				map.put("name",ai.getName());
				map.put("cardID",ai.getCardID());
				map.put("time", ai.getTime());
				map.put("interId", ai.getInterId());
				rows.add(map);
				total++;
			}
			m.put("total",total);
			m.put("rows", rows);
			return m;
		}


	
	
	
	private final String mCome = "07:30:00";
	private final String mGo = "12:30:00";

	private final String aCome = "13:30:00";
	private final String aGo = "17:30:00";

	/**
	 * 获得学生姓名
	 * 
	 * @param cardID
	 * @return
	 */
	public String attGetName(String cardID) {
		return new AttDAO().attStudentName(cardID);
	}

	/**
	 * 根据读卡器获得的cardID，将用户加入打卡数据库
	 * 
	 * @param cardID
	 * @param interId
	 * @param name
	 * @return
	 */
	public int attStudent(String cardID, String interId, String name) {
		return new AttDAO().attRaw(cardID, interId, name);
	}

	/**
	 * 获得系统当前时间
	 * 
	 * @return
	 */
	public String getCurrentTime() {
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");// 设置日期格式
		return df.format(new Date());
		//return "13:31:00";
	}

	/**
	 * 判断当前时间是否在允许的打卡范围内,若是,则插入数据
	 * @param cardID 卡号
	 * @return　true插入成功,false插入失败
	 */
	public boolean setStuarriveInfo(String cardID, String name) {
		
		boolean result = true;
		String currTime = getCurrentTime();
		
		AttDAO ad = new AttDAO();
		
		// 获得stuarrive
		//System.out.println(new java.sql.Date(new java.util.Date().getTime()));
		Stuarrive stuarrive = ad.getAttTime(cardID,new java.sql.Date(new java.util.Date().getTime()));
		if(stuarrive == null) {
			Stuarrive s = new Stuarrive();
			s.setCardID(cardID);
			s.setAdate(new Date());
			s.setName(name);
			//s.setMarrive(new Date());
			if (isInterval(currTime, mCome, mGo)) {
				s.setMarrive(new Date());
			} else if (isInterval(currTime, aCome, aGo)) {
				s.setAarrive(new Date());
			}
			ad.insertAttTime(s);
		} else {
			//stuarrive.setCardID(cardID);
			//stuarrive.setName(name);
			Date mTime = stuarrive.getMarrive();
			Date aTime = stuarrive.getAarrive();
			// 如果是上午打卡
			if (isInterval(currTime, mCome, mGo)) {

				// 如果是第二次
				//if (mTime != null) {
					stuarrive.setMleave(new Date());
				//} else {
				//	stuarrive.setMarrive(new Date());
				//}
				ad.setAttTime(stuarrive);
			} else if (isInterval(currTime, aCome, aGo)) {
				// 如果是下午打卡
				if (aTime != null) {
					stuarrive.setAleave(new Date());
				} else {
					stuarrive.setAarrive(new Date());
				}
				ad.setAttTime(stuarrive);
			} else {
				result = false;
			}
		}
		return result;
	}

	/**
	 * 比较时间先后顺序
	 * 
	 * @param DATE1
	 * @param DATE2
	 * @return
	 */
	/*private int compare_date(String DATE1, String DATE2) {

		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		try {
			Date dt1 = df.parse(DATE1);
			Date dt2 = df.parse(DATE2);
			if (dt1.getTime() > dt2.getTime()) {
				System.out.println("dt1 在dt2前");
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				System.out.println("dt1在dt2后");
				return -1;
			} else {
				return 0;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}*/

	/**
	 * 查看date是否在date1和date2之间
	 * @param date
	 * @param date1
	 * @param date2
	 * @return
	 */
	private boolean isInterval(String date, String date1, String date2) {
		boolean result = false;
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		try {
			Date dt = df.parse(date);
			Date dt1 = df.parse(date1);
			Date dt2 = df.parse(date2);
			if (dt.getTime() > dt1.getTime() && dt.getTime() < dt2.getTime()) {
				System.out.println("dt 在 dt1 dt2之间");
				result = true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
