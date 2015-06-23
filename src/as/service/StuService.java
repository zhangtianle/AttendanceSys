package as.service;
//学生业务

import java.util.*;


import as.DAO.*;
import as.model.*;


public class StuService {
	
	//获取学生名单列表
	public Map<Object, Object> getStulist(String page,String nrows) {
		//计算分页起始索引
		int p = Integer.parseInt(page);
		int r = Integer.parseInt(nrows);
		int begin = (p-1)*r;
		StuDAO s = new StuDAO();
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
			map.put("op", "<a href=\"manager.do?stuId="+stu.getId()+ "\">修改</a>"
			       +"&nbsp;&nbsp;<a href=\"del.do?stuId="+stu.getId()+ " \" onclick=\"return delcfm();\">删除</a>");
			rows.add(map);
		}
		m.put("total",total);
		m.put("rows", rows);
		return m;
	}
	
	//搜索结果
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
			map.put("op", "<a href=\"manager.do?stuId="+stu.getId()+ "\">修改</a>"
			       +"&nbsp;&nbsp;<a href=\"del.do?stuId="+stu.getId()+ " \" onclick=\"return delcfm();\">删除</a>");
			rows.add(map);
			total++;
		}
		m.put("total",total);
		m.put("rows", rows);
		return m;
	}
	
	//获取某一学生信息
	public Map<Object, Object> getStuInfo(String stuId){
		Map<Object, Object> m = new HashMap<Object, Object>();
		//int stuId = Integer.parseInt(stuId);
		StuDAO s = new StuDAO();
		Student stu = s.getStuInfo(Integer.valueOf(stuId));
		m.put("id", stu.getId());
		m.put("name", stu.getName());
		m.put("cardID", stu.getCardID());
		m.put("phone", stu.getPhone());
		return m;
		
	}
	

	//删除学生信息
	public void stuDel(String stuId) {
		StuDAO s = new StuDAO();
		s.stuDel(Integer.valueOf(stuId));
	}

	//批量删除
	public void stusDel(Student[] stus) {
		StuDAO s = new StuDAO();
		for(Student stu:stus){
			stuDel(stu.getId());		
		}
	}
}
