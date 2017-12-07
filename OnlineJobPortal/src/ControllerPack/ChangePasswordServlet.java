package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.AuthDao;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
        
        String uname = request.getParameter("username");
        String type=request.getParameter("type");
        
        boolean result = false;
        boolean success = false;
        boolean verify = false;
        if(type.equalsIgnoreCase("Jobseeker")){
        	String oldpass=request.getParameter("jskOldPass");
            String newpass=request.getParameter("jskNewPass");
        	result = AuthDao.checkOldPassword(uname,type,oldpass);
        	if(result){
        		success = AuthDao.checkNewPassword(uname,type,newpass);
        		if(success){
        			verify = AuthDao.changePassword(uname,type,newpass);
        			if(verify){
        				out.println("<script type=\"text/javascript\">");
            	        out.println("alert('Password Updated Successfully!')"); 
            	        out.println("location='Jobseeker/editjskprofile.jsp';");
            	        out.println("</script>");
            			RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/editjskprofile.jsp");  
            	        rd.include(request,response);
        			}else{
        				out.println("<script type=\"text/javascript\">");
            	        out.println("alert('Error while changing password!')"); 
            	        out.println("location='Jobseeker/changejskpass.jsp';");
            	        out.println("</script>");
            		RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/changejskpass.jsp");  
                    rd.include(request,response);
        			}
        		}else{
        			out.println("<script type=\"text/javascript\">");
        	        out.println("alert('New password same as current password!')"); 
        	        out.println("location='Jobseeker/changejskpass.jsp';");
        	        out.println("</script>");
        		RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/changejskpass.jsp");  
                rd.include(request,response);
        		}
        	}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Invalid current password!')"); 
    	        out.println("location='Jobseeker/changejskpass.jsp';");
    	        out.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/changejskpass.jsp");  
            rd.include(request,response);
    		}
        }else {
        	String oldpass=request.getParameter("empOldPass");
            String newpass=request.getParameter("empNewPass");
        	result = AuthDao.checkOldPassword(uname,type,oldpass);
        	if(result){
        		success = AuthDao.checkNewPassword(uname,type,newpass);
        		if(success){
        			verify = AuthDao.changePassword(uname,type,newpass);
        			if(verify){
        				out.println("<script type=\"text/javascript\">");
            	        out.println("alert('Password Updated Successfully!')"); 
            	        out.println("location='Employer/editempprofile.jsp';");
            	        out.println("</script>");
            			RequestDispatcher rd=request.getRequestDispatcher("Employer/editempprofile.jsp");  
            	        rd.include(request,response);
        			}else{
        				out.println("<script type=\"text/javascript\">");
            	        out.println("alert('Error while changing password!')"); 
            	        out.println("location='Employer/changeemppass.jsp';");
            	        out.println("</script>");
            		RequestDispatcher rd=request.getRequestDispatcher("Employer/changeemppass.jsp");  
                    rd.include(request,response);
        			}
        		}else{
        			out.println("<script type=\"text/javascript\">");
        	        out.println("alert('New password same as current password!')"); 
        	        out.println("location='Employer/changeemppass.jsp';");
        	        out.println("</script>");
        		RequestDispatcher rd=request.getRequestDispatcher("Employer/changeemppass.jsp");  
                rd.include(request,response);
        		}
        	}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Invalid current password!')"); 
    	        out.println("location='Employer/changeemppass.jsp';");
    	        out.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("Employer/changeemppass.jsp");  
            rd.include(request,response);
    		}
        } 
	}

}
