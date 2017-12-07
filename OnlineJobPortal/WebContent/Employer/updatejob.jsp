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
<title>Update Job</title>
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
		    <h1>Update Job</h1>
			</div>
		</div>
   </div> 
</div>	
<div class="container">
    <div class="single">  
	   <div class="form-container">
        <h2>Update Job</h2>
        <% 
                int id = Integer.parseInt((request.getParameter("jid")));
                Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3306/jobportal?zeroDateTimeBehavior=convertToNull","root","root");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from jobs where jid=?");        
                
                ps.setInt(1, id);
                ResultSet rs=ps.executeQuery();
                
                while (rs.next())
                {
         %>
        <form name="form" action="../EditJobServlet?jid=<%= rs.getInt(1) %>" method="post">
        <input type="hidden" name="ejobcmpyuname" id="ejobcmpyuname" value="<%= rs.getString(3) %>"/>
        <input type="hidden" name="ejobcmpy" id="ejobcmpy" value="<%= rs.getString(4) %>"/>
        <input type="hidden" name="ejobperson" id="ejobperson" value="<%= rs.getString(5) %>"/>
        <input type="hidden" name="ejobid" id="ejobid" value="<%= rs.getString(2) %>"/>
        <input type="hidden" name="selexp" id="selexp" value="<%= rs.getString(7) %>"/>
        <input type="hidden" name="seledu" id="seledu" value="<%= rs.getString(8) %>"/>
        <input type="hidden" name="seljob" id="seljob" value="<%= rs.getString(9) %>"/>
        <input type="hidden" name="selstate" id="selstate" value="<%= rs.getString(13) %>"/>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobid">Job Id</label>
                <div class="col-md-9">
                    <b><%= rs.getString(2) %></b>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobtitle">Job Title</label>
                <div class="col-md-9">
                    <input type="text" name="ejobtitle" id="ejobtitle" value="<%= rs.getString(6) %>" class="form-control input-sm" required/>
                </div>
            </div>
         </div>
          <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobexp">Work Experience</label>
                <div class="col-md-9">
                    <select name="ejobexp" id="ejobexp" class="form-control input-sm" required>
                        <option value="">-- Select Work Experience --</option>
                        <option value="fresher">Fresher</option>
                        <option value="1-3 Years">1 - 3 Years</option>
                        <option value="3-5 Years">3 - 5 Years</option>
                        <option value="5-8 Years">5 - 8 Years</option>
                        <option value="8-12 Years">8 - 12 Years</option> 
                        <option value="12-16 Years">12 - 16 Years</option> 
                        <option value="16-20 Years">16 - 20 Years</option> 
                        <option value="20+ Years">20+ Years</option>    
                    </select>
                </div>
            </div>
         </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobedu">Education</label>
                <div class="col-md-9">
                    <select name="ejobedu" id="ejobedu" class="form-control input-sm" required>
                        <option value="">-- Select Education --</option>
    					<option value="No Formal Education">No Formal Education</option>
    					<option value="Primary Education">Primary Education</option>
    					<option value="Secondary Education">Secondary Education</option>
    					<option value="Diploma Certificate">Diploma Certificate</option>
    					<option value="Bachelor's Degree">Bachelor's Degree</option>
    					<option value="Master's Degree">Master's Degree</option>
						<option value="Doctorate or higher">Doctorate or higher</option>   
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobcategory">Job Category</label>
                <div class="col-md-9">
                    <select name="ejobcategory" id="ejobcategory" class="form-control input-sm" required>
                        <option value="">-- Select Job Category --</option>
                        <option value="Accounting / Auditing / Tax">Accounting / Auditing / Tax</option>
<option value="Administration / Secretary / Front Office">Administration / Secretary / Front Office</option>
<option value="Architecture / Civil Engineering">Architecture / Civil Engineering</option>
<option value="Art / Design / Creative / Fashion">Art / Design / Creative / Fashion</option>
<option value="Banking / Financial Services">Banking / Financial Services</option>
<option value="Construction">Construction</option>
<option value="Consulting / Strategy / Corporate Planning">Consulting / Strategy / Corporate Planning</option>
<option value="Content / Edition / Journalism">Content / Edition / Journalism</option>
<option value="Customer Service / Call Centre / Operations / Data Entry">Customer Service / Call Centre / Operations / Data Entry</option>
<option value="Education / Teaching / Language">Education / Teaching / Language</option>
<option value="Engineering / R&D">Engineering / R&D</option>
<option value="Executive Management">Executive Management</option>
<option value="Freshers Jobs">Freshers Jobs</option>
<option value="Healthcare / Medical / Pharmacy">Healthcare / Medical / Pharmacy</option>
<option value="Hotel / Restaurant / Catering">Hotel / Restaurant / Catering</option>
<option value="HR / Recruitment">HR / Recruitment</option>
<option value="Import-Export / Merchandising / Trading">Import-Export / Merchandising / Trading</option>
<option value="Insurance">Insurance</option>
<option value="Internet Technologies / Web / E-Commerce">Internet Technologies / Web / E-Commerce</option>
<option value="IT - Databases / Datawarehousing">IT - Databases / Datawarehousing</option>
<option value="IT - ERP / CRM">IT - ERP / CRM</option>
<option value="IT - Hardware / Telecom / Support">IT - Hardware / Telecom / Support</option>
<option value="IT - Project Management">IT - Project Management</option>
<option value="IT - Software Programming / Analysis">IT - Software Programming / Analysis</option>
<option value="IT - Systems / Networking / Security">IT - Systems / Networking / Security</option>
<option value="Legal / Law">Legal / Law</option>
<option value="Logistics / Purchase / Supply Chain / Procurement">Logistics / Purchase / Supply Chain / Procurement</option>
<option value="Manufacturing / Packaging / Printing / Industrial Jobs">Manufacturing / Packaging / Printing / Industrial Jobs</option>
<option value="Marketing / Communication / Advertising / PR">Marketing / Communication / Advertising / PR</option>
<option value="Mechanical Engineering / Mechatronics">Mechanical Engineering / Mechatronics</option>
<option value="Media / TV / Films / Production">Media / TV / Films / Production</option>
<option value="Pharma, Biotech and Chemical Industry">Pharma, Biotech and Chemical Industry</option>
<option value="Project Management">Project Management</option>
<option value="Quality / Testing / Process Control">Quality / Testing / Process Control</option>
<option value="Real Estate / Property">Real Estate / Property</option>
<option value="Sales / Business Development">Sales / Business Development</option>
<option value="Security Services / Guards">Security Services / Guards</option>
<option value="Skilled Trade / Service / Installation / Repair">Skilled Trade / Service / Installation / Repair</option>
<option value="Social Services / NGOs / Nonprofit">Social Services / NGOs / Nonprofit</option>
<option value="Travel / Reservation / Airlines">Travel / Reservation / Airlines</option>
<option value="Others">Others</option>
                    </select>
               </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobskills">Key Skills</label>
                <div class="col-md-9">
                    <input type="text" name="ejobskills" id="ejobskills" value="<%= rs.getString(10) %>" class="form-control input-sm" required/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobdesp">Job Description</label>
                <div class="col-md-9">
                    <textarea name="ejobdesp" id="ejobdesp" class="form-control input-sm" required><%= rs.getString(11) %></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobcity">City</label>
                <div class="col-md-9">
                    <input type="text" name="ejobcity" id="ejobcity" value="<%= rs.getString(12) %>" class="form-control input-sm" required/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3 control-lable" for="ejobstate">State</label>
                <div class="col-md-9">
                    <select name="ejobstate" id="ejobstate" class="form-control input-sm" required>
                        <option value="">-- Select State --</option>
                        <option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
                    </select>
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-actions floatRight">
                <input type="submit" value="Update Job" class="btn btn-primary btn-sm">
                <input type="button" value="Cancel" class="btn btn-primary btn-sm" onclick="window.location.href='editjobs.jsp';">
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
<script>
$(function() {
	$("#ejobexp").val($("#selexp").val());
	$("#ejobedu").val($("#seledu").val());
	$("#ejobcategory").val($("#seljob").val());
	$("#ejobstate").val($("#selstate").val());
});
</script> 
</body>
</html>	