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
import ModelPack.EmployerDao;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostJobServlet() {
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
         
        String cmpuname=request.getParameter("jobcmpyuname");
        String cmpname=request.getParameter("jobcmpy");
        String contactname=request.getParameter("jobperson");
        String jobid=request.getParameter("jobid");
        String jobtitle=request.getParameter("jobtitle");
        String workexp=request.getParameter("jobexp");
        String education=request.getParameter("jobedu");
        String category=request.getParameter("jobcategory");
        String keyskills=request.getParameter("jobskills");
        String jobdesp=request.getParameter("jobdesp");
        String city=request.getParameter("jobcity");
        String state=request.getParameter("jobstate");
        
        boolean checkjobid = EmployerDao.checkJobId(jobid,cmpuname);
        
        if(checkjobid){
        	boolean status = EmployerDao.addNewJob(jobid,cmpuname,cmpname,contactname,jobtitle,workexp,education,category,keyskills,jobdesp,city,state);
            
            if(status){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Job Posted Successfully!')"); 
                out.println("location='Employer/editjobs.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Employer/editjobs.jsp");  
                rd.include(request,response); 
            }else{ 
            	out.println("<script type=\"text/javascript\">");
                out.println("alert('Job Posting Error!')"); 
                out.println("location='Employer/postjob.jsp';");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("Employer/postjob.jsp");  
                rd.include(request,response); 
            }
        }else{
        	out.println("<script type=\"text/javascript\">");
            out.println("alert('Job ID already exists!')"); 
            out.println("location='Employer/postjob.jsp';");
            out.println("</script>");
        	RequestDispatcher rd=request.getRequestDispatcher("Employer/postjob.jsp");  
            rd.include(request,response); 
        }
        
	}

}
