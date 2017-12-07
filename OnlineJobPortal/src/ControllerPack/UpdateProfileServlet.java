package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.EmployerDao;
import ModelPack.JobseekerDao;
/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("userid"));
        String type=request.getParameter("type");
        
        boolean result = false;
        if(type.equalsIgnoreCase("jobseeker")){
            String fname=request.getParameter("jskFirstName");
            String lname=request.getParameter("jskLastName");
            String contact=request.getParameter("jskContact");
            String gender=request.getParameter("jskGender");
            String dob=request.getParameter("jskDob");
            String email=request.getParameter("jskEmail");
            String education=request.getParameter("jskEducation");
            String city=request.getParameter("jskCity");
            String state=request.getParameter("jskState");
            String workexp=request.getParameter("jskWorkexp");
            String category=request.getParameter("jskCategory");
        	result = JobseekerDao.updateJskProfile(fname,lname,contact,gender,dob,email,education,city,state,workexp,category,id);
        	if(result){		
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Profile Updated Successfully!')"); 
    	        out.println("location='Jobseeker/editjskprofile.jsp';");
    	        out.println("</script>");
    			RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/editjskprofile.jsp");  
    	        rd.include(request,response);
        	}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Error while updating!')"); 
    	        out.println("location='Jobseeker/editjskprofile.jsp';");
    	        out.println("</script>");
    	        RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/editjskprofile.jsp");  
    	        rd.include(request,response);
    		}
        }else {
        	String cmpuname=request.getParameter("username");
        	String cmpname=request.getParameter("ecmpName");
            String contactname=request.getParameter("econtactName");
            String contactno=request.getParameter("econtactEmp");
            String email=request.getParameter("eemailEmp");
            String city=request.getParameter("ecityEmp");
            String state=request.getParameter("estateEmp");
            String category=request.getParameter("ecategoryEmp");
        	result = EmployerDao.updateEmpProfile(cmpname,contactname,contactno,email,city,state,category,id);
        	if(result){
        		boolean success = EmployerDao.updateEmpJobs(cmpuname,cmpname,contactname);
        		if(success){
        			out.println("<script type=\"text/javascript\">");
        	        out.println("alert('Profile Updated Successfully!')"); 
        	        out.println("location='Employer/editempprofile.jsp';");
        	        out.println("</script>");
        			RequestDispatcher rd=request.getRequestDispatcher("Employer/editempprofile.jsp");  
        	        rd.include(request,response);
        		}else{
        			out.println("<script type=\"text/javascript\">");
        	        out.println("alert('Error while updating!')"); 
        	        out.println("location='Employer/editempprofile.jsp';");
        	        out.println("</script>");
        	        RequestDispatcher rd=request.getRequestDispatcher("Employer/editempprofile.jsp");  
        	        rd.include(request,response);
        		}
        	}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Error while updating!')"); 
    	        out.println("location='Employer/editempprofile.jsp';");
    	        out.println("</script>");
    	        RequestDispatcher rd=request.getRequestDispatcher("Employer/editempprofile.jsp");  
    	        rd.include(request,response);
    		}
        } 
	}

}
