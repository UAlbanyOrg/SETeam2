package ControllerPack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ModelPack.JobseekerDao;

/**
 * Servlet implementation class ApplyJobServlet
 */
@WebServlet("/ApplyJobServlet")
public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyJobServlet() {
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
        PrintWriter out=response.getWriter();  
          
        String jobid=request.getParameter("jjobid");
        String jobcompany=request.getParameter("jjobcompany");
        String username=request.getParameter("jusname");
        
        boolean checkapplied = JobseekerDao.checkApplied(jobid,jobcompany,username);
        
        if(checkapplied){
        	boolean status = JobseekerDao.applyJob(jobid,jobcompany,username);
            
            if(status){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Job Applied Successfully!')"); 
                out.println("location='Jobseeker/appliedjobs.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/appliedjobs.jsp");  
                rd.include(request,response); 
            }else{ 
            	out.println("<script type=\"text/javascript\">");
                out.println("alert('Application Error!')"); 
                out.println("location='Jobseeker/searchjobs.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/searchjobs.jsp");  
                rd.include(request,response); 
            }
        }else{
        	out.println("<script type=\"text/javascript\">");
            out.println("alert('Job already applied!')"); 
            out.println("location='Jobseeker/searchjobs.jsp';");
            out.println("</script>");
        	RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/searchjobs.jsp");  
            rd.include(request,response); 
        }
	}

}
