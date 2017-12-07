<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache");
%>
<%
    try {
        if ((session.getAttribute("username")).toString() == null || (session.getAttribute("type")).toString() != "jobseeker") {
            response.sendRedirect("../login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
<title>Search Jobs</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href="../css/font-awesome.css" rel="stylesheet">
<script>
$(function() {
	$("#searchjob").on("keyup", function() {
	    var g = $(this).val().toLowerCase();
	    $(".panel .panel-body").each(function() {
	        var s = $(this).text().toLowerCase();
	        $(this).closest('.panel')[ s.indexOf(g) !== -1 ? 'show' : 'hide' ]();
	    });
	});
});
</script>   
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png" width="160" height="70" alt=""/></a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
	        	<li><a href="jobseekermain.jsp">Home</a></li>
	        	<li><a href="searchjobs.jsp">Search Jobs</a></li>
		        <li><a href="appliedjobs.jsp">Applied Jobs</a></li>
		        <li><a href="jsknotify.jsp">Notifications</a></li>
		        <li><a href="uploadresume.jsp">Upload Resume</a></li>
		        <li><a href="editjskprofile.jsp">Edit Profile</a></li>
		        <li><a href="../LogoutServlet">Logout</a></li>
			</ul>
	    </div>
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
	</nav>
<div class="banner_1">
	<div class="container">
		<div id="search_wrapper1">
		   <div id="search_form" class="clearfix">
		   <h4>Welcome <%=request.getSession().getAttribute("firstname") %> <%=request.getSession().getAttribute("lastname") %></h4>
		    <h1>Search Jobs</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
    <input type="text" id="searchjob" placeholder="Search Here"/>
    		<h2>Search Jobs</h2>  
                <% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from jobs where not exists (select * from appliedjobs where appliedjobs.jobid = jobs.jobid and appliedjobs.empusername = jobs.empusername and username=?)");
                
                ps.setString(1, request.getSession().getAttribute("username").toString());
                ResultSet rs=ps.executeQuery();
                
                while (rs.next())
                {
                %>
                <form name="form" action="../ApplyJobServlet" method="post">
                <input type="hidden" name="jjobid" id="jjobid" value="<%= rs.getString(2) %>"/>
                <input type="hidden" name="jjobcompany" id="jjobcompany" value="<%= rs.getString(3) %>"/>
                <input type="hidden" name="jusname" id="jusname" value="<%=request.getSession().getAttribute("username") %>"/>
				<div class="panel panel-default">
				<div class="panel-body">
				<div class="col-lg-4"><p><b>Job Id:</b> <%= rs.getString(2) %> </p></div>
				<div class="col-lg-4"><p><b>Job Title:</b> <%= rs.getString(6) %> </p></div>
				<div class="col-lg-4"><p><b>Company:</b> <%= rs.getString(4) %> </p></div>
				<div class="col-lg-4"><p><b>Work Experience:</b> <%= rs.getString(7) %> </p></div>
				<div class="col-lg-4"><p><b>Education:</b> <%= rs.getString(8) %> </p></div>
				<div class="col-lg-4"><p><b>Job Category:</b> <%= rs.getString(9) %> </p></div>
				<div class="col-lg-4"><p><b>Key Skills:</b> <%= rs.getString(10) %> </p></div>
				<div class="col-lg-4"><p><b>Location:</b> <%= rs.getString(12) %>, <%= rs.getString(13) %> </p></div>
				<div class="col-lg-4"><p><b>Posted By:</b> <%= rs.getString(5) %> </p></div>
				<div class="col-lg-12"><p><b>Job Description:</b> <%= rs.getString(11) %> </p></div>
				<input type="submit" value="Apply" class="btn btn-primary btn-sm" style="margin:15px">
				</div>
				</div>
				</form>
                <%
                }
                %>
</div>	   
</div>
</div>
<div class="footer">
	<div class="container">
		<div class="copy">
		<p>Copyright © 2017 Job Portal. All Rights Reserved.</p>
	</div>
	</div>
</div>
</body>
</html>	