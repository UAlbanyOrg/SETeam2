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
<title>Notifications</title>
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
	$("#searchjnotify").on("keyup", function() {
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
		    <h1>Notifications</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
    <input type="text" id="searchjnotify" placeholder="Search Here"/>
    		<h2>Notifications</h2>  
                <% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
  
                PreparedStatement ps=con.prepareStatement(
                "select jobs.jobid,jobs.jobtitle,jobs.companyname,appliedjobs.status,appliedjobs.ajid from jobs inner join appliedjobs on jobs.jobid = appliedjobs.jobid and jobs.empusername = appliedjobs.empusername and appliedjobs.username=? and appliedjobs.status<>?");
                
                ps.setString(1, request.getSession().getAttribute("username").toString());
                ps.setString(2, "Deleted");
                ResultSet rs=ps.executeQuery();
                
                while (rs.next())
                {
                %>
                <div class="panel panel-default">
				<div class="panel-body">
				<div class="col-lg-12"><p><b>Status:</b> Your Application is <%= rs.getString(4) %> </p></div>
				<div class="col-lg-4"><p><b>Applied for Job Id:</b> <%= rs.getString(1) %> </p></div>
				<div class="col-lg-4"><p><b>Job Title:</b> <%= rs.getString(2) %> </p></div>
				<div class="col-lg-4"><p><b>Company:</b> <%= rs.getString(3) %> </p></div>
				<a href="../UpdNotiServlet?ajid=<%= rs.getInt(5) %>" style="text-decoration:none"><input type="button" value="Remove Notification" class="btn btn-primary btn-sm" style="margin:15px"></a>
				</div>
				</div>
                <%
                }
                %>
</div>  
</div>
</div>
<div class="footer">
	<div class="container">
		<div class="copy">
		<p>Copyright � 2017 Job Portal. All Rights Reserved.</p>
	</div>
	</div>
</div>
</body>
</html>	