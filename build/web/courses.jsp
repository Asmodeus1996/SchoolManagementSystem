
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
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
						<a class="active" href="adm-page.jsp?pgprt=2"><h2>Add/View Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Add/View Test</h2></a>
						<a  href="adm-page.jsp?pgprt=1"><h2>Student Profiles</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            
                            <div class="panel" style="max-width: 420px;float:right">
                                <div class="title">
                                   All Courses
                                </div>
                                <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	<th scope="col">Course Name</th>
                
            <th scope="col">Total Marks</th>
           
            <th scope="col">Action</th>
            
        </tr>
    </thead>
    
                                       
        <% 
            ArrayList list=pDAO.getAllCourses();
            for(int i=0;i<list.size();i=i+2){
        %>
        <tr>
        <td><%=list.get(i)%></td>
        <td><%=list.get(i+1)%></td>
        <td ><a  href="controller.jsp?page=courses&operation=del&cname=<%=list.get(i)%>" 
                onclick="return confirm('Are you sure you want to delete this ?');" class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
            </a></td>
    </tr>
            <%
            }
            %>
            </table>
        </div>
        <div  class="panel form-style-6" style="max-width: 450px;margin-left: 50px;" >
           <div class="title">
                                   Add New Course
                                </div>
            <center>
               <form action="controller.jsp" >
                   <br>
                   <table >
                       <tr>
                           <td><label>Course Name</label></td>
                           <td> <input type="text" name="coursename" class="text" placeholder="Course Name"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td><label>Total Marks</label></td>
                           <td><input type="text" name="totalmarks" class="text" placeholder="Integer Only" style="width: 230px;" ></td>
                       </tr>
                       <tr>
                           <td><label>Exam Time</label></td>
                           <td>
                                <input type="text" name="time" class="text" placeholder="In Minutes" style="width: 230px;" >
                           </td>
                           
                       </tr>
                       <%
                        Random RANDOM = new SecureRandom();
                int PASSWORD_LENGTH = 15;
                String letters = "qw2rtyuioplkj34hgfdsazxASDFGHJKL26QWERTYU1OP";
                String Secretkey = "";
                for (int i = 0; i < PASSWORD_LENGTH; i++) {
                    int index = (int) (RANDOM.nextDouble() * letters.length());
                    Secretkey += letters.substring(index, index + 1);
                }
                       %>
                       <tr>
                           <td><label>Exam Code</label></td>
                           <td>
                               <input type="text" name="ekey" class="text" value="<%=Secretkey%>" style="width: 230px;" readonly>
                           </td>
                           
                       </tr>
                       <tr>
                           <td colspan="2"><input type="hidden" name="page" value="courses">
                    <input type="hidden" name="operation" value="addnew">
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                       </tr>
                   </table>

                </form>
            </center>
           
    </div>
     </div>
                       