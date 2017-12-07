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
<title>Edit Profile</title>
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
		    <h1>Edit Profile</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Your Profile</h2>
				<% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from jobseeker where username=?");
                
                ps.setString(1, request.getSession().getAttribute("username").toString());    
                ResultSet rs=ps.executeQuery();
                
                while (rs.next())
                {
                %>
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="firstName"><b>First Name :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(3) %>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="lastName"><b>Last Name :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(4) %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="contact"><b>Contact Number :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(5) %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="gender"><b>Gender :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(6) %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="dob"><b>Date of Birth :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(7) %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="email"><b>Email :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(8) %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="education"><b>Education :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(9) %>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="city"><b>City :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(10) %>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="state"><b>State :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(11) %>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="workexp"><b>Work Experience :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(12) %>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="category"><b>Category :</b></label>
                <div class="col-md-9">
                    <%= rs.getString(13) %>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-actions floatRight">
                <a href="updatejskpro.jsp?jid=<%= rs.getInt(1) %>" style="text-decoration:none"><input type="button" value="Edit Profile" class="btn btn-primary btn-sm" style="margin:15px"></a>
				<a href="changejskpass.jsp" style="text-decoration:none"><input type="button" value="Change Password" class="btn btn-primary btn-sm"></a>
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