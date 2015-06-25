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
			AttDAO s = new AttDAO();
			int total = s.getTotalNum();
			List<Student> l = s.getSutlist(begin,r);
			Map<Object, Object> m = new HashMap<Object, Object>();
			ArrayList rows = new ArrayList();
			Iterator it = l.iterator();
			while(it.hasNext()){
				Map<Object, Object> map = new HashMap<Object, Object>();
				Student stu = (Student)it.next();
				map.put("name",stu.getName());
				map.put("cardID",stu.getCardID());
				map.put("op", "<a href=\"gtupdateStu.do?stuId="+stu.getId()+ "\">修改</a>"
				       +"&nbsp;&nbsp;<a href=\"del.do?stuId="+stu.getId()+ " \" onclick=\"return delcfm();\">删除</a>");
				rows.add(map);
			}
			m.put("total",total);
			m.put("rows", rows);
			return m;
		}
		
		
		//返回查询信息 
		public Map<Object, Object> getSearchResult(String name,String cardID) {
			
			StuDAO s = new StuDAO();
			int total = 0;
			if(name.equals("")) name=null;
			if(cardID.equals("")) cardID=null;
			List<Student> l = s.getSearchResult(name,cardID);
			Map<Object, Object> m = new HashMap<Object, Object>();
			ArrayList rows = new ArrayList();
			Iterator it = l.iterator();
			while(it.hasNext()){
				Map<Object, Object> map = new HashMap<Object, Object>();
				Student stu = (Student)it.next();
				map.put("name",stu.getName());
				map.put("cardID",stu.getCardID());
				map.put("op", "<a href=\"gtupdateStu.do?stuId="+stu.getId()+ "\">修改</a>"
				       +"&nbsp;&nbsp;<a href=\"del.do?stuId="+stu.getId()+ " \" onclick=\"return delcfm();\">删除</a>");
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
