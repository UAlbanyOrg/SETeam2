package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployerDao {

	public static boolean addNewJob(String jobid,String cmpuname,String cmpname,String contactname,String jobtitle,String workexp,String education,
			String category,String keyskills,String jobdesp,String city,String state){  
		try
		{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"insert into jobs(jobid,empusername,companyname,contactname,jobtitle,workexp,education,jobcategory,jobskills,jobdescription,city,state) values (?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,jobid);
		ps.setString(2,cmpuname);
		ps.setString(3,cmpname);
		ps.setString(4,contactname);  
		ps.setString(5,jobtitle);  
		ps.setString(6,workexp);
		ps.setString(7,education);
		ps.setString(8,category);  
		ps.setString(9,keyskills);
		ps.setString(10,jobdesp);
		ps.setString(11,city);
		ps.setString(12,state);
		int i = ps.executeUpdate();
		if(i>0) return true;
		}
		catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean deleteJob(int jid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("delete from jobs where jid=?");
        ps.setInt(1, jid);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateJob(String jobid,String cmpuname,String cmpname,String contactname,String jobtitle,String workexp,String education,
			String category,String keyskills,String jobdesp,String city,String state,int id){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobs set jobid=?,empusername=?,companyname=?,contactname=?,jobtitle=?,workexp=?,education=?,jobcategory=?,jobskills=?,jobdescription=?,city=?,state=? where jid=?");
        ps.setString(1,jobid);
		ps.setString(2,cmpuname);
		ps.setString(3,cmpname);
		ps.setString(4,contactname);  
		ps.setString(5,jobtitle);  
		ps.setString(6,workexp);
		ps.setString(7,education);
		ps.setString(8,category);  
		ps.setString(9,keyskills);
		ps.setString(10,jobdesp);
		ps.setString(11,city);
		ps.setString(12,state);
		ps.setInt(13,id);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean checkJobId(String jobid,String cmpuname){
		try
		{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"select * from jobs where jobid=? and empusername=?");   
		ps.setString(1,jobid);
		ps.setString(2,cmpuname); 
		ResultSet rs = ps.executeQuery();
		      
		if(rs.next()){
			if(jobid.equals(rs.getString("jobid"))) return false;            
		}
		}
		catch(Exception e)
		{System.out.println(e);}  
		return true;
	}
	
	public static boolean updateEmpProfile(String cmpname, String contactname, String contactno, String email, String city, String state, String category, int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update employer set cmpname=?,contactname=?,contactno=?,email=?,city=?,state=?,category=? where empid=?");
        ps.setString(1, cmpname);
        ps.setString(2, contactname);
        ps.setString(3, contactno);
        ps.setString(4, email);
        ps.setString(5, city);
        ps.setString(6, state);
        ps.setString(7, category);
        ps.setInt(8, userid);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateEmpJobs(String cmpuname, String cmpname, String contactname){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobs set companyname=?,contactname=? where empusername=?");
        ps.setString(1, cmpname);
        ps.setString(2, contactname);
        ps.setString(3, cmpuname);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean readAppliedJob(int id){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update appliedjobs set status=? where ajid=?");
        ps.setString(1, "Viewed");
        ps.setInt(2, id);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean removeAppliedJob(int id){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update appliedjobs set status=? where ajid=?");
        ps.setString(1, "Removed");
        ps.setInt(2, id);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
}
