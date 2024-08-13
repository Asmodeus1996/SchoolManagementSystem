
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
                                                <a class="active" href="adm-page.jsp?pgprt=3"><h2>Add/View Test</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Student Profiles</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            <div class="content-area" >
                <center>
        <%
           if(request.getParameter("coursename")!=null){
               ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
               for(int i=0;i<list.size();i++){
                   Questions question=(Questions)list.get(i);
                   
                   %>
                   <div class="question-panel" style="margin-left: 140px;">
						<div class="question" style="font-size:16px;min-height: 50px;">
                                                    <label class="question-label"><%=i+1 %></label>
						<%=question.getQuestion() %>	
<a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId() %>" 
                                                                             onclick="return confirm('Are you sure want to delete this ?');" >
    <div class="delete-btn" style="position: absolute;right: 10px;top: -20px;">delete</div></a>
                                                </div>
						<div class="answer" style="font-size:15px;">
                                                        <label class="show"><%=question.getOpt1() %></label>
							<label class="show"><%=question.getOpt2() %></label>
							<label class="show"><%=question.getOpt3() %></label>
							<label class="show"><%=question.getOpt4() %></label>
                                                        <label class="show-correct"><%=question.getCorrect() %></label>
						</div>
					</div>
                   
                   <%
               }
          } %>
       </center>
            </div>