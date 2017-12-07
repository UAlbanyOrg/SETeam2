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
        if ((session.getAttribute("username")).toString() == null || (session.getAttribute("type")).toString() != "employer") {
            response.sendRedirect("../login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
<title>Edit Jobs</title>
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
	$("#searchedit").on("keyup", function() {
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
	            <li><a href="employermain.jsp">Home</a></li>
	        	<li><a href="postjob.jsp">Post Job</a></li>
	        	<li><a href="searchjobseekers.jsp">Search Jobseekers</a></li>
	        	<li><a href="empnotify.jsp">Notifications</a></li>
		        <li><a href="editjobs.jsp">Edit Jobs</a></li>
		        <li><a href="editempprofile.jsp">Edit Profile</a></li>
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
		   <h4>Welcome <%=request.getSession().getAttribute("contactname") %> || <%=request.getSession().getAttribute("cmpname") %></h4>
		    <h1>Edit Jobs</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
    <input type="text" id="searchedit" placeholder="Search Here"/>
    		<h2>Current Jobs</h2>  
                <% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from jobs where empusername=?");
                
                ps.setString(1, request.getSession().getAttribute("username").toString());    
                ResultSet rs=ps.executeQuery();
                
                while (rs.next())
                {
                %>
				<div class="panel panel-default">
				<div class="panel-body">
				<div class="col-lg-4"><p><b>Job Id:</b> <%= rs.getString(2) %> </p></div>
				<div class="col-lg-4"><p><b>Job Title:</b> <%= rs.getString(6) %> </p></div>
				<div class="col-lg-4"><p><b>Work Experience:</b> <%= rs.getString(7) %> </p></div>
				<div class="col-lg-4"><p><b>Education:</b> <%= rs.getString(8) %> </p></div>
				<div class="col-lg-4"><p><b>Job Category:</b> <%= rs.getString(9) %> </p></div>
				<div class="col-lg-4"><p><b>Location:</b> <%= rs.getString(12) %>, <%= rs.getString(13) %> </p></div>
				<div class="col-lg-8"><p><b>Job Description:</b> <%= rs.getString(11) %> </p></div>
				<div class="col-lg-4"><p><b>Key Skills:</b> <%= rs.getString(10) %> </p></div>
				<a href="updatejob.jsp?jid=<%= rs.getInt(1) %>" style="text-decoration:none"><input type="button" value="Edit Job" class="btn btn-primary btn-sm" style="margin:15px"></a>
				<a href="../DeleteJobServlet?jid=<%= rs.getInt(1) %>" style="text-decoration:none"><input type="button" value="Delete Job" class="btn btn-primary btn-sm"></a>
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
		<p>Copyright © 2017 Job Portal. All Rights Reserved.</p>
	</div>
	</div>
</div> 
</body>
</html>	