
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="myPackage.classes.Answers"%>
<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>
					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>View Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Add/View Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Add/View Test</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Student Profiles</h2></a>
                                                <a class="active"  href="adm-page.jsp?pgprt=5"><h2>Test Results</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 1000px">
                                
       
        <div class="title">All Results</div>
        <table id="rounded-corner" width="930" style="margin-left:10px;">
    <thead>
    	<tr align="center">
        	<th scope="col" class="rounded-company">Date</th>
                <th scope="col" class="rounded-q1">Student ID</th>
            <th scope="col" class="rounded-q1">Course Name</th>
            <th scope="col" class="rounded-q2">Total Marks</th>
             <th scope="col" class="rounded-q2">Obtained Marks</th>
           <th scope="col" class="rounded-q2">Negative Marks</th>
           <th scope="col" class="rounded-q2">Final Marks</th>
            <th scope="col" class="rounded-q3">Starting at</th>
            <th scope="col" class="rounded-q4">Closed at</th>
            <th scope="col" class="rounded-q4">Status</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%
        Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_system","root","root");
        PreparedStatement ps1=con.prepareStatement("select * from exams ORDER BY obt_marks DESC");
        ResultSet rs1=ps1.executeQuery();
     
        while(rs1.next())
        {
           
            %>
    	<tr align="center">
            <td><%=rs1.getString(6)%></td>
            <td><%=rs1.getString(2)%></td>
            <td><%=rs1.getString(3)%></td>
            <td><%=rs1.getString(4)%></td>
            <td><%=rs1.getString(5)%></td>
          <%
          int rmarks=Integer.parseInt(rs1.getString(4))-Integer.parseInt(rs1.getString(5));
                  double ss=rmarks/3;
                  double originalmarks=Double.parseDouble(rs1.getString(5))-ss;
                  System.out.println("ddd "+originalmarks);
          
          
          %>  
            <td><%=new DecimalFormat("###.#").format(ss)%></td>
            <td style="background:blue;color:white"><%=new DecimalFormat("###.#").format(originalmarks)%></td>
            
            <td><%=rs1.getString(7)%></td>
            <td><%=rs1.getString(8)%></td>
            
            <%if(rs1.getString(10).equals("Pass")){%>
                <td style="background: #00cc33;color:white"><%=rs1.getString(10)%></td>
            <% }else{%>
            <td style="background: #ff3333;color:white"><%=rs1.getString(10)%></td>
            <% }%>
             </tr>
       
       <% }
       %>
    </tbody>
</table>
       
                            </div>