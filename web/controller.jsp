
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<%
if(request.getParameter("page").toString().equals("login")){
if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString(),request.getParameter("skey").toString())){
    
    
    session.setAttribute("userStatus", "1");
    session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
    response.sendRedirect("dashboard.jsp");

}else{
    request.getSession().setAttribute("userStatus", "-1");
    response.sendRedirect("login.jsp");
}

}else if(request.getParameter("page").toString().equals("register")){
        
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
    
         
    pDAO.addNewStudent(fName,lName,uName,email,pass,contactNo,city,address);
    response.sendRedirect("adm-page.jsp?pgprt=1");
}else if(request.getParameter("page").toString().equals("profile")){
        
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
         String uType =request.getParameter("utype");
        int uid=Integer.parseInt(session.getAttribute("userId").toString());
    
         
    pDAO.updateStudent(uid,fName,lName,uName,email,pass,contactNo,city,address,uType);
    response.sendRedirect("dashboard.jsp");
}else if(request.getParameter("page").toString().equals("courses")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
                request.getParameter("time"),request.getParameter("ekey"));
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }

}else if(request.getParameter("page").toString().equals("accounts")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delUser(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adm-page.jsp?pgprt=1");
    }

}else if(request.getParameter("page").toString().equals("questions")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
        request.getParameter("opt4"), request.getParameter("correct"));
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
        response.sendRedirect("adm-page.jsp?pgprt=3");
        
    }

}else if(request.getParameter("page").toString().equals("exams")){
    if(request.getParameter("operation").toString().equals("startexam")){
        String cName=request.getParameter("coursename");
        int userId=Integer.parseInt(session.getAttribute("userId").toString());
        Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_system","root","root");
        PreparedStatement ps2=con.prepareStatement("select * from exams where std_id='"+session.getAttribute("userId").toString()+"' and course_name='"+cName+"'");
        ResultSet rs2=ps2.executeQuery();
        if(rs2.next())
        {
          %>
            <script>alert('This Exam has been already Taken.');</script>
            <jsp:include page="std-page.jsp?pgprt=1"></jsp:include>
          <% 
        }else{
        PreparedStatement ps1=con.prepareStatement("select * from users where user_id='"+session.getAttribute("userId").toString()+"'");
        ResultSet rs1=ps1.executeQuery();
        String semail=null;
        if(rs1.next())
        {
            semail=rs1.getString(5);
        }
        PreparedStatement ps=con.prepareStatement("select * from courses where course_name='"+cName+"'");
        ResultSet rs=ps.executeQuery();
        String skey=null;
        if(rs.next())
        {
            skey=rs.getString(4);
        }
        String msg="Course Name: "+cName+"\n Your Examination Code: "+skey;
        new mail_Senddd().sendMail2(msg, session.getAttribute("userId").toString(),semail);
       %>
            <script>alert('Authorized Successfully \n Examination Code sent to registered mail id');</script>
            <%
        JFrame frame = new JFrame();
        Object result = JOptionPane.showInputDialog(frame, "Enter Exam Code:");
        
        if(skey.equals(result))    
        {
                
            int examId=pDAO.startExam(cName,userId);
            session.setAttribute("examId",examId);
            session.setAttribute("examStarted","1");
            response.sendRedirect("std-page.jsp?pgprt=1&coursename="+cName);
        
        }
        else
        {
            %>
            <script>alert('Group Cryptogaphy Authentication Failure. \n Due to Invalid Key You Entered');</script>
            <jsp:include page="std-page.jsp?pgprt=1"></jsp:include>
            <%
               // response.sendRedirect("std-page.jsp?pgprt=1");
        }}
        
    }else if(request.getParameter("operation").toString().equals("submitted")){
        try{
        String time=LocalTime.now().toString();
        int size=Integer.parseInt(request.getParameter("size"));
        int eId=Integer.parseInt(session.getAttribute("examId").toString());
        int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
        session.removeAttribute("examId");
        session.removeAttribute("examStarted");
        for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            
            int qid=Integer.parseInt(request.getParameter("qid"+i));
            
            pDAO.insertAnswer(eId,qid,question,ans);
        }
        System.out.println(tMarks+" conn\t Size: "+size);
        pDAO.calculateResult(eId,tMarks,time,size);
        
        response.sendRedirect("std-page.jsp?pgprt=1&eid="+eId+"&showresult=1");
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }

}else if(request.getParameter("page").toString().equals("logout")){
    session.setAttribute("userStatus","0");
    session.removeAttribute("examId");
    session.removeAttribute("examStarted");
    response.sendRedirect("index.jsp");
    session.removeAttribute("alert");
    
}

%>