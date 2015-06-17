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
	
	public Map<Object, Object> getStulist() {
		
		List<Student> l = s.getSutlist();
		Map<Object, Object> m = new HashMap<Object, Object>();
		ArrayList rows = new ArrayList();
		
		for(Student s:l){
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("name",s.getName());
			map.put("cardID",s.getCardID());
			map.put("op", "<a href=\"#\">修改</a>"+"&nbsp;<a href=\"#\">删除</a>");
			rows.add(map);
			
		}
		m.put("total",2);
		m.put("rows", rows);
		return m;
	}
	

}
