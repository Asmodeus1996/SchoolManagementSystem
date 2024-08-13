
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body>
	<div class="top-area">
            <center><h2><font color="Green">Student Home Page</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>
    
    <%
            if(session.getAttribute("userStatus")!=null){
           if(session.getAttribute("userStatus").equals("1")){
            %>
            	
            <div class="menu">
            <a href="std-page.jsp?pgprt=0" class="button">View profile</a>
            <a class="button" href="std-page.jsp?pgprt=1">Online Test</a>
            <a class="button" href="std-page.jsp?pgprt=2">View Results</a>
            <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
            </div>
            <% 
            //pgpart = pagepart, exams=1,results=2 and profile is default
            if(request.getParameter("pgprt").equals("1")){
                  if(session.getAttribute("alert")==null){
                  
                   %>
            
            <jsp:include page="terms.jsp"/>
           
            
            <%
                  
                  }else{
            %>
            
            <jsp:include page="exam.jsp"/>
           
            
            <%
                }
            }else if(request.getParameter("pgprt").equals("2")){
            
                %>
            
                <jsp:include page="results.jsp"/>
                
                <%
                
            }else{
                %>
            
                <jsp:include page="profile.jsp"/>
            
            <%
            }
            %>
            
            <%
           }else response.sendRedirect("login.jsp");
            }else response.sendRedirect("login.jsp");
            
          
           %>
            
           </body>
</html>
            
