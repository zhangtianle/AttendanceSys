package as.model;

import java.util.List;

import org.apache.ibatis.annotations.Param;


/*mybaits mapper
 * 
 */

public interface Mapper {
	
	
	public String getpwd(String username);
	
	public List<Student> getStulist(@Param(value="begin") int begin,@Param(value="end") int end);
	
	public int getTotalNum();
		



}
