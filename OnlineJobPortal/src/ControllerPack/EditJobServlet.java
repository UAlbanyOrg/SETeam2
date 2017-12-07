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

/**
 * Servlet implementation class EditJobServlet
 */
@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditJobServlet() {
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
        
        int id = Integer.parseInt(request.getParameter("jid"));
        
        boolean result = false;
        String cmpuname=request.getParameter("ejobcmpyuname");
        String cmpname=request.getParameter("ejobcmpy");
        String contactname=request.getParameter("ejobperson");
        String jobid=request.getParameter("ejobid");
        String jobtitle=request.getParameter("ejobtitle");
        String workexp=request.getParameter("ejobexp");
        String education=request.getParameter("ejobedu");
        String category=request.getParameter("ejobcategory");
        String keyskills=request.getParameter("ejobskills");
        String jobdesp=request.getParameter("ejobdesp");
        String city=request.getParameter("ejobcity");
        String state=request.getParameter("ejobstate");
    	result = EmployerDao.updateJob(jobid,cmpuname,cmpname,contactname,jobtitle,workexp,education,category,keyskills,jobdesp,city,state,id);
    	if(result){
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Updated Successfully!')"); 
	        out.println("location='Employer/editjobs.jsp';");
	        out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("Employer/editjobs.jsp");  
	        rd.include(request,response);
    	}else{
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Error while updating!')"); 
	        out.println("location='Employer/editjobs.jsp';");
	        out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("Employer/editjobs.jsp");  
        rd.include(request,response);
		}
	}

}
