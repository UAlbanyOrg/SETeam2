package ModelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JobseekerDao {
	
	public static boolean applyJob(String jobid,String jobcompany,String username){  
		try
		{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"insert into appliedjobs(jobid,empusername,username,status) values (?,?,?,?)");
		ps.setString(1,jobid);
		ps.setString(2,jobcompany);
		ps.setString(3,username);
		ps.setString(4,"Pending");
		int i = ps.executeUpdate();
		if(i>0) return true;
		}
		catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean checkApplied(String jobid,String jobcompany,String username){
		try
		{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"select * from appliedjobs where jobid=? and empusername=? and username=?");   
		ps.setString(1,jobid);
		ps.setString(2,jobcompany);
		ps.setString(3,username);
		ResultSet rs = ps.executeQuery();
		      
		if(rs.next()){
			if(jobid.equals(rs.getString("jobid"))) return false;            
		}
		}
		catch(Exception e)
		{System.out.println(e);}  
		return true;
	}
	
	public static boolean cancelApplyJob(int id){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("delete from appliedjobs where ajid=?");
        ps.setInt(1, id);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean updateJskProfile(String fname, String lname, String contactno, String gender, String dob, String email, String education, String city, 
			String state, String workexp, String category, int userid){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobseeker set firstname=?,lastname=?,contactno=?,gender=?,dob=?,email=?,education=?,city=?,state=?,workexp=?,category=? where jskid=?");
        ps.setString(1, fname);
        ps.setString(2, lname);
        ps.setString(3, contactno);
        ps.setString(4, gender);
        ps.setString(5, dob);
        ps.setString(6, email);
        ps.setString(7, education);
        ps.setString(8, city);
        ps.setString(9, state);
        ps.setString(10, workexp);
        ps.setString(11, category);
        ps.setInt(12, userid);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static String getResumeName(String username){
		try
		{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"select resumefile from jobseeker where username=?");   
		ps.setString(1,username);
		ResultSet rs = ps.executeQuery();
		      
		if(rs.next()){
			return rs.getString(1);           
		}
		}
		catch(Exception e)
		{System.out.println(e);}  
		return null;
	}
	
	public static boolean updateResume(String username,String resume){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update jobseeker set resumefile=? where username=?");
        ps.setString(1, resume);
        ps.setString(2, username);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}
	
	public static boolean removeNotification(int id){  
		try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");
        PreparedStatement ps= con.prepareStatement("update appliedjobs set status=? where ajid=?");
        ps.setString(1, "Deleted");
        ps.setInt(2, id);
        
        int i = ps.executeUpdate();
        if(i>0) return true;
        
        }catch(Exception e)
		{System.out.println(e);}  
		return false;
	}

}
