package ControllerPack;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ModelPack.JobseekerDao;

/**
 * Servlet implementation class UploadResumeServlet
 */
@WebServlet("/UploadResumeServlet")
@MultipartConfig 
public class UploadResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadResumeServlet() {
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
        String uname = request.getParameter("username");
        Part filePart = request.getPart("updresume");
        String resumefile = filePart.getSubmittedFileName();
        
        String oldresume = JobseekerDao.getResumeName(uname);
        boolean status = JobseekerDao.updateResume(uname,resumefile);
        
        if(status){
        	OutputStream output = null;
            InputStream filecontent = null;
            String filePath = getServletContext().getRealPath("/Resume");
            filePath = filePath.substring(0,filePath.indexOf("\\.metadata"));
            
            try{
                File dir = new File(filePath + "\\OnlineJobPortal\\WebContent\\Resume");
                           if (!dir.exists()) {
                            dir.mkdirs();
                            }
                File oldfile = new File(dir + File.separator + oldresume);
                if(oldfile.exists() && oldfile.isFile()) { 
                    oldfile.delete();
                }
               output = new FileOutputStream(new File(dir + File.separator + resumefile));
               filecontent = filePart.getInputStream();
               int read;
               final byte[] bytes = new byte[1024];
               while ((read = filecontent.read(bytes))!=-1){
                   output.write(bytes, 0, read);
               }
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Resume Uploaded Successfully!')"); 
               out.println("location='Jobseeker/uploadresume.jsp';");
               out.println("</script>");
               RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/uploadresume.jsp");   
               rd.include(request,response);
               } catch (Exception e) {
                out.println("Error in file upload <br/> ERROR:" + e.getMessage());
            } finally {
                if (output != null){
                    output.close();
                }
                if (filecontent != null){
                    filecontent.close();
                }
                if (out != null){
                    out.close();
                }
            }
        }else{
        	out.println("<script type=\"text/javascript\">");
	        out.println("alert('Error while updating resume!')"); 
	        out.println("location='Jobseeker/uploadresume.jsp';");
	        out.println("</script>");
	        RequestDispatcher rd=request.getRequestDispatcher("Jobseeker/uploadresume.jsp");  
	        rd.include(request,response);
        }
        
	}

}
