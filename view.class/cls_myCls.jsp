<%@page import="kr.or.ddit.pitapet.vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ClassVO> myClsList = (List<ClassVO>)request.getAttribute("myClsList");
System.out.println("edu_myEdu.jsp의 서블릿에서 받은 리스트 : " + myClsList);
%>

[

<% 
if(myClsList != null && myClsList.size() > 0){
	
for(int i = 0 ; i < myClsList.size(); i++){
	ClassVO vo = myClsList.get(i);
	
	if(i>0)out.print(",");
%>

{	
	"cls_subject" : "<%=vo.getCls_subject()%>",
	"cls_content" : "<%=vo.getCls_content() %>",
	"cls_price" : "<%=vo.getCls_price() %>",
	"cls_count" : "<%=vo.getCls_count()%>",
	"emp_name" : "<%=vo.getEmp_name() %>",
	"cls_status" : "<%=vo.getCls_status() %>"
}
<%
	}
}else {
%>
{
	"cls_subject" : "자료 없음"
}
<%	
}
	%>

]
