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
 * Servlet implementation class DelNotiServlet
 */
@WebServlet("/DelNotiServlet")
public class DelNotiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelNotiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
    
        int id = Integer.parseInt(request.getParameter("ajid"));

        boolean result = false;

        	result = EmployerDao.removeAppliedJob(id);
        	if(result){		
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Removed Successfully!')"); 
    	        out.println("location='Employer/empnotify.jsp';");
    	        out.println("</script>");
    			RequestDispatcher rd=request.getRequestDispatcher("Employer/empnotify.jsp");  
    	        rd.include(request,response);
    	
    		}else{
    			out.println("<script type=\"text/javascript\">");
    	        out.println("alert('Error while removing!')"); 
    	        out.println("location='Employer/empnotify.jsp';");
    	        out.println("</script>");
    		RequestDispatcher rd=request.getRequestDispatcher("Employer/empnotify.jsp");  
            rd.include(request,response);
    		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
