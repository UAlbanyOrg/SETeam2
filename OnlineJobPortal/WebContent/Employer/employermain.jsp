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
<title>Employer Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href="../css/font-awesome.css" rel="stylesheet"> 
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
		    <h1>Employer Home</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container" style="margin-bottom:3em">
    <div class="single" style="padding:2em 0">  
	   <div class="col-lg-12">
	   <div class="col-lg-6" style="text-align:center">
	   <a href="postjob.jsp"><i class="fa fa-suitcase" style="font-size:7em"></i></a>
	   <p style="font-size:30px;color:#333">Post Job</p>
	   </div><div class="col-lg-6" style="text-align:center">
	   <a href="searchjobseekers.jsp"><i class="fa fa-users" style="font-size:7em"></i></a>
	   <p style="font-size:30px;color:#333">Search Jobseekers</p>
	   </div></div>
	   <div class="col-lg-12" style="margin-top: 2%;">
	   <div class="col-lg-6" style="text-align:center">
	   <a href="empnotify.jsp"><i class="fa fa-random" style="font-size:7em"></i></a>
	   <p style="font-size:30px;color:#333">Notifications</p>
	   </div><div class="col-lg-6" style="text-align:center">
	   <a href="editjobs.jsp"><i class="fa fa-pencil-square-o" style="font-size:7em"></i></a>
	   <p style="font-size:30px;color:#333">Edit Jobs</p>
	   </div></div>
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