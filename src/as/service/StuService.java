package as.service;
//学生业务

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import as.DAO.*;
import as.model.*;


public class StuService {
	
	StuDAO s = new StuDAO();
	
	public Map<Object, Object> getStulist(String page,String nrows) {
		//计算分页起始索引和终止索引
		int p = Integer.parseInt(page);
		int r = Integer.parseInt(nrows);
		int begin = (p-1)*r;
		int end = p*r-1;
		List<Student> l = s.getSutlist(begin,end);
		int total = s.getTotalNum();
		Map<Object, Object> m = new HashMap<Object, Object>();
		ArrayList rows = new ArrayList();
		for(int i=begin;i<end;i++){
			Map<Object, Object> map = new HashMap<Object, Object>();
			Student s = l.get(i);
			map.put("name",s.getName());
			map.put("cardID",s.getCardID());
			map.put("op", "<a href=\"#\">修改</a>");
			rows.add(map);
		}
		m.put("total",total);
		m.put("rows", rows);
		return m;
	}
	

}
