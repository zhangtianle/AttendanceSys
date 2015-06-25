package as.service;

import java.util.*;

import as.DAO.AttDAO;
import as.model.Attinfo;

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


	
	public String attGetName(String cardID) {
		return new AttDAO().attStudentName(cardID);
	}
	
	public int attStudent(String cardID,String interId,String name) {
		return new AttDAO().attRaw(cardID,interId,name);
	}

}
